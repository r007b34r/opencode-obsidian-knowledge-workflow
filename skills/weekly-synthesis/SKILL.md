---
name: weekly-synthesis
description: Use when recent Obsidian notes need week-level synthesis to surface an emerging thesis, key contradictions or gaps, and the single most valuable next action or question.
---

# weekly-synthesis

## Overview

Week-level interpretation skill for OpenCode + Obsidian knowledge workflows.

Core principle: **synthesize meaning, not activity. Use recent changes as the main signal and older notes only as background calibration.**

Turns recent note activity into an emerging thesis, contradictions/gaps, one action, one question, and follow-up note suggestions.

## When to Use

Use when recent notes orbit the same topic or when scattered insight needs a stable frame. Do **not** use for first-pass inbox sorting (`inbox-triage`), relationship discovery only (`connection-review`), or project status reports.

## Core Pattern

Four-part interpretive pass, **analysis-only** by default:

1. **Emerging Thesis** — the strongest week-level understanding now forming
2. **Contradictions** — meaningful tensions (new vs old claims, goal vs method)
3. **Gaps** — missing perspectives, unanswered questions
4. **One Action / One Question** — exactly one of each, not a list

Then: **Follow-up note suggestions**

Write a synthesis note only after explicit user approval.

## Input Scope

Recent 7 days of notes plus a small, justified set of older background notes.

## Read shallow first: `obsidian_get_note format: document-map` for structure, `format: full` only when confirming a thesis or tension.

## Output Format

Begin with summary (what was reviewed, themes, stability). Then: **Emerging Thesis** · **Contradictions** · **Gaps** · **One Action** · **One Question** · **Follow-up Note Suggestions**.

## Tool Constraints

⚠️ `obsidian_patch_note` and `obsidian_append_to_note` are not reliably callable. Use `obsidian_replace_in_note` for edits, `obsidian_write_note` for new file creation.

## Red Flags

Stop if you: summarize activity instead of extracting meaning · scan the whole vault · treat weak patterns as strong theses · give five actions instead of one · write synthesis before confirmation.

## Common Mistakes

| Mistake | Correction |
|---|---|
| Turning synthesis into recap | Ask what understanding is forming, not what happened |
| Using too much history | Keep older notes as calibration, not primary input |
| Calling everything a contradiction | Reserve for meaningful tension |
| Returning many actions | Force exactly one action and one question |

## Related Skills

**REQUIRED**: `obsidian-mcp` for vault operation safety.

After: `connection-review`. Before: `opencode-context-maintenance`. Feed into: `note-promotion`.
