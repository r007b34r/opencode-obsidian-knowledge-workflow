# Weekly Synthesis Output Templates

## Full Synthesis Report Template

```text
## Weekly Synthesis
Scope: [time window] / [note count] notes / [deep-read count] deep-read
Theme stability: [low / medium / high]

---

### Emerging Thesis
[One sentence claim]

Evidence:
- [note-1.md]: "[specific content]"
- [note-2.md]: "[specific content]"
- [note-3.md]: "[specific content]" (if available)

Confidence: [low -- thin evidence / medium -- pattern visible / high -- confirmed]

---

### Contradictions
[Description of tension, or "None meaningful this period"]

Evidence (if present):
- [note-A.md]: "[claim 1]"
- [note-B.md]: "[opposing claim]"
- Impact: [what this tension means for decisions]

---

### Gaps
[What is missing from the picture]
- Missing perspective: [if applicable]
- Missing evidence: [if applicable]
- Missing decision: [if applicable]

---

### One Action
[Exactly one specific, completable next move]
Rationale: [why this is highest-leverage]

---

### One Question
[Exactly one question worth preserving]
Why it matters: [what answering this would unlock]

---

### Follow-Up Note Suggestions
| Type | Suggested title | Source notes | Reason |
|------|----------------|-------------|--------|
| [type] | [title] | [notes] | [why] |
```
## Synthesis Note Template (for vault write-back)

When user approves writing a synthesis note:

```markdown
---
tags: [synthesis, weekly]
created: YYYY-MM-DD
type: synthesis-note
period: [start-date] to [end-date]
source-notes: [count]
theme-stability: [low/medium/high]
---
# Weekly Synthesis: [date range]

## Thesis
[thesis content]

## Evidence
- [[note-1]]: [what it contributes]
- [[note-2]]: [what it contributes]

## Contradictions
[content or "none meaningful"]

## Gaps
[content]

## Action
[the one action]

## Question
[the one question]
```

## Weak Signal Template

When theme stability is low:

```text
## Weekly Synthesis (Low Confidence)
Scope: [window] / [count] notes / [deep-read] deep-read
Theme stability: low

Emerging thesis: Uncertain. Strongest signal: [brief description]
Evidence is thin: only [N] notes touch this theme.

Contradictions: [none found / insufficient data]
Gaps: [the gap is data itself -- describe why]

One action: [address the meta-problem: capture more, expand window, etc.]
One question: [question about the process or the silence]

Note: Low confidence synthesis. Consider expanding time window or running
connection-review first to surface relationships.
```

## Handoff Templates

### To note-promotion
```text
## Handoff: weekly-synthesis -> note-promotion
Item: this synthesis output
Thesis: [the thesis]
Stability: [theme stability level]
Suggested note type: synthesis-note
Suggested title: "Weekly Synthesis [date range]"
Integration targets: [[{related-topic}]], [[{related-project}]]
```

### To opencode-context-maintenance
```text
## Handoff: weekly-synthesis -> opencode-context-maintenance
Trigger: thesis/gaps reveal context drift
Finding: [what drifted]
Evidence: [from which notes]
Suggested layer: [long-term vault / current work / host reality]
```

### To connection-review
```text
## Handoff: weekly-synthesis -> connection-review
Trigger: insufficient signal for synthesis; relationships may help
Notes in scope: [list]
Reason: [fragmentation / no convergence / need link discovery first]
```
