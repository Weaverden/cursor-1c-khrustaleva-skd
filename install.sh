#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${HOME}/.cursor"
SKILL_SRC="${SCRIPT_DIR}/skills/khrustaleva-skd-queries"
SKILL_DST="${TARGET}/skills/khrustaleva-skd-queries"
RULE_SRC="${SCRIPT_DIR}/rules/khrustaleva-skd-queries.mdc"
RULE_DST="${TARGET}/rules/khrustaleva-skd-queries.mdc"

mkdir -p "${TARGET}/skills" "${TARGET}/rules"
rm -rf "${SKILL_DST}"
cp -R "${SKILL_SRC}" "${SKILL_DST}"
cp "${RULE_SRC}" "${RULE_DST}"
chmod +x "${SKILL_DST}/scripts/download-book.sh" 2>/dev/null || true

echo "Installed khrustaleva-skd-queries"
echo "  Skill: ${SKILL_DST}"
echo "  Rule:  ${RULE_DST}"
echo ""
echo "Optional PDF: ${SKILL_DST}/scripts/download-book.sh"
