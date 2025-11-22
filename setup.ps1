# AI Agent Configuration Setup Script (PowerShell)
# This script scaffolds out all AI agent configuration files for a new project

$ErrorActionPreference = "Stop"

function Write-Info {
    param([string]$Message)
    Write-Host "[INFO] $Message" -ForegroundColor Blue
}

function Write-Success {
    param([string]$Message)
    Write-Host "[SUCCESS] $Message" -ForegroundColor Green
}

function Write-Warn {
    param([string]$Message)
    Write-Host "[WARN] $Message" -ForegroundColor Yellow
}

function Write-Error {
    param([string]$Message)
    Write-Host "[ERROR] $Message" -ForegroundColor Red
}

# Check if running from project root
if (-not (Test-Path "README.md")) {
    Write-Error "Please run this script from the project root directory"
    exit 1
}

Write-Info "Setting up AI agent configuration..."

# Create .cursor directory if it doesn't exist
if (-not (Test-Path ".cursor")) {
    New-Item -ItemType Directory -Path ".cursor\rules" -Force | Out-Null
    Write-Success "Created .cursor directory structure"
} else {
    Write-Info ".cursor directory already exists"
}

# Create docs directory if it doesn't exist
if (-not (Test-Path "docs")) {
    New-Item -ItemType Directory -Path "docs" -Force | Out-Null
    Write-Success "Created docs directory"
} else {
    Write-Info "docs directory already exists"
}

# Check if .cursorrules exists
if (Test-Path ".cursorrules") {
    Write-Warn ".cursorrules already exists. Backing up to .cursorrules.backup"
    Copy-Item ".cursorrules" ".cursorrules.backup"
}

Write-Info "Configuration files are ready!"
Write-Info ""
Write-Info "Next steps:"
Write-Info "1. Review and customize .cursorrules with your project-specific information"
Write-Info "2. Update .cursor/rules/ai-instructions.mdc with your project details"
Write-Info "3. Customize documentation in docs/ directory"
Write-Info "4. Review .cursor/rules/code-quality-priorities.mdc and adjust if needed"
Write-Info ""
Write-Info "See docs/CURSOR-CONFIGURATION-GUIDE.md for detailed customization instructions"
Write-Success "Setup complete!"

