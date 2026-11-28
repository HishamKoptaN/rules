#!/usr/bin/env bash
# إنشاء worktree معزول وفرع خاص بمهمة واحدة انطلاقاً من الفرع الأساسي للمشروع.
set -euo pipefail

REPO="${1:-$PWD}"
TASK="${2:?الاستخدام: new-task.sh <repo-path> <task-name>}"

REPO="$(cd "$REPO" && pwd)"
BASE_BRANCH="${BASE_BRANCH:-dev}"

# البادئة part of اسم المهمة إن وُجدت، وإلا تُضاف feature/ تلقائياً.
case "$TASK" in
  fix/*|refactor/*|chore/*|test/*|feature/*) BRANCH="$TASK" ;;
  *) BRANCH="feature/$TASK" ;;
esac

WT_DIR="$(dirname "$REPO")/worktrees/$TASK"
mkdir -p "$(dirname "$WT_DIR")"

cd "$REPO"
git fetch origin
git worktree add -b "$BRANCH" "$WT_DIR" "origin/$BASE_BRANCH"

cat <<EOF
الـ worktree : $WT_DIR
الفرع        : $BRANCH
الأساس       : origin/$BASE_BRANCH
OpenCode    : tools.opencode.session.move({ directory: "$WT_DIR" })
EOF
