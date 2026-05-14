---
name: obsidian-mcp
description: >
  Vault operation safety layer for all Obsidian read/search/write/tag/edit/verify
  operations through MCP tools. Load when any vault CRUD, frontmatter, tags, search,
  batch edits, or verification is needed. Do NOT use alone for knowledge-workflow
  decisions; combine with the corresponding workflow skill.
license: Apache-2.0
compatibility:
  runtime: opencode
  requires: [obsidian-mcp-server]
  verified-host: "obsidian-mcp-server@3.1.5 / Windows / 2026-05-10"
metadata:
  version: "4.0.0"
  last-reviewed: "2026-05-14"
  owner: r007b34r
  eval-status: regression-evals-defined
  token-budget: "~3200 tokens"
triggers:
  keywords: [read note, write note, search vault, tag, edit, frontmatter, verify, list notes, replace, delete]
  contexts: ["any obsidian vault operation needed"]
  negative: [triage decision, synthesis, relationship analysis, health diagnosis, promotion decision]
boundaries:
  owns: [vault CRUD, frontmatter management, tag management, search, verification]
  delegates_to:
    inbox-triage: "routing decisions for inbox items"
    connection-review: "relationship analysis decisions"
    weekly-synthesis: "meaning extraction decisions"
    note-promotion: "promotion decisions"
    vault-health-feedback: "health diagnosis decisions"
    opencode-context-maintenance: "context drift decisions"
  never_absorbs: [workflow decisions, knowledge interpretation]
continuations:
  on_success:
    - skill: "[calling workflow skill]"
      condition: "vault operation complete, return control to workflow skill"
  on_failure:
    - skill: vault-health-feedback
      condition: "repeated MCP failures suggest environment issue"
  escalation:
    - target: human
      condition: "3 repeated failures on same operation"
---

# Obsidian MCP Skill — Vault Operation Safety Layer

## Constraints

- NO vault write without fresh read confirmation first
- NO completion claims without readback verification
- NO use of known-broken MCP operations (patch_note, append_to_note)
- EVERY changed line must trace to the user request
- This skill owns vault operations ONLY; workflow decisions belong to companion skills

## Verified Host Constraints

> These constraints are based on `obsidian-mcp-server@3.1.5` on Windows.
> On upgrade: re-verify each Forbidden operation with a dry-run test.

| MCP operation | Status | Reason | Alternative |
|---|---|---|---|
| `obsidian_patch_note` | **Forbidden** | Schema translation bug (-32602) | `obsidian_replace_in_note`, `obsidian_manage_frontmatter`, `obsidian_manage_tags` |
| `obsidian_append_to_note` | **Forbidden** | Same schema failure | `obsidian_replace_in_note`; `write_note overwrite:false` for new files only |
| `obsidian_get_note format: section` | **Caution** | Schema output mismatch on long sections | Use `document-map` to locate, then `content/full` to verify |
| `obsidian_write_note overwrite:true` | **Forbidden by default** | Destroys unrelated content | New files: `overwrite:false`; existing: surgical replace/manage |
| `obsidian_delete_note` | **Requires confirmation** | No MCP-level undo | List path + link-risk first; wait for user |

## Tool Selection

| Goal | Tool | Rule |
|---|---|---|
| Browse structure | `obsidian_list_notes` | Depth 2-4; narrow path first |
| Search content | `obsidian_search_notes` | Output may clip; read targets after |
| Read before edit | `obsidian_get_note format: document-map` + `content/full` | Section mode is auxiliary only |
| Create note | `obsidian_write_note overwrite:false` | Read back immediately |
| Surgical edit | `obsidian_replace_in_note` | Literal preferred; regex must be narrow |
| Frontmatter | `obsidian_manage_frontmatter` | Atomic single-key operations |
| Tags | `obsidian_manage_tags` | Frontmatter/inline reconciliation |

## Standard Workflow

### 1. Locate and Read
1. Identify target paths, scope, expected change
2. Read `document-map` or `content/full` before writing
3. If path missing, search for candidates; do not create near-duplicates

### 2. Plan Minimum Change
Only change lines that directly serve the user request. Report unrelated issues; do not fix opportunistically.

### 3. Write
- New file: `obsidian_write_note overwrite:false`
- Existing: `obsidian_replace_in_note`, `obsidian_manage_frontmatter`, or `obsidian_manage_tags`
- Batch: sample-verify every 5 writes; final verification covers all targets

### 4. Read Back
1. Read the changed note
2. Compare actual vs expected (content, tags, frontmatter, path)
3. If mismatched: fix or report blocker
4. Only then claim completion

## Error Recovery

| Error | Response |
|---|---|
| `path_forbidden` | Use `list_notes` to discover allowed scope; retry |
| `note_missing` | Search for candidates; ask user if ambiguous |
| `file_exists` | Read existing; switch to surgical replace |
| `-32602` schema error | Stop using that operation; switch to alternative |
| 3 repeated failures | Stop; report attempts, errors, recommended next step |

## Safety Boundaries

- No deletion without explicit user confirmation
- No vault restructuring without plan + confirmation
- No host/MCP/git config edits by default
- No secrets, tokens, or credentials written to notes

## Gotchas

### Gotcha 1: Using forbidden APIs because they "look right"
**What happens:** Agent calls `patch_note` or `append_to_note` for a semantically matching task
**Why it's wrong:** Current host schema translation fails with -32602 regardless of intent
**Correct approach:** Always use `replace_in_note` or manage tools; never "try it anyway"

### Gotcha 2: Trusting section reads as verification
**What happens:** Agent reads `format: section` and claims write verified
**Why it's wrong:** Long section reads produce schema-output mismatch on this host
**Correct approach:** Verify with `format: content` or `format: full`

### Gotcha 3: Letting this skill make workflow decisions
**What happens:** Agent uses obsidian-mcp to decide what to triage/promote/synthesize
**Why it's wrong:** Blurs ownership; causes scope creep into workflow territory
**Correct approach:** Execute vault operations only; defer decisions to companion skills

## Validators

- `validators/api-safety-check.sh`: Post-execution check that no forbidden APIs were used
