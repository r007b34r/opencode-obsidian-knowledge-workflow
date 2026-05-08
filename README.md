# OpenCode + Obsidian Knowledge Workflow Skills

[English](#english) · [中文](#chinese)

---

## English

A set of **6 production-ready skills** that turn OpenCode + Obsidian from a passive archive into a compounding knowledge system.

Most Obsidian vaults fail the same way: content goes in, nothing comes back out. This skill system builds the missing feedback loop — not by promising automated AI magic, but by giving OpenCode a disciplined, layered workflow for processing, connecting, and synthesizing your notes.

### Skills

| Skill | Role | When It Runs |
|---|---|---|
| `inbox-triage` | Low-friction inbox sorting | When `Inbox/` has unprocessed captures |
| `connection-review` | Relationship discovery across recent notes | When notes accumulate but remain isolated |
| `weekly-synthesis` | Week-level meaning extraction | When you want to understand what the week means |
| `opencode-context-maintenance` | Context-layer alignment | When context files feel stale or host reality has shifted |
| `vault-health-feedback` | System-wide health diagnosis | When the vault feels archival instead of useful |
| `note-promotion` | Knowledge upgrade to stable form | When material has proven value worth preserving |

### Architecture

```
Capture → Inbox → inbox-triage → connection-review → weekly-synthesis → opencode-context-maintenance → Stable knowledge
                          ↑                         ↑
                    note-promotion           vault-health-feedback
                 (promotion gateway)        (periodic diagnosis)
```

All skills follow the same discipline: **analysis-first → user confirmation → write-back**. No blind vault modifications.

### Prerequisites

- [OpenCode](https://github.com/anomalyco/opencode) with `oh-my-opencode` plugin
- [obsidian-mcp-server@3.1.5](https://github.com/cyanheads/obsidian-mcp-server) configured as an MCP server
- Obsidian vault with the [Local REST API plugin](https://github.com/coddingtonbear/obsidian-local-rest-api) enabled
- The `obsidian-mcp` skill installed for safe vault operations

### Installation

```bash
cp -r skills/inbox-triage ~/.opencode/skills/
cp -r skills/connection-review ~/.opencode/skills/
cp -r skills/weekly-synthesis ~/.opencode/skills/
cp -r skills/opencode-context-maintenance ~/.opencode/skills/
cp -r skills/vault-health-feedback ~/.opencode/skills/
cp -r skills/note-promotion ~/.opencode/skills/
```

Restart OpenCode. The skills load automatically.

### Quick Start

1. Drop raw captures in `Inbox/`
2. Say: "check my inbox" → triggers `inbox-triage`
3. After triage: "find connections" → triggers `connection-review`
4. End of week: "synthesize this week" → triggers `weekly-synthesis`
5. Periodically: "check vault health" → triggers `vault-health-feedback`

### Documentation

| Document | Content |
|---|---|
| `docs/workflow-spec.md` | Full system specification |
| `docs/workflow-map.md` | Visual workflow diagram |
| `docs/skill-boundary-decisions.md` | Responsibility boundaries between skills |
| `docs/cross-skill-handoff-protocol.md` | How skills pass information to each other |
| `docs/test-matrix.md` | Pressure test scenarios and failure modes |

### Acknowledgments

This project is built upon and inspired by the work of others:

- **[@cyanheads](https://github.com/cyanheads)** — creator of `obsidian-mcp-server`, the foundational MCP server that makes Obsidian vault operations accessible to OpenCode. This project would not exist without their work.
- **[@anomalyco](https://github.com/anomalyco)** — creators of OpenCode, the AI orchestration platform that hosts this skill system.
- **[@coddingtonbear](https://github.com/coddingtonbear)** — creator of the Obsidian Local REST API plugin, the essential bridge between Obsidian and external clients.
- **[@cyrilXBT](https://x.com/cyrilXBT)** — author of the original article that inspired this system's design philosophy.
- **oh-my-opencode** and **Superpowers** — the skill framework that makes projects like this possible.

### License

Apache-2.0

---

## 中文

一套将 OpenCode + Obsidian 从被动存档变成**知识复利系统**的 **6 个生产级 skills**。

大多数 Obsidian vault 的失败模式都一样：内容进去，再也没有出来。这套技能系统补上了缺失的反馈回路——不是靠承诺自动 AI 魔法，而是给 OpenCode 一套有纪律的分层工作流，用于处理、连接和综合你的笔记。

### 技能列表

| 技能 | 角色 | 触发时机 |
|---|---|---|
| `inbox-triage` | 低摩擦收件箱分拣 | `Inbox/` 有未处理内容时 |
| `connection-review` | 近期笔记关系发现 | 笔记累积但互相孤立时 |
| `weekly-synthesis` | 周级意义提取 | 想知道这周变化意味着什么时 |
| `opencode-context-maintenance` | 上下文层校准 | 上下文文件过时，或宿主现实已变更时 |
| `vault-health-feedback` | 系统健康诊断 | vault 越来越像档案库而不是思考工具时 |
| `note-promotion` | 知识升级为稳定形态 | 内容已证明有长期价值时 |

### 架构

```
Capture → Inbox → inbox-triage → connection-review → weekly-synthesis → opencode-context-maintenance → Stable knowledge
                          ↑                         ↑
                    note-promotion           vault-health-feedback
                 (promotion gateway)        (periodic diagnosis)
```

所有技能遵循统一纪律：**分析优先 → 用户确认 → 写入 vault**。不盲目覆盖现有笔记。

### 运行前提

- [OpenCode](https://github.com/anomalyco/opencode) + `oh-my-opencode` 插件
- [obsidian-mcp-server@3.1.5](https://github.com/cyanheads/obsidian-mcp-server) 已配置为 MCP server
- Obsidian vault 已启用 [Local REST API 插件](https://github.com/coddingtonbear/obsidian-local-rest-api)
- 已安装 `obsidian-mcp` skill 用于安全的 vault 操作

### 安装

```bash
cp -r skills/inbox-triage ~/.opencode/skills/
cp -r skills/connection-review ~/.opencode/skills/
cp -r skills/weekly-synthesis ~/.opencode/skills/
cp -r skills/opencode-context-maintenance ~/.opencode/skills/
cp -r skills/vault-health-feedback ~/.opencode/skills/
cp -r skills/note-promotion ~/.opencode/skills/
```

重启 OpenCode。Skills 会自动加载。

### 快速开始

1. 把原始捕获放进 `Inbox/`
2. 说："帮我看看 inbox" → 触发 `inbox-triage`
3. 分拣完成后："帮我找找联系" → 触发 `connection-review`
4. 周末："做一次本周综合" → 触发 `weekly-synthesis`
5. 定期："检查 vault 健康" → 触发 `vault-health-feedback`

### 文档

| 文档 | 内容 |
|---|---|
| `docs/workflow-spec.md` | 完整系统规范 |
| `docs/workflow-map.md` | 可视化工作流图 |
| `docs/skill-boundary-decisions.md` | 各 skill 的职责边界裁决 |
| `docs/cross-skill-handoff-protocol.md` | 各 skill 之间的信息传递协议 |
| `docs/test-matrix.md` | 压力测试场景与失败模式 |

### 致谢

本项目基于并受惠于以下项目和作者的工作：

- **[@cyanheads](https://github.com/cyanheads)** —— `obsidian-mcp-server` 的创建者，提供了本项目的基础 MCP 服务。没有他们的工作，本项目不可能存在。
- **[@anomalyco](https://github.com/anomalyco)** —— OpenCode 的创建者，提供了托管本技能系统的 AI 编排平台。
- **[@coddingtonbear](https://github.com/coddingtonbear)** —— Obsidian Local REST API 插件的创建者，连接 Obsidian 与外部客户端的核心桥梁。
- **[@cyrilXBT](https://x.com/cyrilXBT)** —— 启发了本系统设计哲学的原始文章作者。
- **oh-my-opencode** 与 **Superpowers** —— 使这类技能系统成为可能的框架。

### 协议

Apache-2.0
