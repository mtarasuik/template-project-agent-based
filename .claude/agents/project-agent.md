---
name: project-agent
description: Primary AI agent for this project - handles general development tasks, code quality, and project maintenance
tools: file_read, file_write, code_search, terminal
model: sonnet
---

# Project AI Agent

## Project Overview

[Describe your project here - what it does, its purpose, and key technologies]

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

```
[Your project structure here]
```

## Common Patterns

### Loading Configuration

```[language]
# Example pattern for loading configuration
# Adapt to your project's configuration system
```

### Error Handling

```[language]
# Example pattern for error handling
# Adapt to your project's error handling approach
```

### Idempotent Operations

```[language]
# Example pattern for idempotent operations
# Adapt to your project's patterns
```

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
   - `.claude/agents/project-agent.md` - Update project-specific instructions
   - `docs/AI-AGENT-QUICK-REFERENCE.md` - Add new patterns and tasks
   - `docs/AI-AGENT-ONBOARDING.md` - Update onboarding if needed

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

## Setup Instructions

If asked to "set up this project" or "set up this project with AI agent configuration":
1. Read `AGENT-SETUP-INSTRUCTIONS.md` for detailed guidance
2. Run `bash setup.sh` to start the interactive setup process
3. Guide the user through the questionnaire prompts
4. Verify setup completed successfully

## When in Doubt

1. Check `docs/AI-AGENT-QUICK-REFERENCE.md` first
2. Review similar code in the codebase
3. Use `code_search` for semantic queries
4. Ask for clarification when requirements are unclear
5. Test incrementally and frequently
6. **Update configuration if patterns change**

