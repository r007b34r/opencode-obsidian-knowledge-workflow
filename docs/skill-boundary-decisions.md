# OpenCode + Obsidian Knowledge Workflow — Skill Boundary Decisions

## Purpose

Records responsibility boundaries between knowledge-workflow skills. Defines what each skill explicitly does NOT do, and which skill owns which decision.

Core principle: **The system is most fragile when one skill starts making decisions for another.**

## Main Boundaries

### 1. inbox-triage vs connection-review
- `inbox-triage`: judges whether a single input is worth continued processing
- `connection-review`: judges whether relationships exist between multiple notes
- **Forbidden**: triage doing cross-note relationship analysis; review taking over inbox sorting

### 2. connection-review vs weekly-synthesis
- `connection-review`: discovers specific relationships
- `weekly-synthesis`: interprets what those relationships mean at the week level
- **Forbidden**: review concluding "what this week means"; synthesis redoing local relationship discovery

### 3. weekly-synthesis vs opencode-context-maintenance
- `weekly-synthesis`: interprets the meaning of this week's changes
- `opencode-context-maintenance`: persists stable meaning into long-term context entries
- **Forbidden**: synthesis auto-updating context files; maintenance reinterpreting weekly changes

### 4. note-promotion vs all others
- `note-promotion`: upgrades proven-valuable material to stable knowledge units
- Other skills: discover and judge value
- **Forbidden**: promotion substituting for triage, review, synthesis, or health diagnosis

### 5. vault-health-feedback vs all others
- `vault-health-feedback`: diagnoses system health
- Other skills: execute specific operations
- **Forbidden**: health diagnosis directly repairing vault; other skills using health reports to replace their own judgment

### 6. vault-health-feedback vs opencode-context-maintenance
- `vault-health-feedback`: judges whether context should be maintained
- `opencode-context-maintenance`: executes context calibration
- **Forbidden**: health diagnosis updating context notes; maintenance substituting for system diagnosis

### 7. note-promotion vs inbox-triage
- `inbox-triage`: outputs "what's worth continued attention"
- `note-promotion`: upgrades worthy items to stable knowledge units
- **Forbidden**: triage doing direct promotion; promotion taking over inbox sorting

### 8. shallow-read strategy vs current tool surface
- Spec defines staged shallow→deep reading
- Current `obsidian_get_note format: "full"` returns entire body — no native partial read
- Workaround: `list_notes` metadata + `get_note format: "document-map"` for structure; full read only at Stage 3
- Short notes (< 500 chars): full read ≈ shallow read, acceptable compromise

### 9. Hard MCP operation boundaries
- `obsidian_patch_note`: forbidden on the verified OpenCode host because discriminated-union schema translation can trigger `MCP error -32602`
- `obsidian_append_to_note`: forbidden for the same host-level schema reason
- `obsidian_get_note format: "section"`: auxiliary only; long-section reads have produced schema-output mismatch (`data must have required property 'result'`)
- `obsidian_write_note overwrite:true`: forbidden by default because it is a whole-file replacement, not a surgical edit
- `obsidian_delete_note`: requires explicit user confirmation
- Workaround: use `obsidian_replace_in_note` for surgical edits, `obsidian_manage_frontmatter` / `obsidian_manage_tags` for metadata, and `obsidian_write_note overwrite:false` for new files
- If the OpenCode host fixes the translation bug, update this boundary only after re-running the MCP safety regression tests

## Summary

> Each skill has its own responsibility radius. The system is most fragile when one skill starts deciding for another.
