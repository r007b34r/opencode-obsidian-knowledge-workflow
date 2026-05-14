# Vault Health Feedback Templates

## Health Report Template

```text
## Vault Health Diagnosis
Date: YYYY-MM-DD
Sample scope: [what was checked -- paths, note count, time range]

---

### Overall Assessment
Health: [healthy / usable but fragile / degrading / archival]
Weakest layer: [workflow / cognitive / structural]
Confidence: [high -- clear signals / medium -- mixed signals / low -- insufficient data]

---

### Layer Findings

#### Workflow Layer (checked first)
Status: [active / stale / dead]
Evidence:
- Inbox: [item count, oldest item age]
- Synthesis: [last synthesis date, frequency]
- Triage: [last triage activity, frequency]
- Promotion: [last promotion, frequency]

#### Cognitive Layer
Status: [returning value / flat / declining]
Evidence:
- Reuse rate: [N/M sampled notes have backlinks]
- Theme recurrence: [themes that appear across time windows]
- Revisitation: [notes referenced after creation]

#### Structural Layer
Status: [clean / messy but functional / blocking workflow]
Evidence:
- Orphan rate: [percentage of unlinked notes]
- Tag entropy: [tags with <3 uses]
- Navigation: [user-reported findability]

---

### Risk Signals
1. [highest risk -- what + evidence]
2. [second risk -- what + evidence] (if applicable)
3. [third risk -- what + evidence] (if applicable)

---

### Recommended Interventions (max 3, ranked by leverage)
1. [highest-leverage action]: [why this first] -- [expected impact]
2. [second action]: [why] -- [expected impact]
3. [third action]: [why] -- [expected impact]

### Not Recommended Now
- [action to avoid]: [why it would be premature or counterproductive]
- [action to defer]: [what would need to change first]
```
## Intervention Recommendation Template

For each recommended intervention:

```text
## Intervention: [name]
Priority: [1/2/3]
Target layer: [workflow / cognitive / structural]
Action: [specific, concrete step]
Why highest-leverage: [what this unblocks]
Expected outcome: [measurable change]
Prerequisite: [what must be true before this works]
Risk if skipped: [what degrades further]
Handoff: [skill to use -- e.g., inbox-triage, connection-review]
```

### Example intervention
```text
## Intervention: Restart triage cadence
Priority: 1
Target layer: workflow
Action: process 5 oldest inbox items using inbox-triage skill
Why highest-leverage: workflow is stale because processing stopped;
  restarting triage unblocks synthesis and promotion downstream
Expected outcome: inbox age drops below 14 days; synthesis becomes possible
Prerequisite: inbox items exist (confirmed: 23 items present)
Risk if skipped: inbox grows indefinitely; vault becomes write-only archive
Handoff: inbox-triage
```

## Layer-by-Layer Finding Template

For detailed per-layer reporting:

```text
## [Layer Name] Layer Assessment
Status: [score]
Checked: [what was sampled -- paths, queries, counts]

### Positive Signals
- [signal]: [evidence]

### Risk Signals
- [signal]: [evidence]

### Threshold Comparison
| Metric | Observed | Threshold | Status |
|--------|----------|-----------|--------|
| [metric] | [value] | [threshold] | [ok/warning/critical] |

### Layer Verdict
[One sentence: what this layer status means for overall health]
```

### Example layer finding
```text
## Workflow Layer Assessment
Status: stale
Checked: Inbox/ (list_notes), search "type: synthesis", search "triaged"

### Positive Signals
- Capture is still happening (8 new inbox items this week)

### Risk Signals
- Processing has stopped (no triage in 12 days)
- Synthesis gap (last synthesis 3 weeks ago)

### Threshold Comparison
| Metric | Observed | Threshold | Status |
|--------|----------|-----------|--------|
| Inbox oldest item | 45 days | 30 days | warning |
| Synthesis frequency | 1/3 weeks | 1/week | critical |
| Triage activity | 12 days ago | 7 days | warning |

### Layer Verdict
Workflow is stale: capture continues but processing has stopped.
Cognitive and structural layers cannot improve until workflow resumes.
```
