---
name: connection-review
description: Use when recent Obsidian notes need relationship analysis to surface likely links, emerging patterns, contradictions, and follow-up note opportunities — without scanning the entire vault.
---

# connection-review

## Overview

Relationship-analysis skill for OpenCode + Obsidian knowledge workflows.

Core principle: **start with the most local and actionable relationships, then surface higher-order patterns and tensions only where evidence supports them.**

Examines recently changed notes plus a small number of relevant older notes. Not a full-vault graph engine, not a weekly synthesis engine.

## When to Use

Use when recent notes are accumulating but remain isolated, or when the user suspects themes are emerging but doesn't want full synthesis yet.

Do **not** use for first-pass inbox sorting (`inbox-triage`), weekly synthesis, or full-vault restructuring.

## Core Pattern

Three-layer relationship pass, **analysis-only** by default:

1. **Link candidates** — actionable note-to-note or note-to-project connections
2. **Pattern signals** — repeated themes or converging problems
3. **Contradiction signals** — meaningful tensions (new vs old, goal vs method)

Then: **Follow-up note suggestions**

Stop for confirmation before any write-back. Only lightweight internal links may be written after approval.

## Input Scope

Start with recently created/modified notes plus a small supporting set of older notes. Do **not** scan the whole vault by default.

## Output Structure

- **Connection Suggestions** — concrete like `[[A]] should link to [[B]]`
- **Pattern Findings** — repeated themes, brief and specific
- **Contradiction Findings** — only tensions that matter for reasoning
- **Follow-up Note Suggestions** — synthesis note, contradiction note, topic index, etc.

## Tool Constraints

⚠️ `obsidian_patch_note` and `obsidian_append_to_note` are not reliably callable. Use `obsidian_replace_in_note` for all surgical edits. Use `obsidian_write_note` for new file creation only.

## Red Flags

Stop if you: scan the whole vault by default · confuse weak thematic resemblance with real connection · turn every overlap into a link · write links before confirmation · present speculative contradictions as confirmed conflicts.

## Common Mistakes

| Mistake | Correction |
|---|---|
| Reviewing the whole vault | Start from recent notes, add only a small supporting set |
| Treating shared keywords as real connection | Look for meaningful conceptual or project-level overlap |
| Doing synthesis too early | Limit to links, patterns, contradictions, and follow-up suggestions |
| Writing links back immediately | Keep default mode analysis-only |

## Related Skills

**REQUIRED**: `obsidian-mcp` for vault operation safety.

After: `inbox-triage`. Before: `weekly-synthesis`. Feed into: `note-promotion`.
