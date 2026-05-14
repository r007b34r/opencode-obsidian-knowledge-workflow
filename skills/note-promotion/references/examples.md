# Note Promotion Examples

## Good Promotion Decisions

### Example 1: High-scoring idea-note (5/5)
```text
Source: Inbox/2026-05-08-api-observation.md
Content: "Every retry mechanism I have built this quarter silently assumes
  idempotency. None of them verify it. This is a systemic blind spot."

Score:
- Stable: 1 -- referenced in 3 subsequent notes over 2 weeks
- Reusable: 1 -- applies to any retry implementation
- Independent: 1 -- understandable without the original project context
- Connectable: 1 -- links to retry-patterns, idempotency-checklist, api-design
- Compression: 1 -- captures a pattern that was implicit across multiple notes

Decision: PROMOTE as idea-note
Title: "Retry mechanisms assume idempotency without verification"
Tags: [idea, api-design, reliability, blind-spot]
Links: [[retry-patterns]], [[idempotency-checklist]], [[api-design-principles]]
```
Why correct: high stability (persisted + referenced), clear reuse value, standalone.

### Example 2: Borderline wait decision (2/5)
```text
Source: Inbox/2026-05-12-meeting-thought.md
Content: "Maybe we should use event sourcing for the audit log?"

Score:
- Stable: 0 -- written once, never referenced again
- Reusable: 1 -- event sourcing pattern is broadly applicable
- Independent: 0 -- needs meeting context to understand "we" and "audit log"
- Connectable: 1 -- could link to event-sourcing, audit-requirements
- Compression: 0 -- no clearer than the original one-liner

Decision: WAIT -- score 2/5, below threshold
Reason: transient thought, context-dependent, no evidence of persistence
```
Why correct: does not promote just because the topic is interesting.

### Example 3: Contradiction-note (4/5)
```text
Source: Weekly synthesis output + two conflicting notes
Content: Tension between "automate everything" (from workflow-automation.md) and
  "automation reduces reflection quality" (from vault-health-review.md)

Score:
- Stable: 1 -- tension has persisted across 3 weeks of notes
- Reusable: 1 -- applies to any workflow design decision
- Independent: 1 -- the contradiction is self-explanatory
- Connectable: 1 -- links to automation, reflection, workflow-design
- Compression: 0 -- both source notes already state their positions clearly

Decision: PROMOTE as contradiction-note
Title: "Automation vs reflection quality tension"
Tags: [contradiction, workflow, automation, reflection]
Links: [[workflow-automation]], [[vault-health-review]], [[workflow-design-principles]]
```
### Example 4: Question-note (3/5, minimum threshold)
```text
Source: Inbox/2026-05-10-curiosity.md
Content: "What makes some notes get revisited and others die on creation?"

Score:
- Stable: 1 -- keeps coming back in different forms
- Reusable: 1 -- fundamental to knowledge management methodology
- Independent: 1 -- the question stands alone
- Connectable: 0 -- no existing note directly addresses this
- Compression: 0 -- the question is already maximally compressed

Decision: PROMOTE as question-note (3/5, threshold met)
Title: "What determines note revisitation vs abandonment?"
Tags: [question, knowledge-management, methodology]
Links: [[vault-health-feedback]], [[note-lifecycle]]
```

## Bad Promotion Decisions

### Over-promotion: promoting a transient fragment
```text
Source: Inbox/2026-05-13-quick-thought.md
Content: "Need to fix the auth bug tomorrow"

Agent decision: PROMOTE as project-note
```
Why wrong: this is a task, not knowledge. Zero reuse value. Not stable.
Correct: leave in inbox or move to task system.

### Over-promotion: promoting because topic is important
```text
Source: Inbox/2026-05-11-article-link.md
Content: "Interesting article about distributed systems: [link]"

Agent decision: PROMOTE as reference-note because distributed systems is important
```
Why wrong: a link with no synthesis is not a note. No personal framing, no claim.
Correct: WAIT until the user has read and extracted something worth preserving.

### Under-promotion: rejecting stable reusable knowledge
```text
Source: Inbox/2026-05-01-pattern-observation.md (referenced 4 times since)
Content: "All our service boundaries align with team boundaries, not domain
  boundaries. This explains why cross-team features are always painful."

Agent decision: WAIT -- "just an observation, not formal enough"
```
Why wrong: scores 5/5 (stable, reusable, independent, connectable, compresses).
The agent confused "informal tone" with "not ready." Voice preservation is a feature.
Correct: PROMOTE as idea-note, preserving original phrasing.

### Polishing before deciding
```text
Agent action: rewrites inbox capture into clean prose with headers and formatting
Then scores: 4/5 -- "this is clearly worth promoting"
```
Why wrong: the polishing made it LOOK promotable. Score the raw material first.
Correct: score first on raw content, then format only if promoting.

## Type Selection Calibration

| Material | Wrong type | Right type | Why |
|----------|-----------|------------|-----|
| "OAuth2 PKCE flow steps" | idea-note | reference-note | External knowledge, not personal framing |
| "I think our auth is over-engineered" | reference-note | idea-note | Personal judgment, not external fact |
| "Sprint 12 auth implementation plan" | topic-note | project-note | Scoped to active work, not conceptual |
| "Three notes all discuss caching differently" | reference-note | topic-note | Needs to be a conceptual home |
| "Week 19 thesis: converging on event-driven" | idea-note | synthesis-note | Cross-note time-window understanding |
