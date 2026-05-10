---
name: weekly-synthesis
description: "Load when recent Obsidian notes need time-window synthesis: an emerging thesis, meaningful contradictions, gaps, exactly one next action, exactly one next question, and follow-up note suggestions. Use for week-level or user-specified-period meaning-making. Do not use for inbox triage, link-only review, project status reporting, or direct note promotion."
license: MIT
compatibility: opencode; requires obsidian-mcp for vault operations
metadata:
  version: "2.0.0"
  last-reviewed: "2026-05-10"
  owner: local
  eval-status: needs-trigger-evals
---

# weekly-synthesis

## Goal

Turn recent Obsidian note activity into a stable interpretation: emerging thesis, contradictions, gaps, exactly one action, exactly one question, and follow-up note suggestions.

Core principle: **synthesize meaning, not activity.**

## Required Companion Skill

For any vault operation, follow `obsidian-mcp`: do not use `obsidian_patch_note`, do not use `obsidian_append_to_note`, treat `get_note section` as auxiliary only, and verify every write through readback.

## Trigger Boundary

Use this skill when the user asks for a weekly synthesis, what recent notes mean, an emerging thesis, or one most valuable next action/question. Default window is seven days unless the user specifies another period.

Do not use this skill for:

- raw material routing -> `inbox-triage`;
- link-only or relationship review -> `connection-review`;
- project status reporting;
- promoting the result into a stable note -> hand off to `note-promotion` after analysis.

## Input Scope

Default: recent seven days. If the user says "recent", "this research round", or "this month", use that semantic window.

Read strategy:

1. Identify notes in the time window.
2. Read `document-map` first to understand theme distribution.
3. Deep-read only notes that support thesis, contradiction, or gap claims.
4. Use older notes only for calibration, not as the primary signal.

## Synthesis Structure

1. **Emerging thesis**: one claim plus supporting evidence.
2. **Contradictions**: only tensions that matter for reasoning.
3. **Gaps**: missing perspective, evidence, decision, or experiment.
4. **One action**: exactly one highest-value next move.
5. **One question**: exactly one question worth preserving.
6. **Follow-up note suggestions**: optional downstream notes.

## Output Contract

```text
Scope: time window, note count, deep-read count
Theme stability: low/medium/high
Emerging thesis: ...
Contradictions: ...
Gaps: ...
One action: ...
One question: ...
Follow-up note suggestions: ...
```

Do not write a synthesis note by default. After approval, create with `obsidian_write_note overwrite:false` and read back.

## Exit Criteria

- Output is not a recap.
- Exactly one action and exactly one question.
- Thesis has evidence; contradictions are not forced.
- Any written note has been read back and verified.

## Gotchas

| Mistake | Consequence | Correction |
|---|---|---|
| Recapping activity | No new understanding | Extract thesis and gaps |
| Returning many actions | User loses focus | Force one action |
| Letting old notes dominate | Recent signal disappears | Use older notes only as calibration |
| Writing before confirmation | Unauthorized vault changes | Ask first, then verify |

## Minimal Eval Set

Should trigger: weekly synthesis, synthesize recent notes into a thesis, identify one next action, extract one question from a research round.

Should not trigger: process inbox, only suggest wikilinks, write a project status report, promote one note.
