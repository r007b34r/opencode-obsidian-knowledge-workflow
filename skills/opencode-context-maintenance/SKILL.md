---
name: opencode-context-maintenance
description: "Load when OpenCode or Obsidian knowledge-workflow context may be stale, inconsistent, or drifting: vault notes, current project context, host configuration, model settings, MCP reality, or written assumptions no longer align. Use to diagnose and recommend context updates without defaulting to config edits. Do not use for inbox triage, weekly synthesis, or direct vault CRUD alone."
license: MIT
compatibility: opencode; requires obsidian-mcp for vault operations
metadata:
  version: "2.0.0"
  last-reviewed: "2026-05-10"
  owner: local
  eval-status: needs-trigger-evals
---

# opencode-context-maintenance

## Goal

Diagnose drift across the OpenCode + Obsidian knowledge-workflow context stack: long-term vault context, current work context, and host reality.

Core principle: **context is layered, not a single file. Maintenance aligns layers; it does not default to config edits.**

## Required Companion Skill

For any vault operation, follow `obsidian-mcp`: do not use `obsidian_patch_note`, do not use `obsidian_append_to_note`, treat `get_note section` as auxiliary only, and verify every write through readback.

## Trigger Boundary

Use this skill when the user says context is stale, records disagree with reality, configuration changed but notes did not, model/MCP assumptions drifted, or OpenCode/Obsidian context should be checked.

Do not use this skill for:

- raw inbox sorting -> `inbox-triage`;
- week-level meaning extraction -> `weekly-synthesis`;
- direct vault CRUD -> `obsidian-mcp` alone;
- vault health diagnosis -> `vault-health-feedback`.

## Three Context Layers

1. **Long-term vault context**: stable knowledge, methodology, project indexes.
2. **Current work context**: active task, recent decisions, user preferences.
3. **Host reality context**: OpenCode config, MCP availability, model settings, tool constraints, observed errors.

## Workflow

1. Identify context entry points: which notes/configs are acting as context sources.
2. Gather evidence from relevant notes and necessary host facts.
3. Compare layers for disagreement.
4. Recommend what to update, why, suggested wording, and priority.
5. Put config changes in deferred concerns by default.

## Output Contract

```text
Summary: most drifted layer
Long-term vault context: finding / evidence / recommendation
Current work context: finding / evidence / recommendation
Host reality context: finding / evidence / recommendation
Recommended updates: target · why · suggested change · priority
Deferred config concerns: host changes requiring user confirmation
```

Default mode is analysis-only. Before writing context updates, show the exact intended change and wait for confirmation. Verify every write.

## Exit Criteria

- Every drift finding has evidence.
- Old wording is not treated as drift without conflict.
- No automatic edits to `opencode.json`, MCP config, model config, or git history.

## Gotchas

| Mistake | Consequence | Correction |
|---|---|---|
| Treating context as one document | Misses current-work or host-reality drift | Check all three layers |
| Editing config directly | Can break the environment | Defer config concerns first |
| Reading the whole vault | Token waste | Find context entry points |
| Updating because a note feels old | Creates new drift | Require evidence of conflict or new fact |

## Minimal Eval Set

Should trigger: records disagree with actual config, model baseline changed, MCP error should be captured as context, OpenCode memory is stale.

Should not trigger: process inbox, weekly synthesis, add tags, diagnose vault health.
