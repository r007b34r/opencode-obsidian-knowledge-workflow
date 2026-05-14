#!/bin/bash
# Post-validator: verify no forbidden MCP APIs were used in execution
# Usage: pipe execution log or pass as $1

LOG="${1:-/dev/stdin}"
FORBIDDEN_PATTERN="obsidian_patch_note|obsidian_append_to_note"

if grep -qE "$FORBIDDEN_PATTERN" "$LOG" 2>/dev/null; then
  echo "FAIL: Forbidden MCP API detected in execution log"
  grep -nE "$FORBIDDEN_PATTERN" "$LOG"
  exit 1
fi

# Check for overwrite:true without explicit user confirmation marker
if grep -q 'overwrite.*true' "$LOG" 2>/dev/null; then
  if ! grep -q 'USER_CONFIRMED_OVERWRITE' "$LOG" 2>/dev/null; then
    echo "FAIL: overwrite:true used without confirmation marker"
    exit 1
  fi
fi

echo "PASS: All API calls within safety constraints"
exit 0
