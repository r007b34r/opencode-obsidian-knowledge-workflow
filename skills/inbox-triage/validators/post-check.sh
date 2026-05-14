#!/bin/bash
# Post-validator: triage output must not contain synthesis markers
OUTPUT="${1:-/dev/stdin}"

SYNTHESIS_MARKERS="emerging thesis|contradiction analysis|gap analysis|weekly meaning|time-window synthesis"

if grep -qiE "$SYNTHESIS_MARKERS" "$OUTPUT" 2>/dev/null; then
  echo "FAIL: Triage produced synthesis content (boundary violation)"
  grep -niE "$SYNTHESIS_MARKERS" "$OUTPUT"
  exit 1
fi

# Check batch size constraint
ITEM_COUNT=$(grep -c "^Path:" "$OUTPUT" 2>/dev/null || echo 0)
if [ "$ITEM_COUNT" -gt 20 ]; then
  echo "FAIL: Batch size exceeded (found $ITEM_COUNT items, max 20)"
  exit 1
fi

echo "PASS: Triage output within constraints"
exit 0
