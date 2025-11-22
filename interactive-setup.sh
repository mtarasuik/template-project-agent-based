#!/bin/bash

# Interactive Project Setup Questionnaire
# Collects project-specific information and tailors the configuration

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

log_prompt() {
    echo -e "${CYAN}[?]${NC} $1"
}

# Function to prompt for input with default
prompt_with_default() {
    local prompt_text="$1"
    local default_value="$2"
    local var_name="$3"
    
    if [ -n "$default_value" ]; then
        log_prompt "$prompt_text (default: $default_value): "
    else
        log_prompt "$prompt_text: "
    fi
    
    read -r input
    if [ -z "$input" ] && [ -n "$default_value" ]; then
        eval "$var_name='$default_value'"
    else
        eval "$var_name='$input'"
    fi
}

# Function to prompt for multi-line input
prompt_multiline() {
    local prompt_text="$1"
    local var_name="$2"
    local input=""
    local line
    
    log_prompt "$prompt_text (Press Enter twice to finish): "
    while IFS= read -r line; do
        if [ -z "$line" ] && [ -z "$input" ]; then
            break
        fi
        if [ -z "$input" ]; then
            input="$line"
        else
            input="$input"$'\n'"$line"
        fi
    done
    eval "$var_name='$input'"
}

log_info "=========================================="
log_info "Project Configuration Questionnaire"
log_info "=========================================="
log_info ""
log_info "This will collect information about your project to customize the AI agent configuration."
log_info ""

# Ask which agent system to use
log_info "Which AI agent system are you using?"
log_info "  1) Cursor IDE"
log_info "  2) Claude Code/CLI"
log_info "  3) Both (not recommended - will set up Cursor only)"
log_prompt "Select option (1-3, default: 1): "
read -r agent_choice
case "$agent_choice" in
    2)
        AGENT_SYSTEM="claude"
        ;;
    3)
        AGENT_SYSTEM="both"
        log_warn "Setting up both systems. You may want to choose one for cleaner configuration."
        ;;
    *)
        AGENT_SYSTEM="cursor"
        ;;
esac

# Collect project information
prompt_with_default "Project name" "" PROJECT_NAME
prompt_with_default "Project type (e.g., Web Application, CLI Tool, Library)" "" PROJECT_TYPE
prompt_with_default "Brief project description" "" PROJECT_DESCRIPTION

log_info ""
log_info "Technology Stack:"
prompt_with_default "Primary programming language(s)" "" PRIMARY_LANGUAGE
prompt_with_default "Framework(s) or library(ies)" "" FRAMEWORKS
prompt_with_default "Database(s) (if applicable)" "" DATABASES
prompt_with_default "Other key dependencies (comma-separated)" "" DEPENDENCIES

log_info ""
log_info "Development Environment:"
prompt_with_default "Development environment (Local/WSL/Remote/Docker)" "Local" DEV_ENV
prompt_with_default "Local project path" "$(pwd)" LOCAL_PATH
prompt_with_default "Remote/Server paths (if applicable)" "" REMOTE_PATHS

log_info ""
log_info "Configuration:"
prompt_with_default "Configuration file location (relative to project root)" "config/" CONFIG_PATH
prompt_with_default "Configuration file format (YAML/JSON/TOML/env)" "YAML" CONFIG_FORMAT

log_info ""
log_info "Project Structure:"
log_info "Describe your project structure (directories, key files):"
prompt_multiline "Project structure" PROJECT_STRUCTURE

log_info ""
log_info "Common Tasks:"
log_info "List common tasks or workflows in your project (one per line, empty line to finish):"
prompt_multiline "Common tasks" COMMON_TASKS

log_info ""
log_info "Testing:"
prompt_with_default "Testing framework(s)" "" TEST_FRAMEWORK
prompt_with_default "Test directory location" "tests/" TEST_DIR

log_info ""
log_info "Deployment:"
prompt_with_default "Deployment method (if applicable)" "" DEPLOYMENT_METHOD
prompt_with_default "Production environment details (if applicable)" "" PROD_ENV

# Save collected information
log_info ""
log_info "Saving collected information..."

# Create a temporary file with collected information
TEMP_CONFIG="/tmp/project-config-$$.sh"
cat > "$TEMP_CONFIG" <<EOF
PROJECT_NAME="$PROJECT_NAME"
PROJECT_TYPE="$PROJECT_TYPE"
PROJECT_DESCRIPTION="$PROJECT_DESCRIPTION"
PRIMARY_LANGUAGE="$PRIMARY_LANGUAGE"
FRAMEWORKS="$FRAMEWORKS"
DATABASES="$DATABASES"
DEPENDENCIES="$DEPENDENCIES"
DEV_ENV="$DEV_ENV"
LOCAL_PATH="$LOCAL_PATH"
REMOTE_PATHS="$REMOTE_PATHS"
CONFIG_PATH="$CONFIG_PATH"
CONFIG_FORMAT="$CONFIG_FORMAT"
PROJECT_STRUCTURE="$PROJECT_STRUCTURE"
COMMON_TASKS="$COMMON_TASKS"
TEST_FRAMEWORK="$TEST_FRAMEWORK"
TEST_DIR="$TEST_DIR"
DEPLOYMENT_METHOD="$DEPLOYMENT_METHOD"
PROD_ENV="$PROD_ENV"
AGENT_SYSTEM="$AGENT_SYSTEM"
EOF

log_success "Information collected and saved!"
log_info ""
log_info "Next: The configuration files will be customized with this information."
log_info ""

echo "$TEMP_CONFIG"

