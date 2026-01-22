# ===== wine-ml-infra scaffold (PowerShell) =====
$ErrorActionPreference = "Stop"

$Repo = "wine-ml-infra"

function Ensure-Dir($Path) {
  if (-not (Test-Path $Path)) {
    New-Item -ItemType Directory -Path $Path | Out-Null
  }
}

function Ensure-File($Path) {
  if (-not (Test-Path $Path)) {
    New-Item -ItemType File -Path $Path | Out-Null
  }
}

# Repo root
Ensure-Dir $Repo
Set-Location $Repo

# Root files (won't overwrite)
Ensure-File ".gitignore"
Ensure-File "README.md"
Ensure-File "LICENSE"

# Terraform folders
Ensure-Dir "terraform"
Ensure-Dir "terraform\modules"
Ensure-Dir "terraform\modules\s3"
Ensure-Dir "terraform\envs"
Ensure-Dir "terraform\envs\dev"

# Terraform module files
Ensure-File "terraform\modules\s3\main.tf"
Ensure-File "terraform\modules\s3\variables.tf"
Ensure-File "terraform\modules\s3\outputs.tf"

# Dev env files
Ensure-File "terraform\envs\dev\main.tf"
Ensure-File "terraform\envs\dev\variables.tf"
Ensure-File "terraform\envs\dev\terraform.tfvars"
Ensure-File "terraform\envs\dev\backend.hcl"

# GitHub Actions
Ensure-Dir ".github"
Ensure-Dir ".github\workflows"
Ensure-File ".github\workflows\terraform-ci.yml"

# Scripts
Ensure-Dir "scripts"
Ensure-File "scripts\bootstrap.ps1"

Write-Host "✅ Folder structure created/verified."
Write-Host "Repo path: $((Get-Location).Path)"
Write-Host ""
Write-Host "Verify with: tree /F"
