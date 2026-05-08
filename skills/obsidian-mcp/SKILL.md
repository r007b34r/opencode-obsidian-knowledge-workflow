---
name: obsidian-mcp
description: Obsidian Vault 操作安全层，通过 MCP 工具直接读写 vault。集成 verification-before-completion（强制验证）、karpathy-guidelines（手术式变更）、systematic-debugging（自动错误恢复）。当用户要求 Obsidian vault 的读写、搜索、标签管理、元数据修改、批量编辑等底层操作时使用。知识工作流决策（分拣、连接分析、周综合、上下文校准、系统体检、笔记升级）由专门的 knowledge-workflow skills 负责。
license: MIT
compatibility: opencode
metadata:
  requires: obsidian-mcp-server
  skills: verification-before-completion, karpathy-guidelines, systematic-debugging, brainstorming, writing-plans, git-master, improve-architecture, dispatching-parallel-agents
---

# Obsidian MCP Skill — 通用 Vault 操作指南

通过 `obsidian-mcp-server@3.1.5` 的 14 个 MCP 工具直接读写 vault，即时生效。

> **当前宿主约束（2026-05-08）**：`obsidian_patch_note` 与 `obsidian_append_to_note` 在当前 OpenCode 宿主层存在 discriminated union schema 翻译 bug（-32602），不可靠。**所有手术式编辑改用 `obsidian_replace_in_note`（literal/regex search-replace）**。`obsidian_write_note`、`obsidian_replace_in_note`、`obsidian_get_note`、`obsidian_list_notes`、`obsidian_manage_*` 已验证可用。详见 `Skill Boundary Decisions.md` #9。

## 核心规则（必须严格遵守）

### 铁律

```
NO OBSIDIAN WRITE WITHOUT FRESH READ CONFIRMATION FIRST
NO COMPLETION CLAIMS WITHOUT VERIFICATION EVIDENCE
EVERY CHANGED LINE MUST TRACE TO THE USER'S REQUEST
```

### 1. Always Read First
任何修改**前必须**调 `obsidian_get_note`（优先 `format: "document-map"`）了解当前的 headings、blocks 和 frontmatter。盲写是违规。

### 2. Surgical / Minimal Change（Karpathy 联动）
- 优先 `obsidian_replace_in_note`（手术式 search-replace，已验证可靠）、`obsidian_manage_*`
- 只在新建笔记时用 `obsidian_write_note`
- ⚠️ `obsidian_patch_note` 和 `obsidian_append_to_note` **暂不可用**（宿主 schema 翻译 bug），用 `replace_in_note` 替代
- **不准顺手改相邻 section**——每处变更必须直接追溯到用户需求
- 不准重构笔记结构除非用户明确要求
- 发现不相关的死链或过时内容 → 提出但不删

### 3. Path 安全
使用 vault 相对路径（如 `"Folder/note.md"`）。尊重环境变量 `OBSIDIAN_READ_PATHS` / `WRITE_PATHS` / `READ_ONLY`。遇到 `path_forbidden` 时自动运行错误恢复流程（见下方）。

### 4. Error Recovery（Systematic Debugging 联动）
遇到错误时不抛给用户，走 4 阶段自动化恢复：

| 错误 | Phase 1: 证据 | Phase 2: 模式 | Phase 3: 假设 | Phase 4: 措施 |
|------|-------------|-------------|-------------|-------------|
| `path_forbidden` | 检查 `activeScope` | `list_notes` 探测可用路径 | 提出替代路径 | 用替代路径重试 |
| `note_missing` | 确认请求的路径 | `search_notes` 模糊匹配 | 列出候选笔记 | 让用户确认后继续 |
| `file_exists` | 读已有笔记 document-map | — | — | 建议用 `replace_in_note` 替代 `write` |
| 3 次以上同类失败 | 回顾之前尝试 | 检查 vault 结构规律 | **质疑路径策略** | 和用户讨论重构方案 |

### 5. Verification Gate（verification-before-completion 联动）

```
每次写入操作后，强制执行：
1. get_note → 读取刚写入的内容
2. 对比预期 vs 实际
3. 不一致 → 修正
4. 一致 → 才能声称"已完成"
```

**不准说**"应该写好了"、"看起来成功了"、"应该是更新了"——这些等于撒谎。

分批操作：每完成 N=5 个写入，抽查 1 个确认模式正确后再继续。

### 6. 目标验证（Karpathy Goal-Driven 联动）
每个操作前定义可验证的成功标准：

```
操作: "给关于 TypeScript 的笔记加 #typescript 标签"
验证: search_notes mode=text query="typescript" tag=typescript
      → 结果数量 = 预期数量，每篇都有 #typescript 标签
```

### 7. 破坏性操作
- `obsidian_delete_note` 需用户确认
- 批量删除必须走 brainstorming（设计先行），列出受影响笔记和断链

---

## 工具优先级

