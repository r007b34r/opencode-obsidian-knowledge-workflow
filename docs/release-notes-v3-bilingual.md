# v3 Skill Suite Evolution Release Notes / v3 Skill 套件进化版本说明

## English

### Summary

This release turns the seven OpenCode + Obsidian knowledge workflow skills from strong single-file prompts into a maintainable production skill suite.

The prior version focused on hardening the main `SKILL.md` files and encoding live MCP host constraints. The v3 evolution adds an operational layer around every skill: trigger evals, near-miss boundaries, good/bad examples, reusable templates, and changelogs. The result is not just a set of instructions, but a system that can be reviewed, tested, corrected, and improved over time.

### What changed

Every skill now ships with the same production resource structure:

- `SKILL.md` — concise operating contract, trigger boundary, workflow, output contract, and gotchas.
- `evals/trigger-cases.md` — should-trigger, should-not-trigger, near-miss, and pass-criteria checks.
- `references/examples.md` — concrete good/bad examples to reduce vague or over-generalized behavior.
- `references/templates.md` — reusable output skeletons for consistent execution.
- `CHANGELOG.md` — maintenance log for real trigger misses, false positives, MCP failures, and boundary changes.

The seven evolved skills are:

- `obsidian-mcp`
- `inbox-triage`
- `connection-review`
- `weekly-synthesis`
- `opencode-context-maintenance`
- `vault-health-feedback`
- `note-promotion`

### Principles followed

1. **Evidence before mutation** — vault writes require fresh reads and readback verification.
2. **Host reality over ideal API docs** — the skills encode live OpenCode + `obsidian-mcp-server@3.1.5` behavior, including known-broken operations.
3. **Bounded workflow roles** — each skill has a narrow job and explicit handoff boundaries.
4. **Eval-driven maintenance** — trigger behavior is documented as testable cases, not left to intuition.
5. **Examples over abstractions** — each skill includes good and bad examples so future agents can copy the right behavior.
6. **No passive archive drift** — the whole suite is designed to keep Obsidian producing decisions, links, synthesis, and reusable notes.
7. **Reversible, auditable evolution** — changelogs and resource files make future behavior changes reviewable.

### Special advantages

- **Live MCP safety baked in**: `obsidian_patch_note` and `obsidian_append_to_note` remain forbidden because this host produced schema mismatch failures. The suite routes edits through safer alternatives.
- **Cross-skill boundary discipline**: triage does not synthesize; synthesis does not promote by default; connection review does not scan the whole vault; health feedback diagnoses before restructuring.
- **Near-miss protection**: each skill documents prompts that look close but should route elsewhere.
- **Production-grade maintenance surface**: future failures can be logged into `CHANGELOG.md` and converted into eval cases.
- **Consistent resource shape**: all seven skills use the same file layout, making audits and updates predictable.
- **Bilingual release communication**: runtime skills remain English for portability, while release communication supports both English and Chinese users.

### Validation

The active suite was validated with `skills-ref validate` for all seven skills. The synchronized directories contain 7 skills and 35 Markdown files:

- local runtime: `C:\Users\Ax\.opencode\skills`
- OpenCode config mirror: `C:\Users\Ax\.config\opencode\skills`
- repository copy: `skills/`

### Remaining path to 95+

The suite is now production-structured. The next quality jump should come from executable eval automation, a larger adversarial prompt corpus, and real failure-log driven maintenance rather than simply adding more prose to `SKILL.md`.

---

## 中文

### 总结

这个版本把 7 个 OpenCode + Obsidian knowledge workflow skills 从“强单文件提示词”升级为“可维护的生产级 skill 套件”。

上一版重点是强化主 `SKILL.md`，并写入真实 MCP 主机约束。v3 版本则为每个 skill 增加完整的运行维护层：触发 eval、近似误触发边界、正反示例、可复用模板、变更日志。结果不再只是说明文档，而是一套可以复评、测试、纠偏、长期进化的 workflow 系统。

### 改进了什么

每个 skill 现在都有统一的生产资源结构：

- `SKILL.md`：精简运行契约、触发边界、工作流、输出契约、常见陷阱。
- `evals/trigger-cases.md`：应该触发、不应触发、近似误触发、通过标准。
- `references/examples.md`：正反例，减少含糊判断与过度泛化。
- `references/templates.md`：可复用输出骨架，保证执行一致性。
- `CHANGELOG.md`：记录真实误触发、漏触发、MCP 失败、边界调整。

本次进化覆盖全部 7 个 skills：

- `obsidian-mcp`
- `inbox-triage`
- `connection-review`
- `weekly-synthesis`
- `opencode-context-maintenance`
- `vault-health-feedback`
- `note-promotion`

### 遵从了什么原则

1. **先证据，后修改**：任何 vault 写入都必须先读，再写后读回验证。
2. **主机现实优先于理想 API 文档**：skills 明确编码当前 OpenCode + `obsidian-mcp-server@3.1.5` 的真实行为，包括已知不可用操作。
3. **职责边界清晰**：每个 skill 只做窄职责，并明确什么时候交给其他 skill。
4. **Eval 驱动维护**：触发行为被写成可检查案例，而不是靠直觉判断。
5. **用示例降低歧义**：每个 skill 都有 good/bad examples，让后续 agent 更容易复制正确行为。
6. **防止 Obsidian 变成被动档案馆**：整个套件围绕 triage、连接、综合、健康反馈、晋升，持续让知识回流到决策中。
7. **可审计、可回滚、可进化**：通过 changelog 和资源文件，让未来行为调整可以被复盘。

### 特殊优势

- **内置真实 MCP 安全边界**：由于当前宿主出现 schema mismatch，`obsidian_patch_note` 和 `obsidian_append_to_note` 继续被禁止，改用更安全的替代路径。
- **跨 skill 边界纪律强**：triage 不做 synthesis；synthesis 默认不直接 promotion；connection-review 不默认全库扫描；vault-health-feedback 先诊断再重构。
- **近似误触发防护**：每个 skill 都记录“看起来像但不该触发”的场景，降低误路由。
- **生产维护入口完整**：后续真实失败可以写入 `CHANGELOG.md`，再转成 eval cases。
- **统一资源结构**：7 个 skills 文件形态完全一致，后续审计、同步、升级更容易。
- **中英文同步说明**：运行时 skill 保持英文，便于复用；发布说明提供中英文，便于本地维护和复盘。

### 验证状态

7 个 skills 均已通过 `skills-ref validate`。三处同步目录均为 7 个 skills、35 个 Markdown 文件：

- 本机运行时：`C:\Users\Ax\.opencode\skills`
- OpenCode 配置镜像：`C:\Users\Ax\.config\opencode\skills`
- GitHub 仓库副本：`skills/`

### 继续逼近满分的方向

当前已经具备生产级结构。下一阶段提升不应该继续堆 `SKILL.md` 正文，而应该建设自动化 eval runner、更大的 adversarial prompt corpus，以及由真实 failure log 驱动的长期维护机制。
