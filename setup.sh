#!/bin/bash

# AI Agent Configuration Setup Script
# This script scaffolds out all AI agent configuration files for a new project
# Includes interactive questionnaire and automatic customization

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
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

log_section() {
    echo ""
    echo -e "${CYAN}========================================${NC}"
    echo -e "${CYAN}$1${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
}

# Check if running from project root
if [ ! -f "README.md" ]; then
    log_error "Please run this script from the project root directory"
    exit 1
fi

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log_section "AI Agent Configuration Setup"

# Step 1: Collect project information (includes agent system selection)
log_section "Step 1: Collecting Project Information"

log_info "We'll now collect information about your project to customize the configuration."
log_info "Press Enter to accept defaults, or type your own values."
echo ""

CONFIG_FILE=$(bash "$SCRIPT_DIR/interactive-setup.sh")
if [ $? -ne 0 ] || [ -z "$CONFIG_FILE" ] || [ ! -f "$CONFIG_FILE" ]; then
    log_error "Failed to collect project information"
    exit 1
fi

# Source the config to get AGENT_SYSTEM
source "$CONFIG_FILE"

# Step 2: Create directory structure based on selected agent system
log_section "Step 2: Creating Directory Structure"

if [ "$AGENT_SYSTEM" = "cursor" ] || [ "$AGENT_SYSTEM" = "both" ]; then
    if [ ! -d ".cursor" ]; then
        mkdir -p .cursor/rules
        log_success "Created .cursor directory structure"
    else
        log_info ".cursor directory already exists"
    fi
fi

if [ "$AGENT_SYSTEM" = "claude" ] || [ "$AGENT_SYSTEM" = "both" ]; then
    if [ ! -d ".claude" ]; then
        mkdir -p .claude/agents .claude/rules
        log_success "Created .claude directory structure"
    else
        log_info ".claude directory already exists"
    fi
fi

if [ ! -d "docs" ]; then
    mkdir -p docs
    log_success "Created docs directory"
else
    log_info "docs directory already exists"
fi

# Step 3: Clean up irrelevant agent system configs
log_section "Step 3: Cleaning Up Irrelevant Configurations"

if [ "$AGENT_SYSTEM" = "cursor" ]; then
    log_info "Removing Claude-specific configuration files..."
    rm -rf .claude
    log_success "Removed Claude configuration"
elif [ "$AGENT_SYSTEM" = "claude" ]; then
    log_info "Removing Cursor-specific configuration files..."
    rm -rf .cursor
    rm -f .cursorrules
    log_success "Removed Cursor configuration"
else
    log_warn "Both systems selected - keeping both configurations"
fi

# Step 4: Customize configuration files
log_section "Step 4: Customizing Configuration Files"

bash "$SCRIPT_DIR/customize-config.sh" "$CONFIG_FILE"
if [ $? -ne 0 ]; then
    log_error "Failed to customize configuration files"
    rm -f "$CONFIG_FILE"
    exit 1
fi

# Clean up temporary config file
rm -f "$CONFIG_FILE"

# Step 5: Cleanup template files
log_section "Step 5: Cleaning Up Template Files"

log_info "Removing template-specific files that are no longer needed..."
bash "$SCRIPT_DIR/cleanup-template.sh"

# Final summary
log_section "Setup Complete!"

log_success "AI agent configuration has been set up and customized for your project!"
log_info ""
log_info "What was done:"
if [ "$AGENT_SYSTEM" = "cursor" ] || [ "$AGENT_SYSTEM" = "both" ]; then
    log_info "  ✓ Created .cursor directory structure"
    log_info "  ✓ Customized .cursorrules with your project details"
    log_info "  ✓ Customized .cursor/rules/ai-instructions.mdc"
fi
if [ "$AGENT_SYSTEM" = "claude" ] || [ "$AGENT_SYSTEM" = "both" ]; then
    log_info "  ✓ Created .claude directory structure"
    log_info "  ✓ Customized .claude/agents/project-agent.md"
    log_info "  ✓ Customized .claude/rules/code-quality-priorities.md"
fi
log_info "  ✓ Collected project-specific information"
log_info "  ✓ Removed irrelevant agent system configurations"
log_info "  ✓ Removed template-specific setup files"
log_info ""
log_info "Next steps:"
if [ "$AGENT_SYSTEM" = "cursor" ] || [ "$AGENT_SYSTEM" = "both" ]; then
    log_info "  1. Review .cursorrules and make any additional customizations"
    log_info "  2. Review .cursor/rules/ai-instructions.mdc and add project-specific patterns"
fi
if [ "$AGENT_SYSTEM" = "claude" ] || [ "$AGENT_SYSTEM" = "both" ]; then
    log_info "  1. Review .claude/agents/project-agent.md and customize as needed"
    log_info "  2. Review .claude/rules/code-quality-priorities.md if needed"
fi
log_info "  3. Customize docs/AI-AGENT-ONBOARDING.md with your workflows"
log_info "  4. Customize docs/AI-AGENT-QUICK-REFERENCE.md with your common tasks"
log_info "  5. Commit the configuration to version control"
log_info ""
log_warn "Important: Agents are configured to update their own configuration files"
log_warn "when project requirements change. Review changes before committing."
log_info ""
log_success "You're ready to start using AI agents with your project!"

