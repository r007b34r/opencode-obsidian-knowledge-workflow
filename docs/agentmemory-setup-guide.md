# Agentmemory + OpenRouter 免费 LLM 配置指南

## 最终可用方案

经过实测，以下配置在 OpenCode + agentmemory v0.9.4 上完全可用：

### 1. 环境变量（内联传参，最可靠）

```powershell
$env:ANTHROPIC_API_KEY='你的OpenRouter-key'
$env:ANTHROPIC_BASE_URL='https://openrouter.ai/api/v1'
$env:ANTHROPIC_MODEL='openrouter/free'
$env:EMBEDDING_PROVIDER='local'
$env:GRAPH_EXTRACTION_ENABLED='true'
$env:CONSOLIDATION_ENABLED='true'
$env:AGENTMEMORY_AUTO_COMPRESS='true'
$env:AGENTMEMORY_INJECT_CONTEXT='true'
npx -y @agentmemory/agentmemory
```

### 2. 验证步骤

终端启动应显示：
```
Provider: anthropic (openrouter/free)    ← LLM 层已激活
Embedding provider: local (384 dims)     ← 语义搜索已激活
```

打开 http://localhost:3113/ → 四个 ⚠️ 消失 → LLM provider 被正确识别。

### 3. 关键坑

- `@latest` 锁版本 → 改 pin 到 `3.1.5` 或特定版本
- User 级 env 不一定会传到 npx 子进程 → 用内联传参
- OpenRouter 免费模型用 `openrouter/free`，不是 `deepseek/deepseek-chat`（后者要付费）
- `.env` 文件可能不生效 → 用 `$env:` 内联传最可靠
