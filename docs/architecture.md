# Knowledge Topology & Architecture

## System Design

This skill suite implements a **Knowledge Activation** architecture based on Atomic Knowledge Units (AKUs). Each skill is a self-contained node in a navigable knowledge graph, with structured continuation paths enabling agent traversal without central orchestration.

## Knowledge Topology

```
                    ┌─────────────────┐
                    │  obsidian-mcp   │ ← safety layer for all vault operations
                    └────────┬────────┘
                             │ (every skill depends on this)
         ┌───────────────────┼───────────────────┐
         │                   │                   │
         ▼                   ▼                   ▼
┌─────────────┐    ┌─────────────────┐    ┌──────────────────────┐
│inbox-triage │    │vault-health-    │    │opencode-context-     │
│             │    │feedback         │    │maintenance           │
└──────┬──────┘    └─────────────────┘    └──────────────────────┘
       │                                         ▲
       │ promote/link-potential                  │ thesis/gaps
       ▼                                         │
┌──────────────────┐                    ┌────────┴────────┐
│connection-review │───patterns-span───▶│weekly-synthesis  │
└──────┬───────────┘    week window     └────────┬────────┘
       │                                         │
       │ follow-up accepted                      │ synthesis ready
       ▼                                         ▼
┌──────────────────────────────────────────────────┐
│                  note-promotion                   │
└──────────────────┬───────────────────────────────┘
                   │
                   │ new note needs links
                   ▼
            connection-review (cycle)
```

**Legend:**
- Solid arrows = `on_success` continuation
- Each node declares its own routing via `continuations:` in frontmatter
- Agent traverses the graph at runtime; no central orchestrator needed

## AKU Schema (v4)

Each skill implements the 7-component Atomic Knowledge Unit:

| Component | Implementation |
|-----------|---------------|
| Intent Declaration | `triggers:` frontmatter (keywords + contexts + negative) |
| Procedural Knowledge | `## Procedure` with tool-call style phases |
| Tool Bindings | `## Companion Skill` + obsidian-mcp tool selection |
| Organizational Metadata | `metadata:` + `compatibility:` frontmatter |
| Governance Constraints | `## Constraints` (placed first for attention priority) |
| Continuation Paths | `continuations:` frontmatter (on_success/on_failure/escalation) |
| Validators | `validators/` directory with pre/post check scripts |

## Design Principles

1. **Context Window Economy**: Every token earns its place. SKILL.md < 500 lines.
2. **Progressive Disclosure**: Heavy references in `references/`; loaded only when needed.
3. **Attention Decay Resistance**: Constraints placed first in every SKILL.md.
4. **Eval-Driven Development**: 25+ trigger cases per skill; >90% accuracy target.
5. **Governance as Code**: Validators enforce constraints deterministically.
6. **Bounded Scope**: No skill scans the whole vault by default.
7. **Evidence Before Mutation**: Read before write; verify by reading back.

## Handoff Data Format

```yaml
handoff:
  source_skill: <name>
  target_skill: <name>
  items:
    - path: "..."
      decision: "..."
      reason: "..."
      uncertainty: low/medium/high
      evidence: "..."
  suggested_next: "..."
```

See [cross-skill-handoff-protocol.md](cross-skill-handoff-protocol.md) for full protocol.
