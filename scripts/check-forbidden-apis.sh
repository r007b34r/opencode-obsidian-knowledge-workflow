#!/bin/bash
# Checks that no SKILL.md recommends forbidden APIs without prohibition context
FORBIDDEN="obsidian_patch_note|obsidian_append_to_note"
FOUND=$(grep -rn -E "$FORBIDDEN" skills/ --include="*.md" | grep -iv "forbidden\|禁止\|do not use\|never\|banned\|broken\|unavailable" || true)

if [ -n "$FOUND" ]; then
  echo "FAIL: Forbidden API referenced without prohibition context:"
  echo "$FOUND"
  exit 1
fi
echo "PASS: No unauthorized forbidden API references"
exit 0
