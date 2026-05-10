---
name: note-promotion
description: Load when a capture, idea, triage result, connection finding, or synthesis result has proven stable enough to become a reusable, independent, linkable Obsidian note. Use to decide whether and how to promote material into reference, idea, project, topic, synthesis, contradiction, or question notes. Do not use for first-pass triage, link discovery, or weekly synthesis itself.
license: MIT
compatibility: opencode; requires obsidian-mcp for vault operations
metadata:
  version: "2.0.0"
  last-reviewed: "2026-05-10"
  owner: local
  eval-status: trigger-evals-defined
---

# note-promotion

## Resource Files

- `evals/trigger-cases.md`: promotion trigger and near-miss cases.
- `references/examples.md`: good/bad promotion decisions for each note type.
- `references/templates.md`: promoted-note skeletons and integration templates.
- `CHANGELOG.md`: real over-promotion, under-promotion, and integration failures.

## Goal

Decide whether material from a raw capture, idea, triage result, connection finding, or synthesis result should be upgraded into a stable, reusable, linkable Obsidian note.

Core principle: **promote selectively. A promoted note must become more stable, reusable, and linkable than the source material.**

## Required Companion Skill

For any vault operation, follow `obsidian-mcp`: do not use `obsidian_patch_note`, do not use `obsidian_append_to_note`, treat `get_note section` as auxiliary only, and verify every write through readback.

## Trigger Boundary

Use this skill when the user asks to upgrade material into a formal note, decide whether a finding is worth preserving, turn synthesis output into a stable note, or create a linkable knowledge unit.

Do not use this skill for:

- first-pass inbox routing -> `inbox-triage`;
- note relationship discovery -> `connection-review`;
- week-level meaning extraction -> `weekly-synthesis`;
- vault system health diagnosis -> `vault-health-feedback`.

## Promotion Test

Promotion requires at least three of the following:

- **Stable**: not just a transient fragment.
- **Reusable**: likely to help future work.
- **Independent**: understandable outside the original capture.
- **Connectable**: can link to an existing theme, project, or question.
- **Compression benefit**: clearer, shorter, or more retrievable than the source.

If the material fails the test, recommend waiting, keeping raw, returning to triage, or archiving.

## Target Note Types

| Type | Use when |
|---|---|
| `reference-note` | Stable external knowledge or method |
| `idea-note` | Personal framing, observation, or judgment |
| `project-note` | Mainly useful inside active work |
| `topic-note` | Multiple notes need a conceptual home |
| `synthesis-note` | Cross-note understanding should be preserved |
| `contradiction-note` | An important tension deserves explicit framing |
| `question-note` | The question itself is worth returning to |

## Output Contract

```text
Promotion decision: promote / wait / keep raw / archive
Target type: ...
Reason: ...
Minimum promotion strategy: preserve / clarify / remove
Proposed title: ...
Tags: ...
Links: ...
Write-back plan: create or merge; wait for confirmation
```

## Write Template

After user approval, a new promoted note should include at least:

```markdown
---
tags:
  - ...
created: YYYY-MM-DD
type: ...
source: ...
---
# Title

## Claim / Idea

## Evidence / Context

## Implications

## Links
```

Create new notes with `obsidian_write_note overwrite:false`. If the target exists, merge with `obsidian_replace_in_note` and read back.

## Exit Criteria

- Promotion decision is explicit.
- Weak material has not been polished into fake clarity.
- Integration targets are named.
- If written, the new/updated note exists, frontmatter is correct, and key content reads back correctly.

## Gotchas

| Mistake | Consequence | Correction |
|---|---|---|
| Promoting every good idea | Hollow vault growth | Require stability, reuse, independence, and links |
| Treating promotion as polishing | No structural knowledge benefit | Decide whether promotion is warranted first |
| Overwriting source voice | Original insight is lost | Preserve strong source phrasing or source links |
| Creating without links | New note becomes an island | Require integration targets |

## Minimal Eval Set

Should trigger: promote a finding into a formal note, create a topic note, preserve a contradiction note, stabilize synthesis output.

Should not trigger: sort inbox, find links, write weekly synthesis, diagnose vault health.
