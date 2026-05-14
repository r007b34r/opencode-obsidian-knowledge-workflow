# Design Evolution: v1 → v4

## v1 (2026-04 / unpublished)

Single SKILL.md per skill. No evals, no references, no structure beyond the prompt itself.

**Lesson learned**: Skills without trigger boundaries bleed into each other. Agent frequently confused triage with synthesis.

## v2 (2026-05-08)

Added `evals/trigger-cases.md` and `references/` directories. Introduced cross-skill boundary documentation.

**Lesson learned**: Boundaries written in docs but not in the skill itself are ignored by the agent at runtime.

## v3 (2026-05-10)

Production resource packages: SKILL.md + CHANGELOG + evals + references + templates. Added MCP safety constraints from real host failures. Published to GitHub.

**Lesson learned**: 
- "Production-ready" without automation is aspirational, not factual
- Eval coverage of 7 cases per skill is insufficient for reliable triggering
- Host constraints without version annotations become stale traps on upgrade

## v4 (2026-05-14)

Knowledge Activation architecture. Key changes:

1. **AKU 7-component schema**: triggers/boundaries/continuations in frontmatter
2. **Constraints-first layout**: `## Constraints` before all other content (attention decay resistance)
3. **Validators**: deterministic pre/post check scripts per skill
4. **EDD validation**: 25+ eval cases per skill with failure mode scenarios
5. **Progressive Disclosure**: `<details>` blocks + physical file separation for lazy loading
6. **CI automation**: GitHub Actions for structure/API/budget/eval validation
7. **Knowledge Topology**: skills form a navigable graph via continuation paths
8. **Tool-call style procedures**: `obsidian_list_notes path:"Inbox/"` instead of prose descriptions

**Driving insight**: The bottleneck is not prompt quality but knowledge architecture. Skills are not prompts — they are structured, governance-aware, composable knowledge delivery systems operating under Context Window Economy constraints.
