# OpenCode + Obsidian Knowledge Workflow Skills

[English](#english) · [中文](#chinese) · [日本語](#japanese)

---

## English

A set of 6 skills that turn OpenCode + Obsidian from a passive archive into a compounding knowledge system.

Most Obsidian vaults fail the same way: content goes in, nothing comes back out. This skill system builds the missing feedback loop — not by promising automated AI magic, but by giving OpenCode a disciplined, layered workflow for processing, connecting, and synthesizing your notes.

### The 6 Skills

| Skill | Role | When It Runs |
|---|---|---|
| ` + "`inbox-triage`" + ` | Low-friction inbox sorting | When Inbox/ has unprocessed captures |
| ` + "`connection-review`" + ` | Relationship discovery across recent notes | When notes accumulate but remain isolated |
| ` + "`weekly-synthesis`" + ` | Week-level meaning extraction | When you want to understand what the week means |
| ` + "`opencode-context-maintenance`" + ` | Context-layer alignment | When context files feel stale |
| ` + "`vault-health-feedback`" + ` | System-wide health diagnosis | When the vault feels archival |
| ` + "`note-promotion`" + ` | Knowledge upgrade to stable form | When material has proven value |

### Architecture

` + "```" + `
Capture → Inbox → inbox-triage → connection-review → weekly-synthesis → opencode-context-maintenance → Stable knowledge
                          ↑                         ↑
                    note-promotion           vault-health-feedback
                 (promotion gateway)        (periodic diagnosis)
` + "```" + `

All skills follow: **analysis-first → confirm → write-back**. No blind vault modifications.

### Prerequisites

- [OpenCode](https://github.com/anomalyco/opencode) with ` + "`oh-my-opencode`" + ` plugin
- [obsidian-mcp-server@3.1.5](https://github.com/cyanheads/obsidian-mcp-server) configured as an MCP server
- Obsidian vault with [Local REST API plugin](https://github.com/coddingtonbear/obsidian-local-rest-api) enabled

### Installation

` + "```bash" + `
cp -r skills/inbox-triage ~/.opencode/skills/
cp -r skills/connection-review ~/.opencode/skills/
cp -r skills/weekly-synthesis ~/.opencode/skills/
cp -r skills/opencode-context-maintenance ~/.opencode/skills/
cp -r skills/vault-health-feedback ~/.opencode/skills/
cp -r skills/note-promotion ~/.opencode/skills/
` + "```" + `

Restart OpenCode. The skills load automatically.

### Quick Start

1. Drop raw captures in ` + "`Inbox/`" + `
2. Say: "check my inbox" → triggers ` + "`inbox-triage`" + `
3. After triage: "find connections" → triggers ` + "`connection-review`" + `
4. End of week: "synthesize this week" → triggers ` + "`weekly-synthesis`" + `
5. Periodically: "check vault health" → triggers ` + "`vault-health-feedback`" + `

### Documentation

- ` + "`docs/workflow-spec.md`" + ` — Full system specification
- ` + "`docs/workflow-map.md`" + ` — Visual workflow diagram
- ` + "`docs/skill-boundary-decisions.md`" + ` — Responsibility boundaries
- ` + "`docs/cross-skill-handoff-protocol.md`" + ` — Information flow between skills
- ` + "`docs/test-matrix.md`" + ` — Pressure test scenarios

### Acknowledgments

- **[@cyanheads](https://github.com/cyanheads)** for ` + "`obsidian-mcp-server`" + ` — the MCP server that makes Obsidian vault operations accessible to OpenCode
- **[@anomalyco](https://github.com/anomalyco)** for OpenCode — the AI orchestration platform that hosts this skill system
- **[@coddingtonbear](https://github.com/coddingtonbear)** for Obsidian Local REST API — the plugin that bridges Obsidian to external clients
- **[@cyrilXBT](https://x.com/cyrilXBT)** for the original article "How to Build an Obsidian Knowledge Vault That Gets Smarter Every Day Without You Doing Anything" that inspired this system
- **oh-my-opencode** and **Superpowers** for the skill framework that makes this project possible

### License

Apache-2.0

---

## 中文

一套将 OpenCode + Obsidian 从被动存档变成知识复利系统的 6 个 skills。

### 六个技能

| 技能 | 角色 | 触发时机 |
|---|---|---|
| ` + "`inbox-triage`" + ` | 低摩擦收件箱分拣 | Inbox/ 有未处理内容时 |
| ` + "`connection-review`" + ` | 近期笔记关系发现 | 笔记累积但互相孤立时 |
| ` + "`weekly-synthesis`" + ` | 周级意义提取 | 想知道这周变化意味着什么时 |
| ` + "`opencode-context-maintenance`" + ` | 上下文层校准 | 上下文文件过时时 |
| ` + "`vault-health-feedback`" + ` | 系统健康诊断 | vault 越来越像档案库时 |
| ` + "`note-promotion`" + ` | 知识升级为稳定形态 | 内容已证明有价值时 |

### 架构

` + "```" + `
Capture → Inbox → inbox-triage → connection-review → weekly-synthesis → opencode-context-maintenance → Stable knowledge
                          ↑                         ↑
                    note-promotion           vault-health-feedback
                 (promotion gateway)        (periodic diagnosis)
` + "```" + `

所有 skills 遵循：**分析优先 → 用户确认 → 写入 vault**。

### 依赖

- [OpenCode](https://github.com/anomalyco/opencode) + ` + "`oh-my-opencode`" + `
- [obsidian-mcp-server@3.1.5](https://github.com/cyanheads/obsidian-mcp-server)
- Obsidian vault + [Local REST API 插件](https://github.com/coddingtonbear/obsidian-local-rest-api)

### 致谢

本项目受以下项目和作者的启发或直接依赖：

- **[@cyanheads](https://github.com/cyanheads)** — ` + "`obsidian-mcp-server`" + `，本项目的基础 MCP 服务
- **[@anomalyco](https://github.com/anomalyco)** — OpenCode，本技能系统的宿主平台
- **[@coddingtonbear](https://github.com/coddingtonbear)** — Obsidian Local REST API，连接 Obsidian 与外部客户端的核心插件
- **[@cyrilXBT](https://x.com/cyrilXBT)** — 启发了本系统的原始长文《更聪明的 Obsidian 知识库：让知识库每天自动增值》
- **oh-my-opencode** 与 **Superpowers** — 使技能系统成为可能的框架

---

## 日本語

OpenCode + Obsidian を受動的なアーカイブから複利で成長する知識システムへ変える 6 つのスキル。

| スキル | 役割 |
|---|---|
| ` + "`inbox-triage`" + ` | 低摩擦の受信トレイ仕分け |
| ` + "`connection-review`" + ` | 最近のノート間の関係発見 |
| ` + "`weekly-synthesis`" + ` | 週次での意味抽出 |
| ` + "`opencode-context-maintenance`" + ` | コンテキスト層の整合性チェック |
| ` + "`vault-health-feedback`" + ` | システム全体の健全性診断 |
| ` + "`note-promotion`" + ` | 価値ある素材を安定した知識ユニットへ |

詳細は [English](#english) または [中文](#chinese) を参照してください。

### 謝辞

- **[@cyanheads](https://github.com/cyanheads)** — ` + "`obsidian-mcp-server`" + `
- **[@anomalyco](https://github.com/anomalyco)** — OpenCode
- **[@coddingtonbear](https://github.com/coddingtonbear)** — Obsidian Local REST API
- **[@cyrilXBT](https://x.com/cyrilXBT)** — 着想の元となった記事
- **oh-my-opencode** / **Superpowers** — スキルフレームワーク
