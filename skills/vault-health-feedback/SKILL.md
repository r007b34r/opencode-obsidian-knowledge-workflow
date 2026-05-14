---
name: vault-health-feedback
description: >
  Diagnose whether an Obsidian knowledge workflow is producing cognitive return
  or becoming a passive archive. Load when user says vault feels archival,
  knowledge is not returning, system health should be diagnosed, or highest-leverage
  repair is unclear. Do NOT use for inbox triage, link review, weekly synthesis,
  or direct restructuring.
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
  token-budget: "~2300 tokens"
triggers:
  keywords: [health, archival, passive, stale, broken workflow, 健康, 诊断, 归档化]
  contexts: ["obsidian vault may be becoming passive archive"]
  negative: [triage, inbox, sort, links, connections, synthesis, weekly, promote, create note]
boundaries:
  owns: [workflow health diagnosis, cognitive return assessment, structural friction detection]
  delegates_to:
    inbox-triage: "diagnosis reveals inbox backlog as root cause"
    opencode-context-maintenance: "diagnosis reveals context drift"
  never_absorbs: [inbox routing, relationship analysis, synthesis, promotion, direct restructuring]
continuations:
  on_success:
    - skill: inbox-triage
      condition: "root cause is inbox backlog"
    - skill: opencode-context-maintenance
      condition: "root cause is context drift"
  on_failure:
    - skill: opencode-context-maintenance
      condition: "vault paths inaccessible, possible config issue"
  escalation:
    - human
      condition: "vault is deeply archival, needs structural redesign"
---

# vault-health-feedback

## Constraints

- NEVER scan whole vault; sample strategically
- NEVER give more than 3 recommendations
- NEVER equate structural mess with system failure (check workflow first)
- NEVER repair, move, or restructure without explicit confirmation
- Check layers in order: workflow → cognitive → structural

## Companion Skill

All vault operations follow `obsidian-mcp`. Forbidden: `obsidian_patch_note`, `obsidian_append_to_note`. Verify every write through readback.

## Trigger Boundary

Use when: vault feels archival, knowledge not returning, system health diagnosis needed, highest-leverage repair unclear.

Do NOT use for:
- Inbox routing → `inbox-triage`
- Recent-note relationships → `connection-review`
- Week-level synthesis → `weekly-synthesis`
- Direct restructuring before diagnosis

## Procedure

### Phase 1: Workflow Layer (always check first)
1. `obsidian_list_notes path:"Inbox/"` → inbox freshness (items, age)
2. `obsidian_search_notes query:"type: synthesis"` → synthesis frequency
3. Check for recent triage/review/promotion activity
4. Score: active / stale / dead

### Phase 2: Cognitive Layer (only if workflow is active or stale)
1. Sample 5-10 recent notes for reuse signals (links back, references)
2. Check if themes recur across time windows
3. Look for notes that were never revisited after creation
4. Score: returning value / flat / declining

### Phase 3: Structural Layer (only if cognitive layer shows issues)
1. Check for orphan zones, hollow clusters, tag noise
2. Identify fragmentation patterns
3. Score: clean / messy but functional / blocking workflow

<details>
<summary>Health Metrics Reference (expand for quantitative thresholds)</summary>

- Inbox freshness: items >30 days old = stale signal
- Synthesis frequency: <1 per month = workflow gap
- Reuse rate: <10% of notes ever linked-to = cognitive concern
- Orphan rate: >40% unlinked notes = structural concern
- Tag entropy: >50 tags with <3 uses each = noise

</details>

### Phase 4: Recommend
1-3 highest-leverage interventions, ranked. Report what NOT to do now.

## Output Contract

```text
Overall health: healthy / usable but fragile / degrading / archival
Weakest layer: workflow / cognitive / structural
---
Workflow findings: ... (evidence)
Cognitive findings: ... (evidence)
Structural findings: ... (evidence)
Risk signals: 1-3 items
Recommended interventions: 1-3 items, ranked by leverage
Not recommended now: ...
```

## Gotchas

### Gotcha 1: Starting from structure
**What happens:** Agent counts orphans and messy folders first
**Why it's wrong:** Structural mess may be irrelevant if workflow is healthy
**Correct approach:** Always check workflow → cognitive → structural in order

### Gotcha 2: Too many recommendations
**What happens:** Agent gives 5-7 improvement suggestions
**Why it's wrong:** No execution focus; user is overwhelmed
**Correct approach:** Maximum 3 interventions, ranked by leverage

### Gotcha 3: Diagnosis becomes cleanup
**What happens:** Agent starts moving/renaming/restructuring during diagnosis
**Why it's wrong:** Unauthorized modification; diagnosis should inform, not act
**Correct approach:** Report findings, recommend interventions, wait for confirmation

## Validators

- `validators/pre-check.sh`: Confirms vault is accessible for sampling
- `validators/post-check.sh`: Verifies ≤3 recommendations and layer order respected

## Exit Criteria

- No more than 3 recommendations
- Every risk signal has evidence
- Layers checked in order (workflow → cognitive → structural)
- No repair executed without confirmation
