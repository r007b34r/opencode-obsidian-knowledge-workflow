# OpenCode + Obsidian Knowledge Workflow Skills

<details open>
<summary><b>English</b> — Click to collapse</summary>

A set of **7 production-ready skills** that turn OpenCode + Obsidian from a passive archive into a compounding knowledge system.

Most Obsidian vaults fail the same way: content goes in, nothing comes back out. This skill system builds the missing feedback loop — not by promising automated AI magic, but by giving OpenCode a disciplined, layered workflow for processing, connecting, and synthesizing your notes.

### Skills

| Skill | Role | When It Runs |
|---|---|---|
| `obsidian-mcp` | Vault operation safety layer | Always (required by all other skills) |
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

### Design Philosophy & Lessons Learned

This system was not designed in isolation — it was built through real, iterative debugging against a live OpenCode + Obsidian environment. Every design decision was stress-tested against actual tool failures and platform constraints.

#### Pitfalls We Hit (So You Won't Have To)

**1. `@latest` is a trap.** The `obsidian-mcp-server@latest` tag pulled an incompatible version that broke every tool with `-32602` schema errors. The fix was to pin to `obsidian-mcp-server@3.1.5`. Every skill in this system now documents version pinning as a hard requirement.

**2. The host schema translation bug.** OpenCode's MCP client layer incorrectly translates discriminated-union parameter schemas when a tool has two or more nested-object parameters. This makes `obsidian_patch_note` and `obsidian_append_to_note` completely unusable. All six skills now use `obsidian_replace_in_note` as the sole surgical-editing workaround.

**3. Claude-centric assumptions don't survive OpenCode reality.** The original inspiration article assumed a single AI host that "reads your vault and gets smarter over time." OpenCode is a multi-skill, multi-agent orchestration platform — context is distributed across skills, agents, MCP tools, and session state, not concentrated in one file.

**4. The tool surface is not the design surface.** `obsidian_get_note format:"full"` returns the entire note body — there is no native partial-read capability. The layered-reading strategy (shallow → deep) works by approximating shallow reads through `format:"document-map"` + `list_notes` metadata. The system was redesigned around this constraint rather than pretending it didn't exist.

#### Core Insights

**Host-reality-first design.** Every skill was derived from what the platform actually supports — not from an idealized knowledge-management architecture. If a tool failed, the skill was redesigned around the working alternative. If an article assumed capabilities the platform didn't have, those assumptions were removed.

**Separate analysis from write-back.** This is the single most important design decision in the entire system. Every skill produces a reviewable report first and stops for human confirmation before any vault modification. This eliminates blind writes, controls risk, and preserves reasoning transparency.

**Layered reading saves 50–70% token cost.** By reading metadata → structure → full body in stages, the system avoids burning context budget on low-value material. Only items that genuinely need deep attention ever get full reads.

**Confirmation gates prevent skill overreach.** Without confirmation stops, `inbox-triage` becomes mini-synthesis, `connection-review` becomes full-vault search, and `note-promotion` promotes everything. The confirmation gate is what keeps each skill inside its responsibility radius.

#### How the Chain Saves Tokens While Maintaining Accuracy

The six skills form an execution chain where each stage narrows the focus and increases the signal-to-noise ratio:

```
Raw Inbox (high volume, low signal)
    → inbox-triage: shallow-filter, keep only promising items    [~70% token reduction]
    → connection-review: structure-read first, deep-read minority [~50% token reduction]
    → weekly-synthesis: recent-first, old-notes-as-calibration  [~60% token reduction]
    → opencode-context-maintenance: entry-point-only inspection  [~80% token reduction]
```

At each stage, information that doesn't affect decisions is discarded. The system never "reads everything just in case." This is the opposite of the common AI pattern of front-loading full context — it is a conscious design choice to treat token budget as a first-class resource.

### Prerequisites

