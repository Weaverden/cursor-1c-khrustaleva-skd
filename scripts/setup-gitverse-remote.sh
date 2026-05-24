#!/usr/bin/env bash
# Configure GitVerse remote with saved token (.gitverse-token in repo root).
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

TOKEN_FILE="${ROOT}/.gitverse-token"
if [[ -z "${GITVERSE_TOKEN:-}" ]] && [[ -f "$TOKEN_FILE" ]]; then
  GITVERSE_TOKEN="$(tr -d '[:space:]' < "$TOKEN_FILE")"
fi
if [[ -z "${GITVERSE_TOKEN:-}" ]]; then
  echo "Create ${TOKEN_FILE} with your GitVerse token, or set GITVERSE_TOKEN"
  exit 1
fi

USER="${GITVERSE_USER:-Weaverden}"
REPO="cursor-1c-khrustaleva-queries"
AUTH_URL="https://${USER}:${GITVERSE_TOKEN}@gitverse.ru/${USER}/${REPO}.git"

git remote remove gitverse 2>/dev/null || true
git remote add gitverse "$AUTH_URL"
git push -u gitverse main 2>/dev/null || git push gitverse main

printf "protocol=https\nhost=gitverse.ru\nusername=%s\npassword=%s\n" "$USER" "$GITVERSE_TOKEN" \
  | git credential-osxkeychain store 2>/dev/null || true

echo "gitverse remote OK → https://gitverse.ru/${USER}/${REPO}"
echo "Token: ${TOKEN_FILE} (gitignored)"
