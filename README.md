# OpenCode + Obsidian Knowledge Workflow

7 AI Skills that turn an Obsidian vault from a passive archive into an active knowledge workflow. Built on the Knowledge Activation (AKU) architecture.

[English](#architecture) | [中文](docs/README-zh.md)

## Architecture

```
Capture → inbox-triage → connection-review → weekly-synthesis → note-promotion
                                                                      ↓
vault-health-feedback (periodic)          opencode-context-maintenance (on drift)
obsidian-mcp (safety layer for all vault operations)
```

## Skills

| Skill | Role |
|-------|------|
| `obsidian-mcp` | Vault operation safety layer |
| `inbox-triage` | First-pass routing for raw captures |
| `connection-review` | Relationship analysis for bounded note sets |
| `weekly-synthesis` | Time-window meaning extraction |
| `opencode-context-maintenance` | Context drift diagnosis |
| `vault-health-feedback` | Workflow health diagnosis |
| `note-promotion` | Stable note creation gate |

## v4 Features

- **AKU 7-component schema**: structured triggers, boundaries, continuations, validators
- **Constraints-first layout**: critical rules placed first to resist attention decay
- **Deterministic validators**: pre/post check scripts enforce governance as code
- **EDD-validated**: 25+ eval cases per skill with failure mode scenarios
- **Progressive disclosure**: `<details>` blocks + physical file separation for lazy loading
- **CI automation**: GitHub Actions validate structure, forbidden APIs, token budget, eval coverage
- **Knowledge topology**: skills form a navigable graph via continuation paths

## Install

```bash
cp -r skills/* ~/.opencode/skills/
```

## Verified On

- OpenCode + `obsidian-mcp-server@3.1.5`
- Windows 11
- Last verified: 2026-05-14

## Docs

- [Architecture & Knowledge Topology](docs/architecture.md)
- [Cross-Skill Handoff Protocol](docs/cross-skill-handoff-protocol.md)
- [Design Evolution (v1→v4)](docs/design-evolution.md)
- [Test Matrix](docs/test-matrix.md)

## Validation

```bash
bash scripts/validate-all.sh
```

## License

Apache-2.0