### 探索与读取
| 工具 | 用途 | 何时用 |
|------|------|--------|
| `obsidian_list_notes` | 结构浏览 + 树状视图 | depth: 2-4，了解 vault 布局 |
| `obsidian_get_note` | 读笔记 | `document-map` (编辑前)，`full` (需要内容)，`section` (定向读取) |
| `obsidian_search_notes` | 全文/标签/DQL 搜索 | 限 100 条，text 模式支持 pathPrefix |
| `obsidian_list_tags` | 全局标签统计 | 标签模糊时可以看有哪些 |

### 元数据
| 工具 | 用途 |
|------|------|
| `obsidian_manage_frontmatter` | 原子 get/set/delete 单个 frontmatter 字段 |
| `obsidian_manage_tags` | 添加/移除标签，自动同步 frontmatter `tags:` 和 inline `#tag` |

### 写入与编辑（优先级从高到低）
| 优先级 | 工具 | 适用场景 |
|--------|------|----------|
| 🥇 | `obsidian_replace_in_note` | **首选手术式编辑**——全笔记 literal/regex search-replace（已验证可靠，替代 patch/append） |
| 🥈 | `obsidian_manage_frontmatter` / `manage_tags` | 元数据修改 |
| 3 | `obsidian_write_note` | **仅新建**——默认不覆盖已有文件 |
| ⛔ | `obsidian_patch_note` | **暂不可用**（宿主 schema bug），改用 `replace_in_note` |
| ⛔ | `obsidian_append_to_note` | **暂不可用**（宿主 schema bug），改用 `replace_in_note` |
| — | `obsidian_open_in_ui` | 操作后打开 Obsidian 查看效果 |

---

## 操作规模分级 + 技能联动

### 小型（1-3 篇笔记）
直接执行，遵守核心规则。

```
流程: read → plan (脑内) → surgical change → verify
```

### 中型（4-10 篇，或跨多个 section）
走 `verification-before-completion` + 分批验证。

```
流程: read all → plan → execute batch of 5 → verify 1 sample → continue → final verify
```

### 大型（10+ 篇，或涉及 vault 结构变更）
触发 **Gate 1: Brainstorming** → **Gate 2: Writing-Plans** → 执行 → 验证。

```
Gate 1 (brainstorming):
  1. list_notes depth:3-4 → 探索 vault 结构
  2. 提问: 目标结构？受影响笔记？链接保持？MOC 设计？
  3. 提出 2-3 种方案
  4. 用户批准

Gate 2 (writing-plans):
  5. 生成 bite-size 步骤列表（每步 2-5 分钟，含路径、验证命令）
  6. 用户审阅

Execution:
  7. 按计划执行，每步后 verify
  8. 批量操作时用 dispatching-parallel-agents 并行独立笔记

Final:
  9. 全局 verification: 抽查 20% 的变动笔记
  10. git commit（如果有 git）
```

### 并行化（dispatching-parallel-agents 联动）
识别可并行操作并派发：
- ✅ 多个独立笔记加相同标签 → 分组并行
- ✅ 同时搜索多个模式 → 并行 search
- ✅ 读取多篇不相关笔记做合成 → 并行 get_note
- ❌ 同一篇笔记的不同 section → 串行（避免冲突）

---

## Git 版本控制（git-master 联动）

如果 vault 是 git 仓库：
```
操作前:  git commit -am "backup: before [操作描述]"
操作后:  git commit -am "obsidian: [做了什么] (N notes affected)"
验证后:  git diff HEAD~1 --stat → 确认变更范围
```

如果 vault 不是 git 仓库，首次建议用户 `git init`。

---

## Vault 结构健康检查（improve-architecture 联动）

定期运行或用户要求时，检查结构层问题：

```
1. 孤儿检测: search_notes → 没有被其他笔记链接的笔记 → 建议补充或归档
2. 标签碎片化: list_tags → #ts / #typescript / #TypeScript → 建议统一
3. 浅笔记: 内容几乎只有 wikilink 的笔记 → 建议合并到目标笔记
4. MOC 建议: 某个文件夹下笔记 > 15 篇且无索引 → 建议创建 MOC
```

> 以上仅覆盖文件/结构层健康。如需诊断工作流健康、认知健康（系统是否还在产生知识复利，还是已退化为档案库），使用 `vault-health-feedback` skill。

---

## 安全与最佳实践

- 修改后用 `get_note` 或 `open_in_ui` **验证**（不是建议，是必须）
- 永远不要盲目全覆盖已有笔记——用 `replace_in_note`，不是 `write_note`
- 保持笔记原子性和链接一致性
- 如果启用路径限制，严格按错误提示自纠
- 批量操作前先用 `list_notes` / `search_notes` 划范围
- 单次工具调用聚焦一个明确目标

---

## 触发规则

当用户请求 **vault 底层操作**（读写、搜索、标签管理、元数据修改、批量编辑）时加载此 skill。

知识工作流决策（分拣、连接分析、周综合、上下文校准、系统体检、笔记升级）由以下 skills 各自负责：
`inbox-triage` · `connection-review` · `weekly-synthesis` · `opencode-context-maintenance` · `vault-health-feedback` · `note-promotion`

本 skill 的执行纪律：
1. **先判规模**：小/中/大？
2. **中/大型触发对应 Gate**
3. **执行**：surgical change + verify
4. **完成**：verification evidence → git commit → report

**不准跳过任何 Gate。**
