---
name: note-promotion
description: Use when a capture, idea, relationship finding, or weekly synthesis result has proven valuable enough to be upgraded into a more stable, reusable, and linkable knowledge note — without over-promoting weak material.
---

# note-promotion

## Overview

Knowledge-upgrade skill for OpenCode + Obsidian knowledge workflows.

Core principle: **promote selectively. A note is healthier when it becomes more stable, reusable, and linkable — not merely more polished.**

Prevents two failure modes: never promoting enough (insight stays raw), and promoting too aggressively (vault fills with hollow notes).

## When to Use

Use when material from inbox-triage, ideas, connection-review, or weekly-synthesis has shown clear value and deserves a more durable form.

Do **not** use for first-pass sorting (`inbox-triage`), relationship discovery (`connection-review`), or weekly interpretation (`weekly-synthesis`).

## Core Pattern

Four-step decision, **analysis-first** by default:

1. **Decide whether promotion is warranted** (stability, reusability, independence, connection value, compression benefit)
2. **Choose target note type**
3. **Define minimum promotion strategy** (what to preserve, clarify, remove)
4. **Specify integration targets** (where the promoted note should reconnect)

Promote only when the promoted form will be **more useful than the current form**.

## Target Note Types

| Type | Use when |
|---|---|
| `reference-note` | stable external insight or concept worth reusing |
| `idea-note` | personal thought or framing worth preserving |
| `project-note` | knowledge mainly useful inside active work |
| `topic-note` | several related notes need a stronger conceptual home |
| `synthesis-note` | a cross-note understanding deserves durable articulation |
| `contradiction-note` | an important tension deserves explicit framing |
| `question-note` | the question itself is worth preserving and returning to |

## Output Format

Per candidate: **Promotion Decision** · **Target Type** · **Reason** · **Promotion Strategy** · **Follow-up Integration**

## Tool Constraints

⚠️ `obsidian_patch_note` and `obsidian_append_to_note` are not reliably callable. Use `obsidian_replace_in_note` for rewrites, `obsidian_write_note` for new promoted notes.

## Red Flags

Stop if you: promote every promising fragment · use promotion as a synonym for editing · rewrite too much · force a note type before the material is stable · polish weak content into fake clarity.

## Common Mistakes

| Mistake | Correction |
|---|---|
| Promoting too early | Wait until stable, independent, or recurrent enough |
| Treating every good idea as a note | Ask whether the note form creates real retrieval benefit |
| Overwriting original insight voice | Preserve strong original phrasing |
| Promoting without integration | Always specify where the promoted note should reconnect |

## Related Skills

**REQUIRED**: `obsidian-mcp` for vault operation safety.

Usable after: `inbox-triage`, `connection-review`, `weekly-synthesis`. This is the **stabilization layer**, not the intake layer.
