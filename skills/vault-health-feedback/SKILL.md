---
name: vault-health-feedback
description: Use when an Obsidian knowledge workflow may be degrading into a passive archive and you need a bounded diagnosis of workflow health, cognitive health, and structural health before deciding what intervention to run next.
---

# vault-health-feedback

## Overview

System-diagnosis skill for OpenCode + Obsidian knowledge workflows.

Core principle: **diagnose whether the system is still producing knowledge flow before diagnosing whether the structure looks tidy.**

Vaults usually fail in order: workflow stops → knowledge stops returning → structure problems become visible later. This skill checks in that order.

## When to Use

Use when the vault feels archival instead of useful, new material enters but little returns, or you need to know the highest-leverage repair.

Do **not** use for first-pass inbox sorting (`inbox-triage`), relationship analysis (`connection-review`), or weekly synthesis.

## Core Pattern

Three-layer health check, **analysis-only** by default:

1. **Workflow Health** — is inbox processing alive? review happening? synthesis happening? context being refreshed?
2. **Cognitive Health** — are notes feeding later thought? are syntheses appearing? are themes revisited?
3. **Structural Health** — orphan zones, fragmentation, hollow clusters

Then: **Risk Signals** (degradation trends) and **Recommended Interventions** (1–3 highest-leverage moves).

Do not repair by default. This is a diagnosis layer, not a repair layer.

## Output Structure

- **Summary** — overall health + weakest layer
- **Health Findings** — Workflow / Cognitive / Structural
- **Risk Signals** — 1–3 degradation trends likely to worsen
- **Recommended Interventions** — 1–3 highest-leverage next moves

## Tool Constraints

⚠️ `obsidian_patch_note` and `obsidian_append_to_note` are not reliably callable. All vault modifications should use `obsidian_write_note`, `obsidian_replace_in_note`, or `obsidian_manage_*`.

## Red Flags

Stop if you: equate neat structure with healthy flow · diagnose from one bad note · scan the whole vault before checking workflow traces · recommend many interventions instead of a few · miss that the real problem is "no output," not "bad folders."

## Common Mistakes

| Mistake | Correction |
|---|---|
| Starting with structure | Start with workflow traces and knowledge return signals |
| Treating every orphan as a major problem | Check whether it reflects real disuse or local independence |
| Giving too many fixes | Recommend only the top 1–3 interventions |
| Using this skill as a cleanup engine | Keep it diagnostic, not corrective |

## Related Skills

**REQUIRED**: `obsidian-mcp` for vault operation safety.

Periodic side-channel diagnosis. Not part of every main workflow run. Feeds into: `inbox-triage`, `connection-review`, `weekly-synthesis`, `opencode-context-maintenance`.
