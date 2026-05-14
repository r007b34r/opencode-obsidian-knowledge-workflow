---
name: note-promotion
description: >
  Decide whether material from captures, ideas, triage results, or synthesis output
  should become a stable, reusable, linkable Obsidian note. Load when user asks to
  upgrade material into a formal note, decide if a finding is worth preserving,
  or create a linkable knowledge unit. Do NOT use for inbox triage, link discovery,
  weekly synthesis, or vault health diagnosis.
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
  token-budget: "~2400 tokens"
triggers:
  keywords: [promote, upgrade, formal note, preserve, stabilize, create note, 晋升, 正式笔记]
  contexts: ["material ready to become reusable linkable knowledge note"]
  negative: [triage, inbox, sort, links, connections, synthesis, weekly, health]
boundaries:
  owns: [promotion decision, note type selection, integration planning]
  delegates_to:
    connection-review: "new note needs integration links"
    inbox-triage: "material too raw, return to inbox"
  never_absorbs: [inbox routing, relationship analysis, synthesis, health diagnosis]
continuations:
  on_success:
    - skill: connection-review
      condition: "new promoted note needs integration links"
  on_failure:
    - skill: inbox-triage
      condition: "material fails promotion test, return to inbox"
  escalation:
    - target: human
      condition: "promotion decision is ambiguous after scoring"
---

# note-promotion

## Constraints

- NEVER promote every good idea; require stability + reuse + independence
- NEVER treat promotion as polishing; decide whether promotion is warranted FIRST
- NEVER overwrite source voice; preserve strong original phrasing
- NEVER create notes without integration targets (links)
- NEVER write without user confirmation

## Companion Skill

All vault operations follow `obsidian-mcp`. Forbidden: `obsidian_patch_note`, `obsidian_append_to_note`. Verify every write through readback.

## Trigger Boundary

Use when: upgrade material into formal note, decide if finding is worth preserving, turn synthesis output into stable note, create linkable knowledge unit.

Do NOT use for:
- First-pass inbox routing → `inbox-triage`
- Note relationship discovery → `connection-review`
- Week-level meaning extraction → `weekly-synthesis`
- Vault system health diagnosis → `vault-health-feedback`

## Procedure

### Phase 1: Score
Apply promotion test (≥3/5 to promote):

| Criterion | Score | Evidence required |
|-----------|-------|-------------------|
| Stable (not transient fragment) | 0/1 | Has persisted or been referenced again |
| Reusable (future value) | 0/1 | Applicable beyond original context |
| Independent (standalone) | 0/1 | Understandable without source capture |
| Connectable (links exist) | 0/1 | Can link to existing theme/project/question |
| Compression benefit | 0/1 | Clearer or more retrievable than source |

Score < 3 → recommend wait / keep raw / archive
Score ≥ 3 → proceed to Phase 2

### Phase 2: Type Selection

| Type | Use when |
|------|----------|
| reference-note | Stable external knowledge or method |
| idea-note | Personal framing, observation, or judgment |
| project-note | Mainly useful inside active work |
| topic-note | Multiple notes need a conceptual home |
| synthesis-note | Cross-note understanding worth preserving |
| contradiction-note | Important tension deserves explicit framing |
| question-note | The question itself is worth returning to |

### Phase 3: Plan
Define: title, tags, links (integration targets), write strategy (create new or merge into existing).

### Phase 4: Execute (after user confirmation only)
1. `obsidian_write_note overwrite:false` for new notes
2. `obsidian_replace_in_note` for merging into existing
3. Read back and verify frontmatter, content, links

<details>
<summary>Note Template (read when writing)</summary>

```markdown
---
tags: [...]
created: YYYY-MM-DD
type: [reference|idea|project|topic|synthesis|contradiction|question]
source: [original capture path]
---
# Title

## Claim / Idea

## Evidence / Context

## Implications

## Links
```

</details>

## Output Contract

```text
Promotion decision: promote / wait / keep raw / archive
Score: X/5 (with per-criterion evidence)
Target type: ...
Reason: ...
Proposed title: ...
Tags: ...
Integration targets (links): ...
Write-back plan: create new / merge; awaiting confirmation
```

## Gotchas

### Gotcha 1: Promoting every good idea
**What happens:** Agent marks most material as worth promoting
**Why it's wrong:** Creates hollow vault growth; promoted notes without stability become noise
**Correct approach:** Apply scoring strictly; default to "wait" when uncertain

### Gotcha 2: Promotion as polishing
**What happens:** Agent rewrites and beautifies content without deciding if promotion is warranted
**Why it's wrong:** Polishing is not promotion; a well-written fragment is still a fragment
**Correct approach:** Score first, decide promote/wait, THEN format if promoting

### Gotcha 3: Island notes without links
**What happens:** Agent creates a promoted note with no links to existing knowledge
**Why it's wrong:** Unlinked notes are undiscoverable; defeats the purpose of promotion
**Correct approach:** Require at least 2 integration targets before writing

## Validators

- `validators/pre-check.sh`: Confirms source material exists and is readable
- `validators/post-check.sh`: Verifies promoted note has frontmatter, ≥2 links, and correct type tag

## Exit Criteria

- Promotion decision is explicit with score
- Weak material has not been polished into fake clarity
- Integration targets are named (≥2 links)
- If written: note exists, frontmatter correct, content reads back correctly
