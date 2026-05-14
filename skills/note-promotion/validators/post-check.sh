#!/bin/bash
# Post-validator: promoted notes must have links and correct structure
OUTPUT="${1:-/dev/stdin}"

# Check promotion decision is explicit
if ! grep -qi "^Promotion decision:" "$OUTPUT" 2>/dev/null; then
  echo "FAIL: No explicit promotion decision in output"
  exit 1
fi

# If promoted, check integration targets
if grep -qi "^Promotion decision: promote" "$OUTPUT" 2>/dev/null; then
  LINK_COUNT=$(grep -ci "link\|integration target" "$OUTPUT" 2>/dev/null || echo 0)
  if [ "$LINK_COUNT" -lt 2 ]; then
    echo "FAIL: Promoted note has fewer than 2 integration targets"
    exit 1
  fi
fi

echo "PASS: Promotion output valid"
exit 0
