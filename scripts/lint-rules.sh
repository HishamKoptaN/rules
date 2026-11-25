#!/usr/bin/env bash
# Lint the rules files: frontmatter format, index references, size and folder limits.
set -u

cd "$(dirname "$0")/.." || exit 1
errors=0

echo "== Linting rules files =="

# Rule files: Markdown files inside the rule folders (depth >= 2; root index files are at depth 1)
mapfile -d '' rule_files < <(find . -mindepth 2 -type f -name '*.md' -print0 2>/dev/null)

# 1) Frontmatter: each rule file needs a non-empty name and description
for f in "${rule_files[@]}"; do
  [ -n "$(grep -m1 '^name: *[^[:space:]]' "$f")" ] || { echo "ERROR: missing or empty 'name' in $f"; errors=1; }
  [ -n "$(grep -m1 '^description: *[^[:space:]]' "$f")" ] || { echo "ERROR: missing or empty 'description' in $f"; errors=1; }
done

# 2) Size: rule files must be at most 100 lines
for f in "${rule_files[@]}"; do
  lines=$(wc -l < "$f")
  if [ "$lines" -gt 100 ]; then
    echo "ERROR: $f has $lines lines (max 100)"
    errors=1
  fi
done

# 3) Folders under the root must have at most 4 files
for d in $(find . -mindepth 1 -type d -not -path './.git*' -not -path './.github*' | sort); do
  count=$(find "$d" -maxdepth 1 -type f | wc -l)
  if [ "$count" -gt 4 ]; then
    echo "ERROR: $d has $count files (max 4)"
    errors=1
  fi
done

# 4) Rule names must be unique
names=$(for f in "${rule_files[@]}"; do grep -m1 '^name: *[^[:space:]]' "$f" | awk '{print $2}'; done | sort | uniq -d)
if [ -n "$names" ]; then
  echo "ERROR: duplicate rule names: $names"
  errors=1
fi

# 5) Every rule file must be referenced in the index files (GEMINI.md, rules.md)
for f in "${rule_files[@]}"; do
  base=$(basename "$f" .md)
  grep -q "$base" GEMINI.md rules.md || { echo "ERROR: $f is not referenced in GEMINI.md or rules.md"; errors=1; }
done

if [ "$errors" -eq 0 ]; then
  echo "== OK: all rules files are valid =="
fi
exit "$errors"
