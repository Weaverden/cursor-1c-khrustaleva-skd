# Download Khrustaleva SKD book PDF to ~/.cursor/knowledge/
# Usage: .\download-book.ps1 [-ExtractText]

param(
    [switch]$ExtractText
)

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$PublicKey = "https://disk.yandex.ru/i/mv-JEzR4inD25A"
$OutDir = Join-Path $env:USERPROFILE ".cursor\knowledge\khrustaleva-reports"
$PdfPath = Join-Path $OutDir "khrustaleva-slozhnye-otchety-1c8.pdf"

New-Item -ItemType Directory -Path $OutDir -Force | Out-Null

Write-Host "Requesting download URL from Yandex Disk..." -ForegroundColor Cyan
$apiUrl = "https://cloud-api.yandex.net/v1/disk/public/resources/download?public_key=$PublicKey"
$response = Invoke-RestMethod -Uri $apiUrl -Method Get
$href = $response.href
if (-not $href) {
    throw "Failed to get download URL: $($response | ConvertTo-Json -Compress)"
}

Write-Host "Downloading PDF (~27 MB)..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $href -OutFile $PdfPath -UseBasicParsing
Write-Host "Saved: $PdfPath" -ForegroundColor Green

if ($ExtractText) {
    $refsDir = Join-Path $OutDir "references"
    New-Item -ItemType Directory -Path $refsDir -Force | Out-Null
    $textPath = Join-Path $refsDir "full-text-with-pages.txt"

    $python = Get-Command python -ErrorAction SilentlyContinue
    if (-not $python) {
        Write-Host "Python not found. Install Python 3 and run: pip install pymupdf" -ForegroundColor Yellow
        exit 0
    }

    & python -m pip install pymupdf --quiet 2>$null
    $pyScript = @"
import fitz, sys
path = sys.argv[1]
out = sys.argv[2]
doc = fitz.open(path)
parts = []
for i in range(doc.page_count):
    parts.append(f"\n\n===== PAGE {i+1} =====\n\n" + doc[i].get_text())
open(out, "w", encoding="utf-8").write("".join(parts))
print(f"Pages: {doc.page_count}, written: {out}")
"@
    $tmpPy = Join-Path $env:TEMP "khrustaleva_extract.py"
    Set-Content -Path $tmpPy -Value $pyScript -Encoding UTF8
    & python $tmpPy $PdfPath $textPath
    Write-Host "Text: $textPath" -ForegroundColor Green
}

Write-Host "`nSkill references (summaries) are installed via: .\install.ps1 -Global" -ForegroundColor Cyan
