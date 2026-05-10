---
name: connection-review
description: "Load when recent Obsidian notes, newly promoted notes, or a small set of selected notes need relationship analysis: likely links, repeated patterns, meaningful contradictions, and follow-up note opportunities. Use for local graph review without scanning the whole vault. Do not use for first-pass inbox triage, weekly synthesis, or vault health diagnosis."
license: MIT
compatibility: opencode; requires obsidian-mcp for vault operations
metadata:
  version: "2.0.0"
  last-reviewed: "2026-05-10"
  owner: local
  eval-status: needs-trigger-evals
---

# connection-review

## Goal

Review relationships across recent or user-selected Obsidian notes: candidate links, pattern signals, contradiction signals, and follow-up note opportunities.

Core principle: **start from local, actionable relationships; surface higher-order patterns only when evidence supports them.**

## Required Companion Skill

For any vault operation, follow `obsidian-mcp`: do not use `obsidian_patch_note`, do not use `obsidian_append_to_note`, treat `get_note section` as auxiliary only, and verify every write through readback.

## Trigger Boundary

Use this skill when the user asks what recent notes connect to, which notes should link, what patterns are emerging, or whether there are meaningful contradictions.

Do not use this skill for:

- raw inbox sorting -> `inbox-triage`;
- week-level thesis and one action -> `weekly-synthesis`;
- vault system health diagnosis -> `vault-health-feedback`;
- upgrading material into stable notes -> `note-promotion`.

## Input Sampling

Default scope: recently created/modified notes or a user-provided set.

Target size: 5-15 primary notes plus a small number of supporting background notes. Do not scan the whole vault by default.

Process:

1. Use `list_notes` or `search_notes` to identify the recent/specified set.
2. Read `document-map` first; use `content/full` only when evidence is needed.
3. Read older notes only to verify a relationship.

## Review Layers

1. **Link candidates**: explicit note-to-note or note-to-project relationships.
2. **Pattern signals**: repeated themes, problems, or methods.
3. **Contradiction signals**: new vs old claims, goal vs method, assumption vs evidence.
4. **Follow-up note suggestions**: synthesis, topic, contradiction, or question notes.

## Output Contract

```text
Reviewed scope: ...
Connection suggestions: A -> B; reason; evidence; write-back suggested?
Pattern findings: ...
Contradiction findings: ...
Follow-up note suggestions: ...
Uncertain items: relationships requiring more evidence
```

Default mode is analysis-only. Write lightweight wikilinks only after explicit user approval, using `obsidian_replace_in_note` and readback verification.

## Exit Criteria

- Every connection suggestion names both endpoints and evidence.
- Patterns and contradictions are not based on keyword overlap alone.
- The whole vault was not scanned.
- Any written link has been read back and verified.

## Gotchas

| Mistake | Consequence | Correction |
|---|---|---|
| Treating shared keywords as real links | Noisy graph | Require conceptual, project, or evidence relationship |
| Turning review into whole-vault graphing | Scope explosion | Start from recent/specified notes |
| Synthesizing too early | Takes over `weekly-synthesis` | Stop at links, patterns, contradictions, follow-ups |
| Writing links immediately | Unauthorized vault edits | Ask first, then verify |

## Minimal Eval Set

Should trigger: find recent-note connections, suggest wikilinks, identify repeated patterns, surface contradictions.

Should not trigger: process inbox, write weekly synthesis, diagnose vault health, expand one idea into a final note.
