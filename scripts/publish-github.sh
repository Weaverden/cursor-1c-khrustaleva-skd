#!/usr/bin/env bash
# Create public GitHub repo and push (requires: gh auth login)
set -euo pipefail
REPO_NAME="cursor-1c-khrustaleva-skd"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if ! command -v gh >/dev/null 2>&1; then
  echo "Install GitHub CLI: brew install gh"
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "Login to GitHub first:"
  gh auth login -h github.com -p https -w
fi

USER=$(gh api user -q .login)
echo "Creating https://github.com/${USER}/${REPO_NAME}"

if gh repo view "${USER}/${REPO_NAME}" >/dev/null 2>&1; then
  echo "Repo exists, pushing..."
  git remote remove origin 2>/dev/null || true
  git remote add origin "https://github.com/${USER}/${REPO_NAME}.git"
  git push -u origin main
else
  gh repo create "$REPO_NAME" \
    --public \
    --description "Cursor knowledge base: 1C SKD complex reports & queries (Khrustaleva book summaries)" \
    --source=. \
    --remote=origin \
    --push
fi

echo ""
echo "Done: https://github.com/${USER}/${REPO_NAME}"
