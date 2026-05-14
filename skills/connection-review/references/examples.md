# Connection Review Examples

## Good Connection Suggestions

### Example 1: Conceptual link with evidence
```text
Connection: API-rate-limiting.md → backpressure-patterns.md
Type: method-to-method
Evidence: Both describe flow control at system boundaries.
  - rate-limiting.md line 12: "reject requests exceeding threshold"
  - backpressure.md line 8: "signal upstream to slow down"
Strength: strong (shared mechanism, different application)
Write-back suggested: yes (add wikilink in both directions)
```

Why this works: cites specific lines, explains WHY they connect (shared mechanism), distinguishes from surface similarity.

### Example 2: Contradiction with real tension
```text
Contradiction: meeting-notes-0510.md vs architecture-decision-003.md
Tension: Meeting decided "monolith first" but ADR-003 recommends microservices for the same component
Evidence:
  - meeting: "agreed to keep auth in main service for now"
  - ADR-003: "auth should be extracted to dedicated service"
Impact: decision conflict that needs resolution
```

Why this works: identifies a real decision conflict, not just different topics. Both notes address the same component with opposing conclusions.

### Example 3: Pattern across 3+ notes
```text
Pattern: "retry-with-backoff" appears as a solution in 4 notes
Notes: api-client.md, queue-worker.md, webhook-handler.md, batch-processor.md
Evidence: each independently implements exponential backoff for failure recovery
Implication: candidate for a shared reference-note on retry patterns
Follow-up suggestion: create topic-note "retry-patterns"
```

Why this works: 4 data points (not just 2), specific evidence in each, actionable follow-up.

### Example 4: Weak connection correctly identified
```text
Connection: project-alpha.md → project-beta.md
Type: temporal proximity
Evidence: created same week, both mention "deadline"
Strength: weak (shared context only, no conceptual link)
Write-back suggested: no
```

Why this works: honestly reports weakness instead of inflating a non-connection.

## Bad Connection Suggestions

### Bad 1: Tag-based false connection
```text
Connection: cooking-recipe.md → database-schema.md
Reason: both tagged #structure
```

Why this fails: "structure" means completely different things in each context. Tag overlap ≠ conceptual relationship.

### Bad 2: Exaggerated contradiction
```text
Contradiction: note-A says "use TypeScript" and note-B says "use Python"
```

Why this fails: different contexts (frontend vs data pipeline). Not a contradiction — just different tools for different jobs. A real contradiction requires the same decision point with opposing conclusions.

### Bad 3: Pattern from 2 data points
```text
Pattern: "caching" mentioned in 2 notes
```

Why this fails: 2 mentions is a coincidence, not a pattern. Need 3+ independent instances with shared mechanism.

### Bad 4: Synthesis disguised as connection review
```text
These 8 notes reveal an emerging philosophy about system design that
prioritizes resilience over performance. The thesis is that...
```

Why this fails: this is weekly-synthesis territory. Connection review reports relationships, not meaning.

## Connection Strength Calibration

### Strong connections (suggest write-back)
- Shared mechanism applied in different contexts
- Explicit reference to the same decision/entity
- One note answers a question posed in another
- Contradicting conclusions about the same topic

### Moderate connections (report but don't push write-back)
- Shared problem domain with different approaches
- Sequential development of an idea across time
- Complementary perspectives on same phenomenon

### Weak connections (report as uncertain)
- Shared tags without conceptual overlap
- Temporal proximity only
- Same author/project but different topics
- Surface keyword matches

## Scope Boundaries

- 5-8 notes: ideal for deep relationship analysis
- 9-12 notes: workable but connections become combinatorial
- 13-15 notes: maximum; prioritize most recent or most connected
- >15 notes: refuse; ask user to narrow scope or split into batches
