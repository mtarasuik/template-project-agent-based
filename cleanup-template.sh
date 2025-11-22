#!/bin/bash

# Cleanup template-specific files after project setup
# Removes files that are only needed for the template, not the actual project

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_info "Cleaning up template-specific files..."

# Files to remove (template-specific, not needed for actual projects)
TEMPLATE_FILES=(
    "SETUP-INSTRUCTIONS.md"
    "interactive-setup.sh"
    "customize-config.sh"
    "cleanup-template.sh"
    "setup.sh"
    "setup.ps1"
)

# Determine which agent system configs to keep/remove
# This should be set by the setup script, but we'll check for existing configs
if [ -d ".cursor" ] && [ ! -d ".claude" ]; then
    # Cursor only - remove Claude template files
    log_info "Detected Cursor configuration - removing Claude template files..."
    rm -rf .claude
elif [ -d ".claude" ] && [ ! -d ".cursor" ] && [ ! -f ".cursorrules" ]; then
    # Claude only - remove Cursor template files
    log_info "Detected Claude configuration - removing Cursor template files..."
    rm -rf .cursor
    rm -f .cursorrules
fi

# Files to keep but may need review
KEEP_BUT_REVIEW=(
    "README.md"
    "docs/CURSOR-CONFIGURATION-GUIDE.md"
)

REMOVED_COUNT=0
KEPT_COUNT=0

for file in "${TEMPLATE_FILES[@]}"; do
    if [ -f "$file" ]; then
        log_info "Removing template file: $file"
        rm -f "$file"
        REMOVED_COUNT=$((REMOVED_COUNT + 1))
    fi
done

log_info ""
log_info "Template-specific files removed: $REMOVED_COUNT"
log_info ""
log_info "Files to review and customize:"
for file in "${KEEP_BUT_REVIEW[@]}"; do
    if [ -f "$file" ]; then
        log_info "  - $file (review and customize as needed)"
        KEPT_COUNT=$((KEPT_COUNT + 1))
    fi
done

log_success "Cleanup complete!"
log_info ""
log_info "Your project now has the AI agent configuration set up."
log_info "Remember to:"
log_info "  1. Review and customize remaining documentation"
log_info "  2. Commit the configuration to version control"
log_info "  3. Share with your team for consistency"

