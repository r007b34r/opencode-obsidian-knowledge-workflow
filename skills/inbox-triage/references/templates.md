# Inbox Triage Output Templates

## Batch Summary Template

Use this format at the start of every triage output:

```text
## Triage Summary
- Scope: [path] | [total items] items
- Shallow-read: [count] | Deep-read: [count]
- Decisions: [promote count] promote | [keep count] keep | [project count] project | [archive count] archive | [uncertain count] uncertain
- Write-back needed: [yes/no]
```

## Per-Item Template

Use this format for each triaged item:

```text
Path: [vault-relative path]
Decision: [keep-in-inbox | promote-to-note | promote-to-idea | move-to-project | archive-or-ignore | needs-deep-read]
Reason: [ONE sentence — routing evidence, not interpretation]
Next action: [specific next step or "none"]
Write-back needed: [yes/no; if yes, specify: move/tag/rename]
```

## Batch Completion Template

Use at the end:

```text
## Next Steps
- Items requiring confirmation: [list paths + intended actions]
- Items deferred to deep-read: [list paths]
- Suggested follow-up skill: [connection-review | note-promotion | none]
- Remaining unprocessed: [count, if batch was split]
```

## Write-Back Confirmation Template

When user approves write-back, format the plan:

```text
## Write-Back Plan (awaiting confirmation)

| # | Path | Action | Target |
|---|------|--------|--------|
| 1 | Inbox/note-a.md | move | Projects/X/ |
| 2 | Inbox/note-b.md | move | Archive/ |
| 3 | Inbox/note-c.md | add tag | #promoted |

Confirm? (yes/no/modify)
```

## Handoff Template

When handing off to another skill:

```text
## Handoff: inbox-triage → [target skill]

Items:
- [path]: [decision] | [reason] | uncertainty: [low/medium/high]

Context for target skill:
- These items passed triage with [decision]
- Evidence level: [shallow-read | deep-read]
- Suggested action: [what the target skill should do]
```

## Edge Case Templates

### Empty Inbox
```text
## Triage Result
Inbox path: [path]
Status: empty (0 items)
Suggestion: verify path is correct, or check if items are in a subfolder
```

### Oversized Inbox
```text
## Triage Result (partial)
Inbox path: [path]
Total items: [N]
Processed this batch: 20
Remaining: [N-20]

[... per-item decisions for first 20 ...]

Continue with next batch? (yes/no)
```
