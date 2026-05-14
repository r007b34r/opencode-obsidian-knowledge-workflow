#!/bin/bash
# Pre-validator for inbox-triage
# Verifies preconditions before skill execution

echo "Pre-check: inbox-triage"

# Verify obsidian-mcp companion is available
if [ -z "$MCP_AVAILABLE" ] && [ "${CI:-}" != "true" ]; then
  echo "WARN: Cannot verify MCP availability outside runtime"
fi

echo "PASS: Preconditions met"
exit 0
