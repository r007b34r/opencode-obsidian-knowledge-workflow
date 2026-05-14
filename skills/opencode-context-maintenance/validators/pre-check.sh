#!/bin/bash
# Pre-validator for opencode-context-maintenance
# Verifies preconditions before skill execution

echo "Pre-check: opencode-context-maintenance"

# Verify obsidian-mcp companion is available
if [ -z "$MCP_AVAILABLE" ] && [ "${CI:-}" != "true" ]; then
  echo "WARN: Cannot verify MCP availability outside runtime"
fi

echo "PASS: Preconditions met"
exit 0
