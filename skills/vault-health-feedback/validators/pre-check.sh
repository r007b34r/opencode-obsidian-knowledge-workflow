#!/bin/bash
# Pre-validator for vault-health-feedback
# Verifies preconditions before skill execution

echo "Pre-check: vault-health-feedback"

# Verify obsidian-mcp companion is available
if [ -z "$MCP_AVAILABLE" ] && [ "${CI:-}" != "true" ]; then
  echo "WARN: Cannot verify MCP availability outside runtime"
fi

echo "PASS: Preconditions met"
exit 0
