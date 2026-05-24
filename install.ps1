<#
.SYNOPSIS
    Install Khrustaleva SKD skill and rule into Cursor (~/.cursor/).

.PARAMETER Global
    Install to %USERPROFILE%\.cursor\ (default).

.PARAMETER ProjectDir
    Install to project .cursor\ instead.
#>
[CmdletBinding()]
param(
    [string]$ProjectDir = "",
    [switch]$Global = $true
)

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

if ($ProjectDir) {
    $TargetBase = Join-Path $ProjectDir ".cursor"
} else {
    $TargetBase = Join-Path $env:USERPROFILE ".cursor"
}

$skillSrc = Join-Path $ScriptDir "skills\khrustaleva-1c-queries"
$skillDst = Join-Path $TargetBase "skills\khrustaleva-1c-queries"
$ruleSrc  = Join-Path $ScriptDir "rules\khrustaleva-1c-queries.mdc"
$ruleDst  = Join-Path $TargetBase "rules\khrustaleva-1c-queries.mdc"

if (-not (Test-Path $skillSrc)) { throw "Skill not found: $skillSrc" }

New-Item -ItemType Directory -Path (Join-Path $TargetBase "skills") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $TargetBase "rules") -Force | Out-Null

if (Test-Path $skillDst) { Remove-Item $skillDst -Recurse -Force }
Copy-Item $skillSrc $skillDst -Recurse -Force
Copy-Item $ruleSrc $ruleDst -Force

Write-Host "Installed khrustaleva-1c-queries" -ForegroundColor Green
Write-Host "  Skill: $skillDst"
Write-Host "  Rule:  $ruleDst"
Write-Host "`nOptional PDF: .\skills\khrustaleva-1c-queries\scripts\download-book.ps1" -ForegroundColor Cyan
