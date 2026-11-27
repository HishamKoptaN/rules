#!/usr/bin/env bash
# Create an isolated worktree + feature branch from origin/dev for one task.
set -euo pipefail

REPO="${1:-$PWD}"
TASK="${2:?Usage: new-task.sh <repo-path> <task-name>}"

REPO="$(cd "$REPO" && pwd)"
BRANCH="feature/$TASK"
BASE_BRANCH="dev"
WT_DIR="$(dirname "$REPO")/worktrees/$TASK"

cd "$REPO"
git fetch origin
git worktree add -b "$BRANCH" "$WT_DIR" "origin/$BASE_BRANCH"

cat <<EOF
worktree : $WT_DIR
branch   : $BRANCH
base     : origin/$BASE_BRANCH
OpenCode : tools.opencode.session.move({ directory: "$WT_DIR" })
EOF
