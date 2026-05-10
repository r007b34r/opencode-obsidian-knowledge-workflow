# OpenCode + Obsidian Knowledge Workflow Skills

Production-oriented skills for turning an Obsidian vault from a passive archive into an active knowledge workflow.

- English documentation first; Chinese section below.
- Runtime skills stay in English for portability.
- Release notes are bilingual: [`docs/release-notes-v3-bilingual.md`](docs/release-notes-v3-bilingual.md).

---

## English

### What this is

This repository contains **7 OpenCode skills** for operating an Obsidian knowledge workflow:

1. safely access the vault through MCP;
2. triage raw captures;
3. review connections between recent notes;
4. synthesize meaning over a time window;
5. maintain context when host reality or vault assumptions drift;
6. diagnose vault workflow health;
7. promote stable material into reusable notes.

The suite is designed around one core idea: **knowledge should come back out of the vault as decisions, links, synthesis, and reusable notes.**

### v3 evolution

v3 upgrades every skill from a single prompt file into a production resource package:

```text
skills/<skill>/
  SKILL.md
  CHANGELOG.md
  evals/trigger-cases.md
  references/examples.md
  references/templates.md
```

This adds:

- trigger / non-trigger / near-miss eval cases;
- good and bad examples;
- reusable output templates;
- changelogs for future maintenance;
- explicit cross-skill boundaries;
- live MCP safety constraints discovered on the verified host.

### Skills

| Skill | Role | Use when |
|---|---|---|
| `obsidian-mcp` | Vault operation safety layer | Any Obsidian read/search/write/tag/edit/verify operation is needed |
| `inbox-triage` | First-pass routing | Raw captures, inbox notes, or fleeting notes need sorting |
| `connection-review` | Relationship analysis | A bounded set of notes needs links, patterns, contradictions, or follow-up opportunities |
| `weekly-synthesis` | Time-window meaning extraction | Recent notes need an emerging thesis, gaps, one action, and one question |
| `opencode-context-maintenance` | Context drift diagnosis | Vault notes, skill docs, config assumptions, or host reality no longer align |
| `vault-health-feedback` | Workflow health diagnosis | The vault may be becoming a passive archive or low-return structure |
| `note-promotion` | Stable note creation gate | Material is ready to become a reusable, linkable knowledge note |

### Workflow shape

```text
Capture
  -> Inbox
  -> inbox-triage
  -> connection-review
  -> weekly-synthesis
  -> note-promotion / opencode-context-maintenance
  -> stable reusable knowledge

vault-health-feedback runs periodically as a diagnostic layer.
obsidian-mcp is the safety layer used whenever vault operations are required.
```

### Principles

- **Evidence before mutation**: read before writing; verify by reading back.
- **Analysis before write-back**: workflow skills report first and mutate only when appropriate.
- **Host reality over ideal APIs**: skills encode the actual OpenCode + MCP behavior observed on this machine.
- **Bounded scope**: no default whole-vault scans.
- **Cross-skill discipline**: triage, review, synthesis, health diagnosis, context maintenance, and promotion do not collapse into one vague workflow.
- **Eval-driven maintenance**: trigger behavior is documented as reviewable cases.
- **Examples over vague rules**: each skill ships with good/bad examples and templates.

### MCP safety constraints

The verified host is OpenCode with `obsidian-mcp-server@3.1.5` on Windows.

Known constraints are intentionally encoded in `obsidian-mcp` and inherited by the companion skills:

- `obsidian_patch_note` is forbidden on this host because it produced schema mismatch failures.
- `obsidian_append_to_note` is forbidden for the same reason.
- `obsidian_get_note format: section` is auxiliary only, never the sole verification path.
- `obsidian_write_note overwrite:true` is forbidden by default.
- `obsidian_delete_note` requires explicit confirmation.

### Installation

Copy the skill directories into your OpenCode skills directory:

```bash
cp -r skills/obsidian-mcp ~/.opencode/skills/
cp -r skills/inbox-triage ~/.opencode/skills/
cp -r skills/connection-review ~/.opencode/skills/
cp -r skills/weekly-synthesis ~/.opencode/skills/
cp -r skills/opencode-context-maintenance ~/.opencode/skills/
cp -r skills/vault-health-feedback ~/.opencode/skills/
cp -r skills/note-promotion ~/.opencode/skills/
```

Restart OpenCode after copying.

### Documentation

| Document | Purpose |
|---|---|
| [`docs/release-notes-v3-bilingual.md`](docs/release-notes-v3-bilingual.md) | v3 bilingual release notes |
| [`docs/production-hardening-update.md`](docs/production-hardening-update.md) | Production hardening details and MCP constraints |
| [`docs/skill-boundary-decisions.md`](docs/skill-boundary-decisions.md) | Responsibility boundaries between skills |
| [`docs/cross-skill-handoff-protocol.md`](docs/cross-skill-handoff-protocol.md) | Handoff protocol between workflow skills |
| [`docs/test-matrix.md`](docs/test-matrix.md) | Pressure tests and failure modes |

