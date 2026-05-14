# OpenCode + Obsidian 知识工作流 Skills

## 这是什么

7 个 AI Skills，把 Obsidian vault 从被动档案变成主动知识工作流。基于 Knowledge Activation (AKU) 架构设计。

核心目标：**让知识从 vault 中回流为决策、链接、综合和可复用笔记。**

## 7 个 Skills

| Skill | 角色 | 使用场景 |
|-------|------|---------|
| `obsidian-mcp` | Vault 操作安全层 | 任何 Obsidian 读/搜/写/标签/编辑/验证操作 |
| `inbox-triage` | 原始材料初筛 | inbox、capture、fleeting notes 需要分流时 |
| `connection-review` | 笔记关系分析 | 小范围笔记需要链接、模式、矛盾分析时 |
| `weekly-synthesis` | 时间窗口综合 | 近期笔记需要 thesis、gap、一个行动、一个问题时 |
| `opencode-context-maintenance` | 上下文漂移诊断 | vault、skill、配置、宿主现实不一致时 |
| `vault-health-feedback` | 知识系统健康反馈 | vault 可能变成被动档案库时 |
| `note-promotion` | 稳定笔记晋升门 | 材料已经值得变成可复用、可链接的知识笔记时 |

## 工作流形态

```
Capture → inbox-triage → connection-review → weekly-synthesis → note-promotion
                                                                      ↓
vault-health-feedback（周期性诊断）    opencode-context-maintenance（漂移时触发）
obsidian-mcp（所有 vault 操作的安全底座）
```

## v4 架构特性

- **AKU 七组件 schema**：triggers / boundaries / continuations 结构化声明
- **约束前置**：`## Constraints` 放在文件最前（对抗 attention decay）
- **Validators**：确定性脚本验证前置/后置条件
- **EDD 验证**：每个 skill 25+ 条 eval case
- **渐进式披露**：`<details>` + 物理文件分离实现按需加载
- **CI 自动化**：GitHub Actions 验证结构/API/预算/eval

## 安装

```bash
cp -r skills/* ~/.opencode/skills/
```

## 验证环境

- OpenCode + obsidian-mcp-server@3.1.5
- Windows 11
- 最后验证：2026-05-14

## 遵循原则

- **证据先于变更**：读后再写，写后验证
- **分析先于回写**：报告优先，确认后才执行
- **宿主现实优于理想 API**：编码真实行为，不是文档描述
- **有界范围**：不做全 vault 扫描
- **跨 skill 纪律**：每个 skill 有明确的 owns / delegates_to / never_absorbs

## 文档

- [架构与知识拓扑](architecture.md)
- [跨 Skill Handoff 协议](cross-skill-handoff-protocol.md)
- [设计演进 v1→v4](design-evolution.md)
- [测试矩阵](test-matrix.md)

## License

Apache-2.0
