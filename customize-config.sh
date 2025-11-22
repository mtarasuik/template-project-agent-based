#!/bin/bash

# Customize configuration files with collected project information

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

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

if [ $# -lt 1 ]; then
    log_error "Usage: $0 <config-file>"
    exit 1
fi

CONFIG_FILE="$1"
if [ ! -f "$CONFIG_FILE" ]; then
    log_error "Config file not found: $CONFIG_FILE"
    exit 1
fi

# Source the collected configuration
source "$CONFIG_FILE"

log_info "Customizing configuration files with project information..."

# Customize based on selected agent system
if [ "$AGENT_SYSTEM" = "cursor" ] || [ "$AGENT_SYSTEM" = "both" ]; then
    # Customize Cursor configuration
    log_info "Customizing Cursor configuration..."
    
    # Customize .cursorrules
    if [ -f ".cursorrules" ]; then
    log_info "Updating .cursorrules..."
    
    # Create backup
    cp .cursorrules .cursorrules.backup.$(date +%s)
    
    # Replace placeholders
    sed -i.bak "s|\[PROJECT_TYPE\]|$PROJECT_TYPE|g" .cursorrules
    sed -i.bak "s|\[Brief description\]|$PROJECT_DESCRIPTION|g" .cursorrules
    sed -i.bak "s|\[List main technologies\]|$PRIMARY_LANGUAGE, $FRAMEWORKS|g" .cursorrules
    sed -i.bak "s|\[Local/WSL/Remote server details\]|$DEV_ENV|g" .cursorrules
    sed -i.bak "s|\[List critical dependencies\]|$DEPENDENCIES|g" .cursorrules
    sed -i.bak "s|\[Path to local project\]|$LOCAL_PATH|g" .cursorrules
    sed -i.bak "s|\[If applicable, remote paths\]|$REMOTE_PATHS|g" .cursorrules
    sed -i.bak "s|\[Location of config files\]|$CONFIG_PATH|g" .cursorrules
    
    rm -f .cursorrules.bak
    log_success "Updated .cursorrules"
fi

# Customize .cursor/rules/ai-instructions.mdc
if [ -f ".cursor/rules/ai-instructions.mdc" ]; then
    log_info "Updating .cursor/rules/ai-instructions.mdc..."
    
    # Create backup
    cp .cursor/rules/ai-instructions.mdc .cursor/rules/ai-instructions.mdc.backup.$(date +%s)
    
    # Create customized content
    cat > .cursor/rules/ai-instructions.mdc <<EOF
# AI Agent Instructions

## Project Overview

**$PROJECT_NAME** - $PROJECT_DESCRIPTION

This project is a $PROJECT_TYPE built with $PRIMARY_LANGUAGE and $FRAMEWORKS.

## Key Principles

1. **Idempotency**: All scripts and operations must be safe to run multiple times
2. **Configuration-Driven**: Single source of truth for configuration
3. **Validation**: All configs and code should be validated
4. **Modularity**: Reusable libraries and components
5. **Error Handling**: Graceful failures with clear error messages
6. **User Experience**: Always provide feedback, no hanging functions
7. **Code Quality**: Always validate code before completing tasks
8. **Resource Management**: Check for existing resources before creating new ones
9. **Self-Update**: Update agent configuration when requirements change

## Project Structure

$PROJECT_STRUCTURE

## Technology Stack

- **Primary Language**: $PRIMARY_LANGUAGE
- **Frameworks**: $FRAMEWORKS
- **Databases**: $DATABASES
- **Dependencies**: $DEPENDENCIES
- **Testing**: $TEST_FRAMEWORK
- **Deployment**: $DEPLOYMENT_METHOD

## Common Patterns

### Loading Configuration

Configuration files are located at: \`$CONFIG_PATH\`
Format: $CONFIG_FORMAT

\`\`\`bash
# Example pattern for loading configuration
# Adapt to your project's configuration system
\`\`\`

### Error Handling

\`\`\`bash
# Example pattern for error handling
# Adapt to your project's error handling approach
\`\`\`

### Idempotent Operations

\`\`\`bash
# Example pattern for idempotent operations
# Adapt to your project's patterns
\`\`\`

## Common Tasks

$COMMON_TASKS

## Development Workflow

1. **Before Making Changes**:
   - Check for existing implementations
   - Review related documentation
   - Understand current system state
   - Plan changes to maintain compatibility

2. **During Development**:
   - Write idempotent code
   - Add comprehensive error handling
   - Include logging and progress indicators
   - Validate inputs and outputs
   - Test incrementally

3. **After Making Changes**:
   - Validate code quality (lint, format, type check)
   - Test the changes
   - Update documentation if needed
   - Check for breaking changes
   - Verify idempotency
   - **Update agent configuration if requirements changed**

## Testing Requirements

- Testing framework: $TEST_FRAMEWORK
- Test directory: $TEST_DIR
- Unit tests for critical business logic
- Integration tests for workflows
- End-to-end tests for critical paths
- Validation tests for configuration
- All tests should be idempotent

## Configuration Updates

**IMPORTANT**: If project requirements, patterns, or workflows change during development, agents should update their own configuration files:

1. **When to Update**:
   - New patterns or conventions emerge
   - Project structure changes significantly
   - New common tasks or workflows are established
   - Technology stack changes
   - Development workflow evolves

2. **What to Update**:
   - \`.cursorrules\` - Update project context and critical rules
   - \`.cursor/rules/ai-instructions.mdc\` - Update project-specific instructions
   - \`docs/AI-AGENT-QUICK-REFERENCE.md\` - Add new patterns and tasks
   - \`docs/AI-AGENT-ONBOARDING.md\` - Update onboarding if needed

3. **How to Update**:
   - Review current configuration
   - Identify what needs to change
   - Update relevant files
   - Test that changes work correctly
   - Document the changes

## Documentation Standards

- Keep documentation up to date
- Use clear, concise language
- Include examples and code snippets
- Document assumptions and constraints
- Provide troubleshooting guidance

## When in Doubt

1. Check \`docs/AI-AGENT-QUICK-REFERENCE.md\` first
2. Review similar code in the codebase
3. Use \`codebase_search\` for semantic queries
4. Ask for clarification when requirements are unclear
5. Test incrementally and frequently
6. **Update configuration if patterns change**
EOF

    log_success "Updated .cursor/rules/ai-instructions.mdc"
    fi
fi

if [ "$AGENT_SYSTEM" = "claude" ] || [ "$AGENT_SYSTEM" = "both" ]; then
    # Customize Claude configuration
    log_info "Customizing Claude configuration..."
    
    # Customize .claude/agents/project-agent.md
    if [ -f ".claude/agents/project-agent.md" ]; then
        log_info "Updating .claude/agents/project-agent.md..."
        
        # Create backup
        cp .claude/agents/project-agent.md .claude/agents/project-agent.md.backup.$(date +%s)
        
        # Create customized content
        cat > .claude/agents/project-agent.md <<EOF
---
name: project-agent
description: Primary AI agent for $PROJECT_NAME - handles general development tasks, code quality, and project maintenance
tools: file_read, file_write, code_search, terminal
model: sonnet
---

# Project AI Agent

## Project Overview

**$PROJECT_NAME** - $PROJECT_DESCRIPTION

This project is a $PROJECT_TYPE built with $PRIMARY_LANGUAGE and $FRAMEWORKS.

## Key Principles

1. **Idempotency**: All scripts and operations must be safe to run multiple times
2. **Configuration-Driven**: Single source of truth for configuration
3. **Validation**: All configs and code should be validated
4. **Modularity**: Reusable libraries and components
5. **Error Handling**: Graceful failures with clear error messages
6. **User Experience**: Always provide feedback, no hanging functions
7. **Code Quality**: Always validate code before completing tasks
8. **Resource Management**: Check for existing resources before creating new ones
9. **Self-Update**: Update agent configuration when requirements change

## Project Structure

$PROJECT_STRUCTURE

## Technology Stack

- **Primary Language**: $PRIMARY_LANGUAGE
- **Frameworks**: $FRAMEWORKS
- **Databases**: $DATABASES
- **Dependencies**: $DEPENDENCIES
- **Testing**: $TEST_FRAMEWORK
- **Deployment**: $DEPLOYMENT_METHOD

## Common Patterns

### Loading Configuration

Configuration files are located at: \`$CONFIG_PATH\`
Format: $CONFIG_FORMAT

\`\`\`bash
# Example pattern for loading configuration
# Adapt to your project's configuration system
\`\`\`

### Error Handling

\`\`\`bash
# Example pattern for error handling
# Adapt to your project's error handling approach
\`\`\`

### Idempotent Operations

\`\`\`bash
# Example pattern for idempotent operations
# Adapt to your project's patterns
\`\`\`

## Common Tasks

$COMMON_TASKS

## Development Workflow

1. **Before Making Changes**:
   - Check for existing implementations
   - Review related documentation
   - Understand current system state
   - Plan changes to maintain compatibility

2. **During Development**:
   - Write idempotent code
   - Add comprehensive error handling
   - Include logging and progress indicators
   - Validate inputs and outputs
   - Test incrementally

3. **After Making Changes**:
   - Validate code quality (lint, format, type check)
   - Test the changes
   - Update documentation if needed
   - Check for breaking changes
   - Verify idempotency
   - **Update agent configuration if requirements changed**

## Testing Requirements

- Testing framework: $TEST_FRAMEWORK
- Test directory: $TEST_DIR
- Unit tests for critical business logic
- Integration tests for workflows
- End-to-end tests for critical paths
- Validation tests for configuration
- All tests should be idempotent

## Configuration Updates

**IMPORTANT**: If project requirements, patterns, or workflows change during development, agents should update their own configuration files:

1. **When to Update**:
   - New patterns or conventions emerge
   - Project structure changes significantly
   - New common tasks or workflows are established
   - Technology stack changes
   - Development workflow evolves

2. **What to Update**:
   - \`.claude/agents/project-agent.md\` - Update project-specific instructions
   - \`docs/AI-AGENT-QUICK-REFERENCE.md\` - Add new patterns and tasks
   - \`docs/AI-AGENT-ONBOARDING.md\` - Update onboarding if needed

3. **How to Update**:
   - Review current configuration
   - Identify what needs to change
   - Update relevant files
   - Test that changes work correctly
   - Document the changes

## Documentation Standards

- Keep documentation up to date
- Use clear, concise language
- Include examples and code snippets
- Document assumptions and constraints
- Provide troubleshooting guidance

## When in Doubt

1. Check \`docs/AI-AGENT-QUICK-REFERENCE.md\` first
2. Review similar code in the codebase
3. Use \`code_search\` for semantic queries
4. Ask for clarification when requirements are unclear
5. Test incrementally and frequently
6. **Update configuration if patterns change**
EOF

        rm -f .claude/agents/project-agent.md.bak
        log_success "Updated .claude/agents/project-agent.md"
    fi
fi

# Customize documentation files
log_info "Updating documentation files..."

# Update AI-AGENT-ONBOARDING.md with project-specific info
if [ -f "docs/AI-AGENT-ONBOARDING.md" ]; then
    # Add project-specific quick start prompt
    # This is a simplified update - full customization would be more complex
    log_info "Documentation files ready for manual review"
fi

log_success "Configuration customization complete!"
log_info ""
log_info "Please review the updated files and make any additional customizations as needed."

