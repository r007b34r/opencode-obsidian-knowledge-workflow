---
name: vault-health-feedback
description: Load when an Obsidian knowledge workflow may be becoming a passive archive and needs bounded diagnosis of workflow health, cognitive return, structural friction, risk signals, and the highest-leverage repair. Use for system health feedback before cleanup. Do not use for inbox triage, link review, weekly synthesis, or direct restructuring.
license: MIT
compatibility: opencode; requires obsidian-mcp for vault operations
metadata:
  version: "2.0.0"
  last-reviewed: "2026-05-10"
  owner: local
  eval-status: needs-trigger-evals
---

# vault-health-feedback

## Goal

Diagnose whether an Obsidian knowledge system is still producing knowledge flow and cognitive return, rather than judging only whether folders look tidy.

Core principle: **check workflow health first, cognitive return second, structure third.**

## Required Companion Skill

For any vault operation, follow `obsidian-mcp`: do not use `obsidian_patch_note`, do not use `obsidian_append_to_note`, treat `get_note section` as auxiliary only, and verify every write through readback.

## Trigger Boundary

Use this skill when the user says the vault feels archival, knowledge is not returning, system health should be diagnosed, or the highest-leverage repair is unclear.

Do not use this skill for:

- inbox routing -> `inbox-triage`;
- recent-note relationships -> `connection-review`;
- week-level synthesis -> `weekly-synthesis`;
- direct restructuring before diagnosis.

## Health Model

1. **Workflow health**: inbox processing, reviews, syntheses, context refresh.
2. **Cognitive health**: notes return to later thinking, themes recur, older knowledge gets reused.
3. **Structural health**: orphan zones, fragmentation, hollow clusters, tag noise.

## Diagnostic Workflow

1. Look for workflow traces first: Inbox, recent Notes, Meta, Projects.
2. Sample; do not scan the whole vault by default.
3. Record health signals and risk signals.
4. Recommend 1-3 highest-leverage interventions.
5. Do not repair, move, or restructure by default.

## Output Contract

```text
Overall health: healthy / usable but fragile / degrading / archival
Weakest layer: workflow / cognitive / structural
Workflow findings: ...
Cognitive findings: ...
Structural findings: ...
Risk signals: 1-3 items
Recommended interventions: 1-3 items, ranked by leverage
Not recommended now: ...
```

## Exit Criteria

- No more than three recommendations.
- Every risk signal has evidence.
- Structural mess is not treated as the only possible problem.
- No repair is executed without confirmation.

## Gotchas

| Mistake | Consequence | Correction |
|---|---|---|
| Starting from structure | Misdiagnoses the real failure | Start workflow -> cognitive -> structural |
| Treating every orphan as bad | False alarms | Check whether it blocks return value |
| Giving many fixes | No execution focus | Recommend 1-3 interventions |
| Turning diagnosis into cleanup | Unauthorized modification | Report first, ask before repair |

## Minimal Eval Set

Should trigger: diagnose vault health, assess whether the knowledge base is archival, identify the highest-leverage repair, check if the knowledge workflow is broken.

Should not trigger: sort raw notes, suggest links, write weekly synthesis, promote one note.
