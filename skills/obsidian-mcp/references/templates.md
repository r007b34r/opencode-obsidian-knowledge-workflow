# Obsidian MCP Output Templates

## Completion Report Template

Use after every successful operation sequence:

```text
Done.
- Operations: [list of MCP tools used, e.g., read/search/replace/manage_frontmatter]
- Notes touched: [full paths of all modified notes]
- Verification: [readback evidence -- what was checked and confirmed]
- Safety notes: [forbidden tools avoided / confirmations obtained / constraints respected]
```

### Example completion report
```text
Done.
- Operations: search -> read (document-map) -> read (content) -> replace_in_note -> read (content)
- Notes touched: Projects/api-design/rate-limiter.md
- Verification: readback confirms status changed from "in progress" to "complete";
  frontmatter intact; 3 wiki-links preserved
- Safety notes: used replace_in_note instead of patch_note (host constraint);
  no overwrite:true used
```

## Safety Regression Template

Use when a new MCP failure is discovered that should be documented:

```text
## [date] - [tool or operation name]
- Trigger: [what action caused the failure]
- Expected behavior: [what should have happened]
- Actual behavior: [exact error message or observed result]
- Safe workaround: [alternative that works]
- Skill update needed: [yes/no -- what to change in SKILL.md if yes]
- Severity: [blocking / degraded / cosmetic]
```

### Example safety regression
```text
## 2026-05-10 - obsidian_patch_note (forbidden on this host)
- Trigger: attempted to add a section via patch operation
- Expected behavior: section added to note body
- Actual behavior: MCP error -32602: Structured content does not match output schema
- Safe workaround: use obsidian_replace_in_note with literal search/replace
- Skill update needed: yes -- add patch_note to Forbidden table
- Severity: blocking
```

## Batch Operation Template

Use when performing multiple writes in sequence:

```text
## Batch Operation Report
- Scope: [N notes in path/pattern]
- Operation type: [tag update / frontmatter change / content replace / etc.]
- Sample verification: [after every 5 writes, which note was spot-checked]
- Final verification: [all N notes confirmed]
- Failures: [0 or list of failed paths with reasons]
- Rollback needed: [yes/no]

### Per-note log (if <10 notes)
| # | Path | Operation | Verified |
|---|------|-----------|----------|
| 1 | path/note1.md | replace status | yes |
| 2 | path/note2.md | replace status | yes |
```

### Example batch report
```text
## Batch Operation Report
- Scope: 6 notes in Projects/api-design/
- Operation type: frontmatter status update (in-progress -> complete)
- Sample verification: checked note 5/6 after first 5 writes -- correct
- Final verification: all 6 notes read back with status: complete
- Failures: 0
- Rollback needed: no

### Per-note log
| # | Path | Operation | Verified |
|---|------|-----------|----------|
| 1 | Projects/api-design/rate-limiter.md | set status:complete | yes |
| 2 | Projects/api-design/auth-flow.md | set status:complete | yes |
| 3 | Projects/api-design/caching.md | set status:complete | yes |
| 4 | Projects/api-design/pagination.md | set status:complete | yes |
| 5 | Projects/api-design/error-handling.md | set status:complete | yes |
| 6 | Projects/api-design/versioning.md | set status:complete | yes |
```

## Error Report Template

Use when an operation fails and cannot be recovered:

```text
## Operation Failed
- Intended action: [what was requested]
- Attempts: [number of tries and what was tried]
- Error: [exact error text]
- Root cause: [known host constraint / unknown / transient]
- Recommended next step: [what user should do]
- Data safety: [no data lost / partial write occurred / unknown state]
```
