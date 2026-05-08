# OpenCode + Obsidian Knowledge Workflow Skills

A set of 6 skills that turn OpenCode + Obsidian from a passive archive into a compounding knowledge system.

## What This Is

Most Obsidian vaults fail the same way: content goes in, nothing comes back out. This skill system builds the missing feedback loop — not by promising automated AI magic, but by giving OpenCode a disciplined, layered workflow for processing, connecting, and synthesizing your notes.

## The 6 Skills

| Skill | Role | When It Runs |
|---|---|---|
| `inbox-triage` | Low-friction inbox sorting | When Inbox/ has unprocessed captures |
| `connection-review` | Relationship discovery across recent notes | When notes are accumulating but remain isolated |
| `weekly-synthesis` | Week-level meaning extraction | When you want to know what the week's changes mean together |
| `opencode-context-maintenance` | Context-layer alignment | When context files feel stale or host reality has shifted |
| `vault-health-feedback` | System-wide health diagnosis | When the vault feels archival instead of useful |
| `note-promotion` | Knowledge upgrade to stable form | When material has proven value worth preserving |

## Architecture

```
Capture → Inbox → inbox-triage → connection-review → weekly-synthesis → opencode-context-maintenance → Stable knowledge
                                              ↑                     ↑
                                        note-promotion       vault-health-feedback
                                     (promotion gateway)    (periodic diagnosis)
```

All skills follow the same discipline:
- **Analysis-first** — produce a report and stop for confirmation before any write-back
- **Layered reading** — scope → structure → deep-read only where necessary
- **Host-aware** — respects current OpenCode + obsidian-mcp-server constraints

## Prerequisites

- [OpenCode](https://github.com/anomalyco/opencode) with `oh-my-opencode` plugin
- [obsidian-mcp-server@3.1.5](https://github.com/cyanheads/obsidian-mcp-server) configured as an MCP server
- Obsidian vault with the [Local REST API plugin](https://github.com/coddingtonbear/obsidian-local-rest-api) enabled
- The `obsidian-mcp` skill installed (for safe vault operations)

## Installation

Copy each skill directory into `~/.opencode/skills/`:

```bash
cp -r skills/inbox-triage ~/.opencode/skills/
cp -r skills/connection-review ~/.opencode/skills/
cp -r skills/weekly-synthesis ~/.opencode/skills/
cp -r skills/opencode-context-maintenance ~/.opencode/skills/
cp -r skills/vault-health-feedback ~/.opencode/skills/
cp -r skills/note-promotion ~/.opencode/skills/
```

Restart OpenCode. The skills will load automatically.

## Quick Start

1. Put some raw captures in your `Inbox/`
2. Say: "check my inbox" → triggers `inbox-triage`
3. After triage results: "find connections across recent notes" → triggers `connection-review`
4. At end of week: "synthesize this week" → triggers `weekly-synthesis`
5. Periodically: "check vault health" → triggers `vault-health-feedback`

## Known Constraints

- `obsidian_patch_note` and `obsidian_append_to_note` are not reliably callable due to a host schema translation issue in the current OpenCode version. All skills use `obsidian_replace_in_note` as the surgical editing workaround.
- The system is designed for manually-triggered workflows. It does not provide automated daily briefs or unattended feedback loops.

## Documentation

- `docs/workflow-spec.md` — Full system specification
- `docs/workflow-map.md` — Visual workflow diagram
- `docs/skill-boundary-decisions.md` — Responsibility boundaries between skills
- `docs/cross-skill-handoff-protocol.md` — How skills pass information to each other
- `docs/test-matrix.md` — Pressure test scenarios and failure modes

## License

Apache-2.0
