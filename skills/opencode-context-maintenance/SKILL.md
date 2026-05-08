---
name: opencode-context-maintenance
description: Use when OpenCode knowledge-workflow context is drifting — long-term vault context, current project context, and host-level reality no longer align — and you need to identify what should be updated without defaulting to config changes.
---

# opencode-context-maintenance

## Overview

Context-alignment skill for OpenCode + Obsidian knowledge workflows.

Core principle: **context is a layered system, not a single file. Maintenance means checking whether those layers still agree.**

Inspects three context layers: long-term vault context, current work context, and host reality context. Detects drift without auto-editing configs.

## When to Use

Use when context files feel stale, project direction has shifted but context hasn't, or host-level reality changed and written context still reflects older assumptions.

Do **not** use for first-pass inbox sorting (`inbox-triage`), relationship discovery (`connection-review`), or weekly interpretation (`weekly-synthesis`).

## Core Pattern

Three-layer alignment pass, **analysis-only** by default:

1. **Identify context entry points** — which notes/configs are functioning as context sources
2. **Check for drift** — across long-term, current work, and host reality layers
3. **Recommend updates** — what to update and why; flag config concerns without auto-editing

Stop for confirmation. Do not change `opencode.json` or MCP config by default.

## Output Structure

- **Summary** — which layer is most out of date
- **Context Drift Findings** — grouped by layer (long-term / current work / host reality)
- **Recommended Updates** — Target · Why · Suggested change · Priority
- **Deferred Config Concerns** — host issues to notice but not auto-edit

## Tool Constraints

⚠️ `obsidian_patch_note` and `obsidian_append_to_note` are not reliably callable. Use `obsidian_replace_in_note` for note updates, `obsidian_write_note` for new context files. Never auto-edit host config files.

## Red Flags

Stop if you: assume context lives in one file · treat config as default write target · read the whole vault to judge drift · update context because a note feels old without evidence · convert minor wording differences into drift.

## Common Mistakes

| Mistake | Correction |
|---|---|
| Treating context as one document | Inspect long-term notes, work notes, and host reality separately |
| Over-reading the vault | Focus only on context entry points and recent evidence |
| Jumping straight to config edits | Put host issues in deferred concerns first |
| Updating everything after every weekly review | Only update when the change is stable enough |

## Related Skills

**REQUIRED**: `obsidian-mcp` for vault operation safety.

After: `weekly-synthesis`. This is the **calibration layer**, not the intake layer.
