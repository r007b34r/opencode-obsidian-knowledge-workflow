#!/bin/bash
# Checks that no SKILL.md recommends forbidden APIs without prohibition/example context
FORBIDDEN="obsidian_patch_note|obsidian_append_to_note"
EXCLUDE="forbidden\|禁止\|do not use\|never\|banned\|broken\|bad\|wrong\|error\|fail\|incorrect\|avoid\|FORBIDDEN"

FOUND=$(grep -rn -E "$FORBIDDEN" skills/ --include="*.md" | grep -iv "$EXCLUDE" || true)

if [ -n "$FOUND" ]; then
  echo "FAIL: Forbidden API referenced without prohibition/example context:"
  echo "$FOUND"
  exit 1
fi
echo "PASS: No unauthorized forbidden API references"
exit 0
