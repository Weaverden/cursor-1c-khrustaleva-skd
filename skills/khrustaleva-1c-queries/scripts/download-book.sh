#!/usr/bin/env bash
# Download Khrustaleva SKD book PDF to ~/.cursor/knowledge/
# Usage: ./download-book.sh [--extract-text]

set -euo pipefail

EXTRACT=0
[[ "${1:-}" == "--extract-text" ]] && EXTRACT=1

PUBLIC_KEY="https://disk.yandex.ru/i/mv-JEzR4inD25A"
OUT_DIR="${HOME}/.cursor/knowledge/khrustaleva-reports"
PDF_PATH="${OUT_DIR}/khrustaleva-slozhnye-otchety-1c8.pdf"

mkdir -p "$OUT_DIR"

echo "Requesting download URL..."
HREF=$(curl -sL "https://cloud-api.yandex.net/v1/disk/public/resources/download?public_key=${PUBLIC_KEY}" \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['href'])")

echo "Downloading PDF (~27 MB)..."
curl -L --progress-bar -o "$PDF_PATH" "$HREF"
echo "Saved: $PDF_PATH"

if [[ "$EXTRACT" -eq 1 ]]; then
  REFS_DIR="${OUT_DIR}/references"
  TEXT_PATH="${REFS_DIR}/full-text-with-pages.txt"
  mkdir -p "$REFS_DIR"
  python3 -m pip install pymupdf --quiet 2>/dev/null || pip3 install pymupdf --quiet
  python3 << PY
import fitz
path = "$PDF_PATH"
out = "$TEXT_PATH"
doc = fitz.open(path)
parts = []
for i in range(doc.page_count):
    parts.append(f"\n\n===== PAGE {i+1} =====\n\n" + doc[i].get_text())
open(out, "w", encoding="utf-8").write("".join(parts))
print(f"Pages: {doc.page_count}, written: {out}")
PY
fi

echo ""
echo "Skill summaries: run install.ps1 -Global from cursor-1c-skills repo"
