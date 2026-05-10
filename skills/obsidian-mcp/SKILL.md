---
name: obsidian-mcp
description: Load when the user asks to read, search, write, tag, edit, reorganize, or verify an Obsidian vault through MCP tools. This is the mandatory safety layer for all vault operations. Use it for note CRUD, frontmatter, tags, search, batch edits, and verification. Do not use it alone for knowledge-workflow decisions such as inbox triage, connection review, weekly synthesis, context maintenance, vault health diagnosis, or note promotion; combine with the corresponding workflow skill.
license: MIT
compatibility: opencode; obsidian-mcp-server@3.1.5; Windows host verified 2026-05-10
metadata:
  version: "2.0.0"
  last-reviewed: "2026-05-10"
  owner: local
  eval-status: structure-validated
  requires: obsidian-mcp-server
---

# Obsidian MCP Skill — Vault Operation Safety Layer

## Production Rules

```
NO OBSIDIAN WRITE WITHOUT FRESH READ CONFIRMATION FIRST
NO COMPLETION CLAIMS WITHOUT READBACK VERIFICATION
NO USE OF KNOWN-BROKEN MCP OPERATIONS
EVERY CHANGED LINE MUST TRACE TO THE USER REQUEST
```

This skill owns low-level Obsidian vault operations only. Knowledge-workflow decisions belong to `inbox-triage`, `connection-review`, `weekly-synthesis`, `opencode-context-maintenance`, `vault-health-feedback`, and `note-promotion`.

## Verified Host Constraints

These constraints come from real OpenCode + `obsidian-mcp-server@3.1.5` failures on this host. They are hard rules, not style preferences.

| MCP operation | Status | Observed reason | Required alternative |
|---|---|---|---|
| `obsidian_patch_note` | **Forbidden** | OpenCode host discriminated-union schema translation bug; observed `MCP error -32602: Structured content does not match the tool's output schema` | `obsidian_replace_in_note`, `obsidian_manage_frontmatter`, or `obsidian_manage_tags` |
| `obsidian_append_to_note` | **Forbidden** | Same schema translation failure mode | `obsidian_replace_in_note`; use `obsidian_write_note overwrite:false` only for new files |
| `obsidian_get_note format: section` | **Use with caution; never as the only read/verification path** | Long section reads produced `data must have required property 'result', data must NOT have additional properties` | Use `format: document-map` to locate structure, then `format: content` or `format: full` for verification |
| `obsidian_write_note overwrite:true` | **Forbidden by default** | Whole-file overwrite can destroy unrelated content and links | New files only with `overwrite:false`; existing files use surgical replace/manage tools |
| `obsidian_delete_note` | **Requires explicit user confirmation** | Deletion has no MCP-level undo | List path, purpose, and link-risk first; wait for confirmation |

If a user request appears to require a forbidden operation, explain the host constraint and use the alternative. Do not “try it anyway.”

## Tool Selection

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

## Standard Workflow

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

After every write:

1. Read the changed note.
2. Compare actual content, tags, frontmatter, and path against expectation.
3. If mismatched, fix or report the blocker.
4. Only then claim completion.

## Error Recovery

| Error | Response |
|---|---|
| `path_forbidden` | Use `list_notes` to discover allowed scope; retry in an allowed path |
| `note_missing` | Search for candidates; ask the user to choose if ambiguous |
| `file_exists` | Read the existing file; switch to surgical replace unless explicit overwrite was requested |
| `-32602` schema error | Stop using that MCP operation; switch to the hard-rule alternative above |
| Three repeated failures | Stop writing; report attempts, exact errors, and recommended next step |

## Safety Boundaries

- Do not delete notes without explicit user confirmation.
- Do not restructure the vault without a plan and confirmation.
- Do not edit host config, MCP config, or git history by default.
- Do not commit git changes unless the user explicitly requested it.
- Do not write secrets, tokens, cookies, or private credentials into notes.

## Completion Report Contract

Report in the user's language and include:

- changed vault paths;
- MCP tools used;
- forbidden operations avoided;
- readback verification evidence;
- unresolved items and why, if any.

## Gotchas

| Gotcha | Why it fails | Correct approach |
|---|---|---|
| Using `patch_note` or `append_to_note` because it looks semantically right | Current host schema translation fails with -32602 | Always use `replace_in_note` or manage tools |
| Trusting `section` reads as final verification | Observed schema-output mismatch on long sections | Verify with full/content reads |
| Treating `write_note overwrite:true` as an editor | Can overwrite unrelated content | Use surgical replacement |
| Opening the UI and claiming completion | UI visibility is not machine verification | Read back with MCP |
| Letting this skill make workflow decisions | It blurs ownership and causes scope creep | Combine with the relevant workflow skill |
