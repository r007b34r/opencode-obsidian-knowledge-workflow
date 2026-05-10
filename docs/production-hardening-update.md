# Production Hardening Update — 2026-05-10

## Purpose

This note documents the engineering rewrite applied to all seven skills after production review and live OpenCode + Obsidian MCP testing.

The rewrite keeps the original project language convention: **all shipped skill bodies are in English**. Local analysis notes may be written in another language, but repository skills should remain English for broader reuse.

## Updated Skills

The following runtime skills were rewritten with production metadata, stronger trigger descriptions, explicit boundaries, exit criteria, gotchas, and minimal eval guidance:

- `skills/obsidian-mcp/SKILL.md`
- `skills/inbox-triage/SKILL.md`
- `skills/connection-review/SKILL.md`
- `skills/weekly-synthesis/SKILL.md`
- `skills/opencode-context-maintenance/SKILL.md`
- `skills/vault-health-feedback/SKILL.md`
- `skills/note-promotion/SKILL.md`

## New Frontmatter Conventions

Each skill now includes production metadata:

```yaml
license: MIT
compatibility: opencode; requires obsidian-mcp for vault operations
metadata:
  version: "2.0.0"
  last-reviewed: "2026-05-10"
  owner: local
  eval-status: needs-trigger-evals
```

`obsidian-mcp` also records the verified MCP server requirement:

```yaml
compatibility: opencode; obsidian-mcp-server@3.1.5; Windows host verified 2026-05-10
metadata:
  requires: obsidian-mcp-server
```

## Hard MCP Constraints from Live Testing

These are production constraints discovered during real tool use. They should not be relaxed without re-testing on the target OpenCode host.

| MCP operation | Status | Observed reason | Required replacement |
|---|---|---|---|
| `obsidian_patch_note` | Forbidden | OpenCode host discriminated-union schema translation bug; observed `MCP error -32602: Structured content does not match the tool's output schema` | `obsidian_replace_in_note`, `obsidian_manage_frontmatter`, or `obsidian_manage_tags` |
| `obsidian_append_to_note` | Forbidden | Same schema translation failure mode | `obsidian_replace_in_note`; use `obsidian_write_note overwrite:false` only for new files |
| `obsidian_get_note format: section` | Caution | Long section reads produced `data must have required property 'result', data must NOT have additional properties` | Use `document-map` for structure and `content/full` for verification |
| `obsidian_write_note overwrite:true` | Forbidden by default | Whole-file overwrite can destroy unrelated content | Use `overwrite:false` for new files; surgical replace for existing files |
| `obsidian_delete_note` | Confirmation required | No MCP-level undo | List affected path and link risk, then wait for explicit confirmation |

## Engineering Contract Added to Workflow Skills

Every non-MCP workflow skill now explicitly states:

1. `obsidian-mcp` is required for any vault operation.
2. `obsidian_patch_note` and `obsidian_append_to_note` must not be used.
3. `get_note section` is auxiliary only, not a final verification path.
4. Any write-back must be confirmed by the user and read back after writing.
5. The skill remains analysis-first unless the user approves modification.

## Validation

Run this from the repository root:

```powershell
$skills = @(
  'obsidian-mcp',
  'inbox-triage',
  'connection-review',
  'weekly-synthesis',
  'opencode-context-maintenance',
  'vault-health-feedback',
  'note-promotion'
)
foreach ($s in $skills) {
  npx -y skills-ref validate "skills/$s"
}
```

Expected result: every skill reports `Valid skill`.

## Remaining Production Work

This update makes the skills structure-valid and operationally safer, but does not complete the full production evaluation loop. Remaining work:

- create `evals/` trigger suites for each skill;
- add near-miss negative examples for cross-skill collision tests;
- measure no-skill baseline vs skill-assisted task success;
- track token cost before and after skill loading;
- maintain changelogs from real trigger misses, false triggers, and MCP failures.
