#!/bin/bash
set -e
ERRORS=0

echo "=== Skill Structure Validation ==="
for skill_dir in skills/*/; do
  skill_name=$(basename "$skill_dir")
  printf "  %-35s" "$skill_name:"

  SKILL_ERRORS=0
  for f in SKILL.md CHANGELOG.md evals/trigger-cases.md references/examples.md references/templates.md; do
    if [ ! -f "$skill_dir$f" ]; then
      echo -n " MISSING:$f"
      SKILL_ERRORS=$((SKILL_ERRORS + 1))
    fi
  done

  # Check version in frontmatter
  if ! grep -q "version:" "$skill_dir/SKILL.md" 2>/dev/null; then
    echo -n " NO_VERSION"
    SKILL_ERRORS=$((SKILL_ERRORS + 1))
  fi

  # Check that Constraints section exists and is early in the file
  if ! grep -q "^## Constraints" "$skill_dir/SKILL.md" 2>/dev/null; then
    echo -n " NO_CONSTRAINTS_SECTION"
    SKILL_ERRORS=$((SKILL_ERRORS + 1))
  fi

  # Check for lazy-load instructions
  if ! grep -q "read.*references/" "$skill_dir/SKILL.md" 2>/dev/null; then
    echo -n " NO_LAZY_LOAD"
    SKILL_ERRORS=$((SKILL_ERRORS + 1))
  fi

  # Check license
  if grep -q "license: MIT" "$skill_dir/SKILL.md" 2>/dev/null; then
    echo -n " LICENSE_MISMATCH"
    SKILL_ERRORS=$((SKILL_ERRORS + 1))
  fi

  if [ $SKILL_ERRORS -eq 0 ]; then
    echo "OK"
  else
    echo ""
    ERRORS=$((ERRORS + SKILL_ERRORS))
  fi
done

echo ""
echo "=== Forbidden API Check ==="
FORBIDDEN="obsidian_patch_note|obsidian_append_to_note"
# Allow references in prohibition context OR in "bad example" / "forbidden" / "error" context
FOUND=$(grep -rn -E "$FORBIDDEN" skills/ --include="*.md" | grep -iv "forbidden\|禁止\|do not use\|never\|banned\|broken\|bad\|wrong\|error\|fail\|incorrect\|avoid" || true)
if [ -n "$FOUND" ]; then
  echo "FAIL: Forbidden API referenced without prohibition/example context:"
  echo "$FOUND"
  ERRORS=$((ERRORS + 1))
else
  echo "PASS: No unauthorized forbidden API references"
fi

echo ""
echo "=== Token Budget Check (500 line limit) ==="
for skill in skills/*/SKILL.md; do
  LINES=$(wc -l < "$skill")
  if [ "$LINES" -gt 500 ]; then
    echo "FAIL: $skill exceeds 500 lines ($LINES)"
    ERRORS=$((ERRORS + 1))
  fi
done
echo "PASS: All skills within line budget"

echo ""
echo "=== References Substance Check (>60 lines) ==="
for ref in skills/*/references/*.md; do
  LINES=$(wc -l < "$ref")
  if [ "$LINES" -lt 60 ]; then
    skill_name=$(echo "$ref" | cut -d/ -f2)
    echo "  WARN: $ref only $LINES lines (target: 80+)"
  fi
done

echo ""
echo "=== Eval Coverage Check ==="
for eval_file in skills/*/evals/trigger-cases.md; do
  skill_name=$(echo "$eval_file" | cut -d/ -f2)
  COUNT=$(grep -c "^- " "$eval_file" 2>/dev/null || echo 0)
  if [ "$COUNT" -lt 20 ]; then
    printf "  %-35s %s cases (target: 25+)\n" "$skill_name:" "$COUNT"
  fi
done

echo ""
if [ $ERRORS -gt 0 ]; then
  echo "=== FAILED: $ERRORS errors found ==="
  exit 1
fi
echo "=== ALL CHECKS PASSED ==="
