#!/bin/bash
# Post-validator: enforce exactly-one constraint for synthesis
OUTPUT="${1:-/dev/stdin}"

ACTION_COUNT=$(grep -c "^One action:" "$OUTPUT" 2>/dev/null || echo 0)
QUESTION_COUNT=$(grep -c "^One question:" "$OUTPUT" 2>/dev/null || echo 0)

if [ "$ACTION_COUNT" -ne 1 ]; then
  echo "FAIL: Expected exactly 1 'One action:' field (found $ACTION_COUNT)"
  exit 1
fi

if [ "$QUESTION_COUNT" -ne 1 ]; then
  echo "FAIL: Expected exactly 1 'One question:' field (found $QUESTION_COUNT)"
  exit 1
fi

# Check for recap markers (lists without thesis)
if ! grep -qi "thesis\|emerging\|claim" "$OUTPUT" 2>/dev/null; then
  echo "WARN: Output may be a recap (no thesis/claim marker found)"
fi

echo "PASS: Synthesis output structure valid"
exit 0
