---
name: inbox-triage
description: >
  Route raw Obsidian inbox captures into keep, promote, project, archive,
  or deep-read decisions. Load when user asks to triage inbox, sort captures,
  process fleeting notes, or decide what to promote/archive.
  Do NOT use for relationship analysis, weekly synthesis, vault health, or note creation.
license: Apache-2.0
compatibility:
  runtime: opencode
  requires: [obsidian-mcp]
  verified-host: "obsidian-mcp-server@3.1.5 / Windows / 2026-05-10"
metadata:
  version: "4.0.0"
  last-reviewed: "2026-05-14"
  owner: r007b34r
  eval-status: edd-validated
  token-budget: "~2800 tokens"
triggers:
  keywords: [triage, inbox, sort, route, captures, fleeting, unprocessed, 清理, 整理]
  contexts: ["obsidian vault with unprocessed inbox items"]
  negative: [relationship, links, synthesis, weekly, health, promote, create note, connections]
boundaries:
  owns: [inbox routing, capture classification, shallow-read decisions]
  delegates_to:
    connection-review: "items needing relationship analysis"
    note-promotion: "items marked promote-to-note"
  never_absorbs: [synthesis, health diagnosis, context maintenance, relationship analysis]
continuations:
  on_success:
    - skill: connection-review
      condition: "promoted items with link potential > 2"
    - skill: note-promotion
      condition: "any item marked promote-to-note and user confirms"
  on_failure:
    - skill: vault-health-feedback
      condition: "inbox path not found or empty"
  escalation:
    - human
      condition: "ambiguous items > 60% of batch"
---

# inbox-triage

## Constraints

- NEVER scan whole vault; scope = `Inbox/` or user-specified path only
- NEVER write back without explicit user confirmation
- NEVER produce synthesis or thesis; output is routing decisions only
- NEVER deep-read all items; deep-read only when routing decision is genuinely uncertain
- MAX 20 items per batch; if more, process in batches and report remainder

## Companion Skill

All vault operations follow `obsidian-mcp`. Forbidden: `obsidian_patch_note`, `obsidian_append_to_note`. Verify every write through readback.

## Trigger Boundary

Use when: triage inbox, sort captures, route raw notes, decide what to promote/archive, process fleeting notes.

Do NOT use for:
- Cross-note relationship analysis → `connection-review`
- Week-level meaning extraction → `weekly-synthesis`
- Stable note creation → `note-promotion`
- Vault health diagnosis → `vault-health-feedback`

## Procedure

### Phase 1: Discover
1. `obsidian_list_notes path:"Inbox/"` → candidate list
2. Count items; if >20, process first 20 and report remainder

### Phase 2: Shallow Read
1. For each candidate: `obsidian_get_note format:"document-map"` → structure
2. Short notes (<500 words): read as `content/full`
3. Flag items where routing decision is uncertain → mark for deep-read

### Phase 3: Classify
Apply decision matrix:

| Decision | Use when |
|----------|----------|
| keep-in-inbox | Too raw, still incubating |
| promote-to-note | Stable, reusable, independent |
| promote-to-idea | Personal observation or framing worth preserving |
| move-to-project | Mainly useful inside active project |
| archive-or-ignore | Low-density, redundant, stale |
| needs-deep-read | Shallow evidence insufficient but potential value high |

Evaluation dimensions: reusability, current relevance, cognitive density, connection potential.

### Phase 4: Report
Output per Output Contract. Wait for user confirmation before any write-back.

<details>
<summary>Edge Cases (expand only when needed)</summary>

- Empty inbox: report empty, suggest checking path configuration
- All items ambiguous: escalate to user, ask for 2-3 example decisions to calibrate
- Mixed languages: classify by content quality, not language
- Items with broken frontmatter: flag but still classify content

</details>

## Output Contract

```text
Batch: total / shallow-read / deep-read / promote / archive / uncertain
---
Path: ...
Decision: ...
Reason: ... (one sentence)
Next action: ...
Write-back needed: yes/no
```

Default mode: analysis-only. Before write-back, list exact intended changes and wait for confirmation.

## Gotchas

### Gotcha 1: Triage becomes mini-synthesis
**What happens:** Agent writes multi-paragraph analysis for each item
**Why it's wrong:** Triage is routing, not content production; wastes tokens and blurs boundary with weekly-synthesis
**Correct approach:** One sentence reason + one decision per item

### Gotcha 2: Over-promotion
**What happens:** Agent marks most items as promote-to-note
**Why it's wrong:** Promotes unstable fragments, creates hollow vault growth
**Correct approach:** Promote only when stable + reusable + independent; default to keep-in-inbox when uncertain

### Gotcha 3: Full-reading everything
**What happens:** Agent reads every note in full before classifying
**Why it's wrong:** Wastes token budget; most routing decisions need only document-map
**Correct approach:** Document-map first; deep-read only genuinely uncertain items

## Validators

- `validators/pre-check.sh`: Confirms inbox path is accessible and not empty
- `validators/post-check.sh`: Verifies output contains no synthesis markers (thesis/contradiction/gap)

## Exit Criteria

- Every candidate has exactly one routing decision or needs-deep-read
- Triage has not turned into synthesis
- Batch size ≤20 respected
- Any write-back has passed obsidian-mcp readback verification
