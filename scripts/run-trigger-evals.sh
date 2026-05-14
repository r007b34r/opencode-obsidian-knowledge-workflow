#!/bin/bash
# Trigger eval coverage report
echo "=== Trigger Eval Coverage Report ==="
echo ""
printf "%-35s %s\n" "Skill" "Should/ShouldNot/NearMiss/Total"
echo "-------------------------------------------------------------------"

for eval_file in skills/*/evals/trigger-cases.md; do
  skill_name=$(echo "$eval_file" | cut -d/ -f2)
  SHOULD=$(sed -n '/^## Should trigger/,/^## /p' "$eval_file" | grep -c "^- " || echo 0)
  SHOULD_NOT=$(sed -n '/^## Should not trigger/,/^## /p' "$eval_file" | grep -c "^- " || echo 0)
  NEAR_MISS=$(sed -n '/^## Near misses/,/^## /p' "$eval_file" | grep -c "^- " || echo 0)
  TOTAL=$((SHOULD + SHOULD_NOT + NEAR_MISS))
  STATUS="✓"
  if [ $TOTAL -lt 25 ]; then
    STATUS="⚠"
  fi
  printf "%-35s %d/%d/%d = %d %s\n" "$skill_name" "$SHOULD" "$SHOULD_NOT" "$NEAR_MISS" "$TOTAL" "$STATUS"
done

echo ""
echo "Target: 10 should + 10 should-not + 5 near-miss = 25 minimum"
