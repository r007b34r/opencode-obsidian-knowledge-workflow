# Note Promotion Templates

## Promoted Note Templates by Type

### reference-note
```markdown
---
tags: [reference, {domain}]
created: YYYY-MM-DD
type: reference-note
source: {original capture path}
status: promoted
---
# {Title: factual, descriptive}

## Summary
{One paragraph: what this knowledge is and when to use it}

## Content
{The reference material -- steps, definitions, patterns, or methods}

## Applicability
{When this applies and when it does NOT apply}

## Links
- Related: [[{related-note-1}]], [[{related-note-2}]]
- Source: {external source if applicable}
```

### idea-note
```markdown
---
tags: [idea, {domain}]
created: YYYY-MM-DD
type: idea-note
source: {original capture path}
status: promoted
---
# {Title: the claim or observation}

## Claim
{One sentence: the idea in its strongest form}

## Evidence
{What supports this -- observations, examples, references}

## Implications
{What follows if this is true}

## Open Questions
{What remains uncertain or untested}

## Links
- Supports: [[{note-1}]]
- Challenges: [[{note-2}]]
- Related: [[{note-3}]]
```
### project-note
```markdown
---
tags: [project, {project-name}]
created: YYYY-MM-DD
type: project-note
source: {original capture path}
status: promoted
project: {project-name}
---
# {Title: project-scoped knowledge}

## Context
{Why this matters for the project}

## Content
{The knowledge, decision, or pattern}

## Project Relevance
{How this connects to project goals}

## Links
- Project: [[{project-index}]]
- Related: [[{related-note}]]
```

### topic-note
```markdown
---
tags: [topic, {domain}]
created: YYYY-MM-DD
type: topic-note
status: promoted
---
# {Title: the conceptual home}

## Overview
{What this topic covers and why it exists as a hub}

## Key Notes
- [[{note-1}]]: {what it contributes}
- [[{note-2}]]: {what it contributes}
- [[{note-3}]]: {what it contributes}

## Open Threads
{Unresolved questions or gaps in this topic area}

## Links
- Parent: [[{broader-topic}]] (if applicable)
- Related topics: [[{sibling-topic}]]
```

### synthesis-note
```markdown
---
tags: [synthesis, {domain}]
created: YYYY-MM-DD
type: synthesis-note
source-notes: [{note-1}, {note-2}, {note-3}]
status: promoted
---
# {Title: the cross-note insight}

## Thesis
{The understanding that emerges from combining multiple notes}

## Evidence
- [[{note-1}]]: {what it contributes}
- [[{note-2}]]: {what it contributes}

## Implications
{What this synthesis means for future work or thinking}

## Links
- Synthesizes: [[{source-notes}]]
- Informs: [[{downstream-notes}]]
```
### contradiction-note
```markdown
---
tags: [contradiction, {domain}]
created: YYYY-MM-DD
type: contradiction-note
status: promoted
---
# {Title: the tension}

## Tension
{One sentence: what contradicts what}

## Position A
{First claim + source evidence}
Source: [[{note-a}]]

## Position B
{Opposing claim + source evidence}
Source: [[{note-b}]]

## Why This Matters
{What depends on resolving or holding this tension}

## Links
- [[{note-a}]], [[{note-b}]]
- Related: [[{context-notes}]]
```

### question-note
```markdown
---
tags: [question, {domain}]
created: YYYY-MM-DD
type: question-note
status: promoted
---
# {Title: the question}

## The Question
{Full formulation of the question worth returning to}

## Why It Matters
{What answering this would unlock or change}

## Current Thinking
{Best current partial answer, if any}

## Links
- Prompted by: [[{source-notes}]]
- Related: [[{context-notes}]]
```

## Scoring Output Template

```text
## Promotion Assessment
Source: {path}
Content summary: {one sentence}

| Criterion | Score | Evidence |
|-----------|-------|----------|
| Stable | {0/1} | {evidence} |
| Reusable | {0/1} | {evidence} |
| Independent | {0/1} | {evidence} |
| Connectable | {0/1} | {evidence} |
| Compression | {0/1} | {evidence} |
| **Total** | **{N}/5** | |

Decision: {promote / wait / keep raw / archive}
Reason: {why this decision}
```

## Handoff Template

```text
## Handoff: note-promotion -> {next-skill}
Promoted note: {path}
Type: {note type}
Integration needed: {what the next skill should do}
Links established: [[{link-1}]], [[{link-2}]]
```
