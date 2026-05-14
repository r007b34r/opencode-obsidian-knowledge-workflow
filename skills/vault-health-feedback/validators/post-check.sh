#!/bin/bash
# Post-validator: max 3 recommendations, layer order respected
OUTPUT="${1:-/dev/stdin}"

REC_COUNT=$(grep -c "^[0-9]\." "$OUTPUT" 2>/dev/null || echo 0)
if [ "$REC_COUNT" -gt 3 ]; then
  echo "FAIL: More than 3 recommendations ($REC_COUNT found)"
  exit 1
fi

# Check layer order (workflow should appear before structural)
WORKFLOW_LINE=$(grep -n -i "workflow" "$OUTPUT" 2>/dev/null | head -1 | cut -d: -f1 || echo 999)
STRUCTURAL_LINE=$(grep -n -i "structural" "$OUTPUT" 2>/dev/null | head -1 | cut -d: -f1 || echo 0)
if [ "$STRUCTURAL_LINE" -lt "$WORKFLOW_LINE" ] && [ "$STRUCTURAL_LINE" -ne 0 ]; then
  echo "WARN: Structural findings appear before workflow (check layer order)"
fi

echo "PASS: Health feedback within constraints"
exit 0
