---
name: inbox-triage
description: Load when an Obsidian inbox, capture folder, raw note list, fleeting notes, or unprocessed material needs first-pass routing into keep, promote, project, archive, or deep-read decisions. Use for low-friction triage before synthesis. Do not use for relationship analysis, weekly synthesis, vault health diagnosis, or writing final polished notes.
license: MIT
compatibility: opencode; requires obsidian-mcp for vault operations
metadata:
  version: "2.0.0"
  last-reviewed: "2026-05-10"
  owner: local
  eval-status: trigger-evals-defined
---

# inbox-triage

## Resource Files

- `evals/trigger-cases.md`: should-trigger, should-not-trigger, and near-miss prompts.
- `references/examples.md`: good/bad triage examples and decision examples.
- `references/templates.md`: batch output, single-item output, and confirmation templates.
- `CHANGELOG.md`: real trigger misses, false triggers, and triage failure notes.

## Goal

Perform first-pass routing for an Obsidian inbox, capture folder, raw notes, fleeting notes, or unprocessed material. Core principle: **read shallow first, escalate selectively, and separate analysis from write-back.**

This is the intake layer, not the synthesis layer and not the final note-writing layer.

## Required Companion Skill

For any vault operation, follow `obsidian-mcp`. In particular:

- Do not use `obsidian_patch_note`.
- Do not use `obsidian_append_to_note`.
- Do not rely on `obsidian_get_note format: section` as the only verification path.
- Write-back must use `obsidian_replace_in_note`, `obsidian_write_note overwrite:false`, or `obsidian_manage_*`, followed by readback verification.

## Trigger Boundary

Use this skill when the user asks to process an inbox, sort captures, route raw notes, decide what is worth promoting, or decide what can be archived.

Do not use this skill for:

- cross-note relationship analysis -> `connection-review`;
- week-level meaning extraction -> `weekly-synthesis`;
- stable-note creation -> `note-promotion`;
- system health diagnosis -> `vault-health-feedback`.

## Input Scope

Default scope is `Inbox/` or the user-specified capture path. Do not scan the whole vault.

Read strategy:

1. Use `obsidian_list_notes` to identify candidates.
2. Read `document-map` first; short notes may be read as `content/full`.
3. Deep-read only when the routing decision is genuinely uncertain.

## Decisions

| Decision | Use when |
|---|---|
| `keep-in-inbox` | Too raw, too early, or still incubating |
| `promote-to-note` | Stable, reusable, and independent enough to become a knowledge unit |
| `promote-to-idea` | Personal observation, question, or framing worth preserving |
| `move-to-project` | Mainly useful inside an active project |
| `archive-or-ignore` | Low-density, redundant, stale, or unlikely to return value |
| `needs-deep-read` | Shallow evidence is insufficient but potential value is high |

## Evaluation Dimensions

- **Reusability**: will this matter again?
- **Current relevance**: does it support an active project?
- **Cognitive density**: does it contain a real claim, question, or insight?
- **Connection potential**: can it connect to existing themes?

## Output Contract

For batches, start with: total / shallow-read / deep-read / promote / archive / uncertain.

For each item:

```text
Path: ...
Decision: ...
Reason: ...
Next action: ...
Write-back needed: yes/no; if yes, ask for confirmation first
```

Default mode is analysis-only. Before write-back, list exact intended changes and wait for user confirmation.

## Exit Criteria

- Every candidate has a routing decision or `needs-deep-read`.
- Triage has not turned into synthesis.
- Any write-back has passed `obsidian-mcp` readback verification.

## Gotchas

| Mistake | Consequence | Correction |
|---|---|---|
| Full-reading everything by default | Token waste and premature over-processing | Read shallow first |
| Promoting anything interesting | Hollow notes accumulate | Require stability and reuse value |
| Summarizing during triage | Intake becomes synthesis | Output routing + reason + next action only |
| Archiving aggressively from shallow reads | Valuable material may be lost | Use `needs-deep-read` when uncertainty matters |

## Minimal Eval Set

Should trigger: process Inbox, sort raw notes, decide which captures are worth promotion, decide what to archive.

Should not trigger: write a weekly synthesis, analyze note relationships, turn one stable idea into a final note, diagnose vault health.
