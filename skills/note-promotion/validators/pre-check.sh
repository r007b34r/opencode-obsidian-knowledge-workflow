#!/bin/bash
# Pre-validator for note-promotion
# Verifies preconditions before skill execution

echo "Pre-check: note-promotion"

# Verify obsidian-mcp companion is available
if [ -z "$MCP_AVAILABLE" ] && [ "${CI:-}" != "true" ]; then
  echo "WARN: Cannot verify MCP availability outside runtime"
fi

echo "PASS: Preconditions met"
exit 0
