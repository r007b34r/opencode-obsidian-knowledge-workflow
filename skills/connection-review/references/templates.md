# Connection Review Output Templates

## Report Header Template

```text
## Connection Review Report
- Scope: [note count] notes | [time range or "user-specified set"]
- Read depth: [document-map count] shallow | [full-read count] deep
- Findings: [link count] links | [pattern count] patterns | [contradiction count] contradictions
```

## Connection Suggestion Template

```text
### Connection [N]
Endpoints: [note-A.md] → [note-B.md]
Type: [method-to-method | concept-to-concept | question-to-answer | decision-conflict | temporal-sequence]
Evidence:
  - [note-A] line/section: "[quoted content]"
  - [note-B] line/section: "[quoted content]"
Strength: [strong | moderate | weak]
Write-back suggested: [yes/no]
```

## Pattern Finding Template

```text
### Pattern: [pattern name]
Occurrences: [count] notes
Notes: [list of note paths]
Shared mechanism: [one sentence describing what repeats]
Evidence per note:
  - [note-1]: "[specific content]"
  - [note-2]: "[specific content]"
  - [note-3]: "[specific content]"
Implication: [actionable next step or "monitor"]
Follow-up suggestion: [create topic-note / none]
```

## Contradiction Finding Template

```text
### Contradiction: [topic]
Notes: [note-A.md] vs [note-B.md]
Tension: [one sentence describing the conflict]
Evidence:
  - [note-A]: "[quoted claim]"
  - [note-B]: "[opposing claim]"
Impact: [decision conflict | assumption challenged | method disagreement]
Resolution needed: [yes/no]
Follow-up suggestion: [create contradiction-note / discuss with user / none]
```

## Follow-Up Suggestions Template

```text
## Follow-Up Note Suggestions
| # | Type | Title | Source notes | Reason |
|---|------|-------|-------------|--------|
| 1 | topic-note | [title] | [notes] | [why] |
| 2 | contradiction-note | [title] | [notes] | [why] |
```

## Uncertain Items Template

```text
## Uncertain (needs more evidence)
- [note-A] ↔ [note-B]: [suspected relationship] — insufficient evidence because [reason]
```

## Write-Back Plan Template

When user approves link writing:

```text
## Write-Back Plan (awaiting confirmation)
| # | Target note | Action | Content to add | Location |
|---|------------|--------|---------------|----------|
| 1 | note-A.md | add wikilink | [[note-B]] | end of Related section |
| 2 | note-B.md | add wikilink | [[note-A]] | end of Related section |

Method: obsidian_replace_in_note (append to existing section)
Verification: readback after each write

Confirm? (yes/no/modify)
```

## Handoff Template

```text
## Handoff: connection-review → [target skill]
Items:
- [path]: [connection type] | [evidence summary] | strength: [level]
Context: these items completed relationship analysis and are ready for [next action]
```
