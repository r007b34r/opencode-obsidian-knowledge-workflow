# Knowledge Workflow Skill Test Matrix

## Purpose

Pushes the skill system from "looks reasonable" to "verifiably reliable under pressure."

Core principle: **A skill is only truly usable if it still works under pressure.**

## Pressure Test Scenarios per Skill

### inbox-triage
- **Failure mode**: full-reading everything, over-promotion, premature archiving, mini-synthesis
- **Test**: mixed high/low/ambiguous-value items in same inbox
- **Pass if**: uses `needs-deep-read`, doesn't promote all fragments, output is actionable but not over-processed

### connection-review
- **Failure mode**: keyword-matching as connection, exaggerating contradictions, scope creep
- **Test**: real connections + weak similarities + pseudo-conflicts mixed together
- **Pass if**: link suggestions are specific, patterns aren't over-generalized, contradictions only appear with real tension

### weekly-synthesis
- **Failure mode**: recap disguised as synthesis, forced thesis, too many actions
- **Test**: scattered week with weak signal
- **Pass if**: willing to say "conclusion is uncertain," thesis isn't generic, action/question count is controlled

### opencode-context-maintenance
- **Failure mode**: treating minor wording differences as drift, over-reading vault, config editing creep
- **Test**: context slightly stale but host reality unchanged
- **Pass if**: distinguishes real drift from old phrasing, defers config concerns, recommends few but sharp updates

### vault-health-feedback
- **Failure mode**: equating structural mess with system failure, missing the real problem
- **Test**: messy structure but active workflow
- **Pass if**: correctly ranks problem severity, recommends 1-3 interventions, focuses on workflow/cognitive layers

### note-promotion
- **Failure mode**: promoting too early, over-rewriting, no integration after promotion
- **Test**: good fragment that isn't yet stable enough
- **Pass if**: promotes only when clear reuse benefit exists, doesn't confuse polish with promotion

## Cross-Skill Boundary Tests

- triage doesn't do review; review doesn't take over triage
- review stops at relationships; synthesis handles week-level meaning
- synthesis interprets; context-maintenance persists
- promotion doesn't substitute for any upstream skill

## Recommended Verification Order

1. inbox-triage → 2. connection-review → 3. weekly-synthesis → 4. opencode-context-maintenance → 5. vault-health-feedback → 6. note-promotion
