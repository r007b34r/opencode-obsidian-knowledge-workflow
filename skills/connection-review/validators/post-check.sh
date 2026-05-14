#!/bin/bash
# Post-validator: connection-review must not produce synthesis
OUTPUT="${1:-/dev/stdin}"

if grep -qiE "emerging thesis|weekly meaning|time-window" "$OUTPUT" 2>/dev/null; then
  echo "FAIL: Connection review produced synthesis content"
  exit 1
fi

# Check scope constraint
NOTE_COUNT=$(grep -c "^  [A-Z]" "$OUTPUT" 2>/dev/null || echo 0)
if [ "$NOTE_COUNT" -gt 15 ]; then
  echo "WARN: Reviewed more than 15 primary notes (scope may be too broad)"
fi

echo "PASS: Connection review within constraints"
exit 0
