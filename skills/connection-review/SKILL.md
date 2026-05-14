---
name: connection-review
description: >
  Analyze relationships among recent or selected Obsidian notes: candidate links,
  repeated patterns, meaningful contradictions, and follow-up note opportunities.
  Load when user asks to find connections, suggest wikilinks, identify patterns,
  or surface contradictions in a bounded note set.
  Do NOT use for inbox triage, weekly synthesis, vault health, or note promotion.
license: Apache-2.0
compatibility:
  runtime: opencode
  requires: [obsidian-mcp]
  verified-host: "obsidian-mcp-server@3.1.5 / Windows / 2026-05-10"
metadata:
  version: "4.0.0"
  last-reviewed: "2026-05-14"
  owner: r007b34r
  eval-status: edd-validated
  token-budget: "~2600 tokens"
triggers:
  keywords: [connections, links, relationships, patterns, contradictions, wikilinks, graph]
  contexts: ["bounded set of obsidian notes needing relationship analysis"]
  negative: [triage, inbox, sort, synthesis, weekly, health, promote, create note]
boundaries:
  owns: [link discovery, pattern detection, contradiction surfacing, follow-up suggestions]
  delegates_to:
    note-promotion: "follow-up note suggestion accepted by user"
    weekly-synthesis: "patterns span full week window"
  never_absorbs: [inbox routing, synthesis, health diagnosis, context maintenance]
continuations:
  on_success:
    - skill: note-promotion
      condition: "follow-up note suggestion accepted by user"
    - skill: weekly-synthesis
      condition: "patterns span full week window and user requests synthesis"
  on_failure:
    - skill: inbox-triage
      condition: "notes too raw for relationship analysis"
  escalation:
    - human
      condition: "all connections are weak/uncertain"
---

# connection-review

## Constraints

- NEVER scan whole vault; scope = 5-15 primary notes + small supporting set
- NEVER treat keyword overlap alone as evidence of connection
- NEVER synthesize week-level meaning (that is weekly-synthesis)
- NEVER write links without explicit user confirmation
- NEVER turn review into whole-vault graphing

## Companion Skill

All vault operations follow `obsidian-mcp`. Forbidden: `obsidian_patch_note`, `obsidian_append_to_note`. Verify every write through readback.

## Trigger Boundary

Use when: find note connections, suggest wikilinks, identify repeated patterns, surface contradictions, review relationships in a bounded set.

Do NOT use for:
- Raw inbox sorting → `inbox-triage`
- Week-level thesis and one action → `weekly-synthesis`
- Vault system health diagnosis → `vault-health-feedback`
- Upgrading material into stable notes → `note-promotion`

## Procedure

### Phase 1: Scope
1. `obsidian_list_notes` or `obsidian_search_notes` → identify recent/specified set
2. Bound to 5-15 primary notes; reject unbounded requests (ask user to narrow)

### Phase 2: Read
1. For each: `obsidian_get_note format:"document-map"` → structure overview
2. `format:"content"` only when evidence is needed for a specific connection
3. Read older notes only to verify a suspected relationship

### Phase 3: Analyze
1. **Link candidates**: explicit note-to-note or note-to-project relationships
2. **Pattern signals**: repeated themes, problems, or methods across 3+ notes
3. **Contradiction signals**: new vs old claims, goal vs method, assumption vs evidence
4. **Follow-up note suggestions**: synthesis, topic, contradiction, or question notes

<details>
<summary>Pattern Detection Heuristics (expand only when patterns are ambiguous)</summary>

- Repeated method across 3+ notes = method pattern
- Same problem framed differently in 2+ notes = contradiction candidate
- Same entity referenced but never linked = link candidate
- Shared tag + temporal proximity alone ≠ connection (keyword trap)
- Contradiction requires real tension, not mere difference of topic

</details>

### Phase 4: Report
Output per Output Contract. Write lightweight wikilinks only after explicit user approval.

## Output Contract

```text
Reviewed scope: [note count, time range]
---
Connection suggestions:
  A → B; reason; evidence; write-back suggested?
Pattern findings: ...
Contradiction findings: ...
Follow-up note suggestions: ...
Uncertain items: relationships requiring more evidence
```

Default mode: analysis-only. Write links only after confirmation, using `obsidian_replace_in_note` + readback.

## Gotchas

### Gotcha 1: Keyword matching as connection
**What happens:** Agent suggests links because two notes share the same tag or word
**Why it's wrong:** Keyword overlap without conceptual relationship creates noise in the graph
**Correct approach:** Require conceptual, project, or evidence-based relationship; cite specific content

### Gotcha 2: Scope creep into whole-vault graphing
**What happens:** Agent starts reading notes outside the specified set
**Why it's wrong:** Violates bounded scope constraint; wastes token budget
**Correct approach:** Stay within 5-15 primary notes; read outside only to verify a specific suspected link

### Gotcha 3: Review becomes synthesis
**What happens:** Agent extracts a thesis or "what it all means" from the connections
**Why it's wrong:** That is weekly-synthesis territory; connection-review stops at relationships
**Correct approach:** Report links, patterns, contradictions, follow-ups — do not interpret meaning

## Validators

- `validators/pre-check.sh`: Confirms note set is bounded (≤15 primary notes)
- `validators/post-check.sh`: Verifies output contains no synthesis markers

## Exit Criteria

- Every connection suggestion names both endpoints and cites evidence
- Patterns and contradictions are not based on keyword overlap alone
- Whole vault was not scanned
- Any written link has been read back and verified
