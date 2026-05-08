# Cross-Skill Handoff Protocol

## Purpose

Standardizes how knowledge-workflow skills pass information between each other.

Core problem: **How does the output of one skill become usable input for the next?**

Without this protocol, each skill runs in isolation, and uncertainty/deferred items get lost in transition.

## Core Principles

1. Upstream provides evidence; downstream interprets
2. Uncertainty must be explicitly passed, never hidden
3. Every handoff point has clear trigger conditions and expected input format
4. Partially confirmed results must be traceable, not mixed with unconfirmed state

## Handoff Points

### 1. inbox-triage → connection-review
- **What passes**: path, triage decision, reason, uncertainty marker, shallow-read evidence
- **What NOT to redo**: do not re-triage; do relationship analysis based on triage results

### 2. connection-review → weekly-synthesis
- **What passes**: link suggestions, pattern findings, contradiction findings, follow-up note suggestions
- **What NOT to redo**: do not redo relationship discovery; extract week-level meaning from review output

### 3. weekly-synthesis → opencode-context-maintenance
- **What passes**: thesis, contradictions, gaps, one-sentence summary
- **What NOT to redo**: do not reinterpret weekly changes; decide what to persist into long-term context

### 4. Multiple upstream → note-promotion
- **What passes**: source skill, item path, why worth promotion, upstream recommended type, position in workflow
- **What NOT to redo**: do not re-judge "worth promotion"; base promotion on upstream evidence

## Minimum Handoff Fields

- Source Skill · Target Skill · Items · Decisions · Evidence · Uncertainty · Suggested Next

## Confirmation in OpenCode

Natural-language confirmation is the default mechanism:
1. Skill outputs analysis report
2. User confirms in natural language
3. Skill executes write-back or stops

Confirmation levels: **Full confirm** | **Partial confirm** | **Defer** | **Reject**

## Tool Constraint

⚠️ Confirmed write-backs must use: `obsidian_write_note`, `obsidian_replace_in_note`, `obsidian_manage_frontmatter`, `obsidian_manage_tags`. `obsidian_patch_note` and `obsidian_append_to_note` are currently unavailable.
