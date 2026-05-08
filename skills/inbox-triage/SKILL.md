---
name: inbox-triage
description: Use when an Obsidian inbox contains raw captures, fleeting notes, or unprocessed material that needs low-friction triage to decide what is worth promoting, what should stay, and what can be archived — without full-reading every item.
---

# inbox-triage

## Overview

First-pass sorting skill for OpenCode + Obsidian knowledge workflows.

Core principle: **read shallow by default, escalate selectively, and separate analysis from write-back.**

Prevents two failure modes: everything stays raw forever, or everything gets over-processed too early.

## When to Use

Use when `Inbox/` has unprocessed captures and token budget matters.

Do **not** use for cross-note relationship analysis, weekly synthesis, or write-heavy restructuring.

## Core Pattern

Three-stage funnel, **analysis-only** by default:

1. scope the inbox (`obsidian_list_notes`)
2. read shallow first (`obsidian_get_note format: document-map` for headings, `format: full` only for deep-read candidates)
3. escalate only where necessary

Stop for confirmation before any write-back.

## Decision Outputs

| Decision | Use when |
|---|---|
| `keep-in-inbox` | too raw, not yet ready |
| `promote-to-note` | reusable concept or stable knowledge unit |
| `promote-to-idea` | personal thought, question, or observation |
| `move-to-project` | mainly useful inside active work |
| `archive-or-ignore` | trivial, redundant, stale |
| `needs-deep-read` | shallow evidence is insufficient |

## Output Format

Per item: **Decision** · **Reason** · **Next action**

Batch mode: begin with summary (total / shallow-read / deep-read / promoted / archived / uncertain).

## Evaluation Criteria

Judge using four dimensions (combined pattern, not numeric precision):
- **Reusability** — likely to matter again?
- **Current project relevance** — directly useful to active work?
- **Cognitive density** — contains a real claim, question, or insight?
- **Connection potential** — likely to connect to existing notes or themes?

Decision guide:
- high reusability + high density → `promote-to-note`
- high project relevance + moderate density → `move-to-project`
- low density + low reuse + low connection → `archive-or-ignore`
- emerging personal thought → `promote-to-idea`
- promising but unclear → `needs-deep-read`

## Tool Constraints

⚠️ `obsidian_patch_note` and `obsidian_append_to_note` are not reliably callable (host schema translation bug). Use `obsidian_replace_in_note` for all surgical edits. Use `obsidian_write_note` for new file creation only.

For short notes (< ~500 chars), full read is functionally equivalent to shallow read and is acceptable.

## Red Flags

Stop if you: full-read everything by default · promote every interesting fragment · do synthesis during triage · write back without confirmation · pretend uncertain items are clearly classified.

## Common Mistakes

| Mistake | Correction |
|---|---|
| Full-reading everything | Start shallow, escalate only when needed |
| Turning triage into synthesis | Limit to routing + reasons + next actions |
| Promoting every good fragment | Ask: stable, reusable, project-relevant enough? |
| Archiving too aggressively from shallow reads | Use `needs-deep-read` when ambiguity is meaningful |
| Mixing analysis and modification | Default to analysis-only |

## Related Skills

**REQUIRED**: `obsidian-mcp` for vault operation safety.

Feed into: `connection-review`, `note-promotion`, `weekly-synthesis`.

This skill is the **gatekeeper**, not the finisher.