- [OpenCode](https://github.com/anomalyco/opencode) with `oh-my-opencode` plugin
- [obsidian-mcp-server@3.1.5](https://github.com/cyanheads/obsidian-mcp-server) configured as an MCP server
- Obsidian vault with the [Local REST API plugin](https://github.com/coddingtonbear/obsidian-local-rest-api) enabled
- The `obsidian-mcp` skill installed for safe vault operations

### Installation

```bash
cp -r skills/obsidian-mcp ~/.opencode/skills/
cp -r skills/obsidian-mcp ~/.opencode/skills/
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

</details>

<details>
<summary><b>中文</b> — 点击展开</summary>

一套将 OpenCode + Obsidian 从被动存档变成**知识复利系统**的 **7 个生产级 skills**。

大多数 Obsidian vault 的失败模式都一样：内容进去，再也没有出来。这套技能系统补上了缺失的反馈回路——不是靠承诺自动 AI 魔法，而是给 OpenCode 一套有纪律的分层工作流，用于处理、连接和综合你的笔记。

### 技能列表

| 技能 | 角色 | 触发时机 |
|---|---|---|
| `obsidian-mcp` | Vault 操作安全层 | 始终（所有 skill 的底层依赖） |
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

### 设计哲学与踩坑实录

这个系统不是凭空设计的——它是在真实的 OpenCode + Obsidian 环境中，通过反复调试和实测打磨出来的。每一个设计决策都经过了真实工具故障和平台约束的压力验证。

#### 我们踩过的坑

**1. `@latest` 是陷阱。** `obsidian-mcp-server@latest` 拉下来的版本和 OpenCode 宿主不兼容，所有 `patch_note`/`append_to_note` 调用全部报 `-32602` schema 错误。修复方法是锁定到 `obsidian-mcp-server@3.1.5`。现在所有 6 个 skill 都内置了版本锁定作为硬约束。

**2. 宿主 schema 翻译 bug。** OpenCode 的 MCP 客户端层在翻译 discriminated-union 参数 schema 时出错——当一个工具有两个以上嵌套对象参数时，宿主会把嵌套 schema 扁平化然后用错误的结构去校验。这导致 `obsidian_patch_note` 和 `obsidian_append_to_note` 完全不可用。六个 skill 全部改用 `obsidian_replace_in_note` 作为唯一的手术式编辑方案。

**3. Claude 中心主义的假设在 OpenCode 现实中站不住。** 启发本项目的原始文章假设了一个"单一 AI 宿主长期读你的 vault 并越来越懂你"的模型。但 OpenCode 是一个多 skill、多 agent 的编排平台——上下文分布在 skills、agents、MCP 工具和 session 状态里，而不是集中在单一模型或者单一文件中。

**4. 工具表面不等于设计表面。** `obsidian_get_note format:"full"` 返回的是笔记全文——没有原生的"只读前 N 行"能力。分层读取策略（浅读 → 深读）是通过 `format:"document-map"` + `list_notes` 元数据来近似实现的。系统围绕这个约束重新设计，而不是假装它不存在。

#### 核心思想

**宿主现实优先的设计原则。** 每个 skill 都是从平台真实支持的能力倒推出来的——不是从理想化的知识管理架构出发。哪个工具实际不可用，skill 就围绕可用的替代方案重新设计。哪篇文章假设了平台不具备的能力，那些假设就被移除。

**把分析从写回中分离。** 这是整个系统最重要的一个设计决策。每个 skill 先产出一份可审阅的报告，在用户确认之前**不执行任何 vault 修改**。这消除了盲目写入、控制了风险、保留了推理过程的透明性。

**分层读取节省 50–70% 的 token 成本。** 通过分阶段读取（元数据 → 结构 → 全文），系统避免把上下文预算烧在低价值内容上。只有真正需要深度关注的条目才会被全文读取。

**确认门防止 skill 越权。** 没有确认停顿，`inbox-triage` 会退化成小型 synthesis，`connection-review` 会变全仓库扫描，`note-promotion` 会把所有东西都升级。确认门让每个 skill 守在自己的职责半径内。

#### 执行链如何节省 token 并保持准确率

六个 skill 形成了一条逐级聚焦、signal-to-noise 逐级提升的执行链：

```
原始 Inbox（大体积，低信号）
    → inbox-triage: 浅读筛选，只保留有潜力的条目      [~70% token 削减]
    → connection-review: 先读结构，少数深读               [~50% token 削减]
    → weekly-synthesis: 近期优先，旧笔记仅作校准参考       [~60% token 削减]
    → opencode-context-maintenance: 只检查上下文入口      [~80% token 削减]
```

每一级都丢弃不影响决策的信息。系统从不"以防万一先全读了再说"。这是对"全量预加载上下文"这一常见 AI 模式的有意识反抗——token 预算被当作一级资源来对待，而不是免费消耗品。

### 运行前提

- [OpenCode](https://github.com/anomalyco/opencode) + `oh-my-opencode` 插件
- [obsidian-mcp-server@3.1.5](https://github.com/cyanheads/obsidian-mcp-server) 已配置为 MCP server
- Obsidian vault 已启用 [Local REST API 插件](https://github.com/coddingtonbear/obsidian-local-rest-api)
- 已安装 `obsidian-mcp` skill（本项目 `skills/` 目录中包含）

### 安装

```bash
cp -r skills/obsidian-mcp ~/.opencode/skills/
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

</details>


