---
name: obsidian-mcp
description: >
  Vault operation safety layer for all Obsidian MCP operations.
  Load when any vault read/write/search/tag/edit/verify is needed.
  Do NOT use alone for workflow decisions; combine with companion skill.
license: Apache-2.0
compatibility: opencode; obsidian-mcp-server@3.1.5
metadata:
  version: "4.1.0"
  last-reviewed: "2026-05-14"
  owner: r007b34r
---

# obsidian-mcp

## Constraints

- **NO OBSIDIAN WRITE WITHOUT FRESH READ CONFIRMATION FIRST**
- **NO COMPLETION CLAIMS WITHOUT READBACK VERIFICATION**
- **NO USE OF KNOWN-BROKEN MCP OPERATIONS**
- **EVERY CHANGED LINE MUST TRACE TO THE USER REQUEST**

This skill owns low-level Obsidian vault operations only. Knowledge-workflow decisions belong to `inbox-triage`, `connection-review`, `weekly-synthesis`, `opencode-context-maintenance`, `vault-health-feedback`, and `note-promotion`.

### Verified Host Constraints

These constraints come from real OpenCode + `obsidian-mcp-server@3.1.5` failures on this host. They are hard rules, not style preferences.

> Re-verify after any upgrade to `obsidian-mcp-server`, OpenCode runtime, or MCP protocol layer.

| MCP operation | Status | Observed reason | Required alternative |
|---|---|---|---|
| `obsidian_patch_note` | **Forbidden** | OpenCode host discriminated-union schema translation bug; `-32602` | `obsidian_replace_in_note`, `obsidian_manage_frontmatter`, or `obsidian_manage_tags` |
| `obsidian_append_to_note` | **Forbidden** | Same schema translation failure mode | `obsidian_replace_in_note`; use `obsidian_write_note overwrite:false` only for new files |
| `obsidian_get_note format: section` | **Use with caution** | Long section reads produce schema output mismatch | Use `format: document-map` to locate, then `format: content` or `format: full` for verification |
| `obsidian_write_note overwrite:true` | **Forbidden by default** | Whole-file overwrite destroys unrelated content and links | New files only with `overwrite:false`; existing files use surgical replace/manage tools |
| `obsidian_delete_note` | **Requires explicit user confirmation** | Deletion has no MCP-level undo | List path, purpose, and link-risk first; wait for confirmation |

If a user request appears to require a forbidden operation, explain the host constraint and use the alternative. Do not "try it anyway."

### Tool Selection

When selecting tools, read `references/examples.md` for operation patterns.

| Goal | Preferred tool | Rule |
|---|---|---|
| Browse vault structure | `obsidian_list_notes` | Use depth 2-4; narrow path first on large vaults |
| Search content | `obsidian_search_notes` | Output may be clipped; read target notes after search |
| Read before edit | `obsidian_get_note format: document-map` plus `content/full` | Section mode is only auxiliary |
| Create note | `obsidian_write_note overwrite:false` | Read back immediately |
| Surgical edit | `obsidian_replace_in_note` | Literal replacement preferred; regex must be narrow and explainable |
| Frontmatter | `obsidian_manage_frontmatter` | Atomic single-key operations |
| Tags | `obsidian_manage_tags` | Use for frontmatter/inline tag reconciliation |
| UI open | `obsidian_open_in_ui` | Never counts as verification |
## Trigger Boundary

**Use when:** any vault CRUD, frontmatter management, tag management, search, verification, batch edits, or note creation/modification is needed.

**Do NOT use for:**
- Routing decisions for inbox items -> `inbox-triage`
- Relationship analysis decisions -> `connection-review`
- Meaning extraction decisions -> `weekly-synthesis`
- Promotion decisions -> `note-promotion`
- Health diagnosis decisions -> `vault-health-feedback`
- Context drift decisions -> `opencode-context-maintenance`

## Boundaries

- **Owns:** vault CRUD, frontmatter management, tag management, search, verification
- **Delegates to:** all workflow skills for decisions about what to read/write/change
- **Never absorbs:** workflow decisions, knowledge interpretation, routing logic

## Continuations

| Condition | Next skill |
|-----------|-----------|
| Vault operation complete | Return control to calling workflow skill |
| Repeated MCP failures suggest environment issue | `vault-health-feedback` |
| 3 repeated failures on same operation | Escalate to human |

## Companion Skill

This IS the companion skill. All other workflow skills delegate vault operations here.

## Procedure

### 1. Locate and Read

1. Identify target paths, scope, and expected change.
2. For existing notes, read `document-map` or `content/full` before writing.
3. If a path is missing, search for candidates; do not create near-duplicates blindly.

### 2. Plan the Minimum Change

Only change lines, sections, tags, or metadata that directly serve the user request. Report unrelated issues; do not fix them opportunistically.

### 3. Write

- New file: `obsidian_write_note overwrite:false`.
- Existing file: `obsidian_replace_in_note`, `obsidian_manage_frontmatter`, or `obsidian_manage_tags`.
- Batch work: after every five writes, sample-verify the pattern; final verification must cover every intended target.

### 4. Read Back

When formatting completion reports, read `references/templates.md`.

After every write:
1. Read the changed note.
2. Compare actual content, tags, frontmatter, and path against expectation.
3. If mismatched, fix or report the blocker.
4. Only then claim completion.

<details>
<summary>Error Recovery (expand when MCP errors occur)</summary>

| Error | Response |
|---|---|
| `path_forbidden` | Use `list_notes` to discover allowed scope; retry in an allowed path |
| `note_missing` | Search for candidates; ask the user to choose if ambiguous |
| `file_exists` | Read the existing file; switch to surgical replace unless explicit overwrite was requested |
| `-32602` schema error | Stop using that MCP operation; switch to the hard-rule alternative above |
| Three repeated failures | Stop writing; report attempts, exact errors, and recommended next step |

</details>

## Safety Boundaries

- Do not delete notes without explicit user confirmation.
- Do not restructure the vault without a plan and confirmation.
- Do not edit host config, MCP config, or git history by default.
- Do not commit git changes unless the user explicitly requested it.
- Do not write secrets, tokens, cookies, or private credentials into notes.
## Gotchas

### Gotcha 1: Using `patch_note` or `append_to_note` because it looks semantically right
**What happens:** MCP returns `-32602` schema translation error; the write silently fails.
**Why it is wrong:** Current host has a discriminated-union schema bug that breaks these operations.
**Correct approach:** Always use `obsidian_replace_in_note` or the manage tools.

### Gotcha 2: Trusting `section` reads as final verification
**What happens:** Long section reads return schema-output mismatch; data appears valid but is incomplete.
**Why it is wrong:** The section format has an observed failure mode on large content blocks.
**Correct approach:** Verify with `format: content` or `format: full` reads.

### Gotcha 3: Treating `write_note overwrite:true` as an editor
**What happens:** Entire file is replaced; unrelated content, links, and metadata are destroyed.
**Why it is wrong:** Overwrite is a blunt instrument that ignores surgical precision requirements.
**Correct approach:** Use `obsidian_replace_in_note` for targeted edits on existing files.

## Validators

Run `validators/api-safety-check.sh` after any change to this skill or its host constraints.

The validator checks:
- No forbidden MCP operations appear in proposed tool call sequences.
- Read-before-write ordering is maintained.
- Readback verification is present after every write operation.
- Schema error patterns are caught before execution.

## Exit Criteria

- Every write was preceded by a fresh read
- No forbidden operations were used
- Every write has readback verification
- Completion report includes operations, paths, and evidence
