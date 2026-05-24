#!/usr/bin/env bash
# Add GitVerse remote and push (token via env, not stored in repo).
# Usage: GITVERSE_TOKEN=your_token ./scripts/setup-gitverse-remote.sh

set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if [[ -z "${GITVERSE_TOKEN:-}" ]]; then
  echo "Set GITVERSE_TOKEN (create at https://gitverse.ru → Settings → Tokens)"
  exit 1
fi

USER="${GITVERSE_USER:-Weaverden}"
REPO="cursor-1c-khrustaleva-queries"
URL="https://${USER}:${GITVERSE_TOKEN}@gitverse.ru/${USER}/${REPO}.git"
CLEAN="https://gitverse.ru/${USER}/${REPO}.git"

git remote remove gitverse 2>/dev/null || true
git remote add gitverse "$URL"
git push -u gitverse main
git remote set-url gitverse "$CLEAN"
git remote set-url --push gitverse "$URL"

echo "Remote gitverse configured. Push URL uses token from env on next push if you:"
echo "  export GITVERSE_TOKEN=..."
echo "  git remote set-url --push gitverse \"https://${USER}:\${GITVERSE_TOKEN}@gitverse.ru/${USER}/${REPO}.git\""
echo "Public: https://gitverse.ru/${USER}/${REPO}"