### License

Apache-2.0

---

## 中文

### 这是什么

这是给 **OpenCode + Obsidian** 使用的一套 **7 个 knowledge workflow skills**。

目标不是让 Obsidian 继续堆积材料，而是让 vault 持续产出：

1. inbox 初筛；
2. 笔记关系；
3. 时间窗口综合；
4. 上下文漂移修正；
5. vault 健康反馈；
6. 稳定知识晋升；
7. 安全的 MCP vault 操作。

核心目标：**让知识从 vault 中回流为决策、链接、综合和可复用笔记。**

### v3 版本进化

v3 把每个 skill 从单个 `SKILL.md` 升级为生产资源包：

```text
skills/<skill>/
  SKILL.md
  CHANGELOG.md
  evals/trigger-cases.md
  references/examples.md
  references/templates.md
```

这次进化增加了：

- 应触发 / 不应触发 / 近似误触发 eval；
- 正反示例；
- 可复用输出模板；
- changelog 维护入口；
- 明确的跨 skill 边界；
- 基于真实宿主测试得到的 MCP 安全约束。

完整中英文发布说明见：[`docs/release-notes-v3-bilingual.md`](docs/release-notes-v3-bilingual.md)。

### 7 个 skills

| Skill | 角色 | 使用场景 |
|---|---|---|
| `obsidian-mcp` | Vault 操作安全层 | 任何 Obsidian 读、搜、写、标签、编辑、验证操作 |
| `inbox-triage` | 原始材料初筛 | inbox、capture、fleeting notes 需要分流时 |
| `connection-review` | 笔记关系分析 | 小范围笔记需要链接、模式、矛盾、后续机会时 |
| `weekly-synthesis` | 时间窗口综合 | 近期笔记需要 thesis、gap、一个行动、一个问题时 |
| `opencode-context-maintenance` | 上下文漂移诊断 | vault、skill、配置、宿主现实不一致时 |
| `vault-health-feedback` | 知识系统健康反馈 | vault 可能变成被动档案库、低回报结构时 |
| `note-promotion` | 稳定笔记晋升门 | 材料已经值得变成可复用、可链接的知识笔记时 |

### 工作流形态

```text
Capture
  -> Inbox
  -> inbox-triage
  -> connection-review
  -> weekly-synthesis
  -> note-promotion / opencode-context-maintenance
  -> stable reusable knowledge

vault-health-feedback 作为周期性诊断层。
obsidian-mcp 是所有 vault 操作的安全底座。
```

### 遵循原则

- **先证据，后修改**：先读再写，写后读回验证。
- **先分析，后写回**：workflow skills 默认先报告，不盲目修改 vault。
- **宿主现实优先**：以当前 OpenCode + MCP 的真实行为为准，而不是理想 API 假设。
- **范围受控**：默认不全库扫描。
- **职责分离**：triage、review、synthesis、health、context、promotion 不混成一个模糊流程。
- **Eval 驱动维护**：触发行为写成可检查案例。
- **示例优先**：每个 skill 都有正反例和模板，减少歧义。

### MCP 安全约束

当前验证宿主为 Windows 上的 OpenCode + `obsidian-mcp-server@3.1.5`。

这些约束已写入 `obsidian-mcp`，并由其他 workflow skills 继承：

- 禁用 `obsidian_patch_note`：当前宿主出现 schema mismatch。
- 禁用 `obsidian_append_to_note`：同样存在 schema mismatch。
- `obsidian_get_note format: section` 只能辅助使用，不能作为唯一验证路径。
- 默认禁用 `obsidian_write_note overwrite:true`。
- `obsidian_delete_note` 必须获得明确确认。

### 安装

复制 skill 目录到 OpenCode skills 目录：

```bash
cp -r skills/obsidian-mcp ~/.opencode/skills/
cp -r skills/inbox-triage ~/.opencode/skills/
cp -r skills/connection-review ~/.opencode/skills/
cp -r skills/weekly-synthesis ~/.opencode/skills/
cp -r skills/opencode-context-maintenance ~/.opencode/skills/
cp -r skills/vault-health-feedback ~/.opencode/skills/
cp -r skills/note-promotion ~/.opencode/skills/
```

复制后重启 OpenCode。

### 文档

| 文档 | 用途 |
|---|---|
| [`docs/release-notes-v3-bilingual.md`](docs/release-notes-v3-bilingual.md) | v3 中英文发布说明 |
| [`docs/production-hardening-update.md`](docs/production-hardening-update.md) | 生产级加固与 MCP 约束 |
| [`docs/skill-boundary-decisions.md`](docs/skill-boundary-decisions.md) | 各 skill 职责边界 |
| [`docs/cross-skill-handoff-protocol.md`](docs/cross-skill-handoff-protocol.md) | workflow skills 之间的交接协议 |
| [`docs/test-matrix.md`](docs/test-matrix.md) | 压力测试与失败模式 |

### 协议

Apache-2.0
