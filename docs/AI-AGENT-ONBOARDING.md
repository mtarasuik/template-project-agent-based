# AI Agent Onboarding Guide

This guide helps new AI agents quickly understand and work effectively with this project.

> **Note**: This project uses `.cursorrules` to automatically provide context to AI agents. The rules file is automatically loaded when you start working in this project. For details on how Cursor configuration works, see `docs/CURSOR-CONFIGURATION-GUIDE.md`.

## Quick Start Prompt

When starting work on this project, use this prompt to get context:

```
I'm working on [PROJECT_NAME] which [brief description].

Key context:
- [Key technology or framework]
- [Important workflow or process]
- [Critical configuration or setup requirement]

Please read the following documentation in order:
1. docs/AI-AGENT-QUICK-REFERENCE.md
2. README.md (project overview)
3. [Any task-specific documentation]

Then help me with [your specific task].
```

## Onboarding Sequence

### Step 1: Understand the Project (5-10 minutes)

**Read these files in order:**

1. **`README.md`** - Project overview, architecture, and quick start
   - Understand the overall goal and purpose
   - Note key technologies and frameworks
   - Review the directory structure

2. **`docs/AI-AGENT-QUICK-REFERENCE.md`** - Essential reference guide
   - Review common tasks and workflows
   - Understand code patterns and conventions
   - Note important utilities and helpers

### Step 2: Understand the Workflow (5 minutes)

**Key Concepts:**

1. **Development Workflow:**
   - [Describe your development workflow]
   - [How to test changes]
   - [How to deploy or run the project]

2. **File Locations:**
   - **Configuration**: [Location of config files]
   - **Source Code**: [Location of source code]
   - **Documentation**: `docs/` directory
   - **Tests**: [Location of tests]

3. **Configuration:**
   - Main config: [Location] (gitignored, user-specific)
   - Example config: [Location]
   - Schema: [Location] (if using schema validation)

### Step 3: Understand Common Tasks (10 minutes)

**Review these sections in `docs/AI-AGENT-QUICK-REFERENCE.md`:**

- **"Common Tasks"** - Standard operations and workflows
- **"Code Patterns"** - Reusable patterns and conventions
- **"Troubleshooting"** - How to debug issues
- **"Testing"** - How to test changes

### Step 4: Task-Specific Deep Dive

**Depending on your task, read:**

- **Configuration Changes**: [Relevant documentation]
- **Feature Development**: [Relevant documentation]
- **Bug Fixes**: [Relevant documentation]
- **Testing**: [Relevant documentation]

## Essential Information Cheat Sheet

### Project Setup

```bash
# [Example setup commands]
# Adapt to your project
```

### Running Tests

```bash
# [Example test commands]
# Adapt to your project
```

### Common Commands

```bash
# [List common commands for your project]
```

## Key Principles

### 1. Idempotency
All operations must be safe to run multiple times. Always check for existing state before making changes.

### 2. Error Handling
- Use appropriate exit codes
- Log all errors with context
- Never log sensitive data
- Provide actionable error messages

### 3. User Experience
- Provide feedback for all operations
- Show progress for long-running tasks
- Never leave functions hanging
- Use clear, actionable messages

### 4. Code Quality
- Always validate code before completing
- Run linters and formatters
- Check for syntax errors
- Remove unused code

### 5. Resource Management
- Check for existing resources before creating
- Update existing resources when appropriate
- Reuse high-acceptance components
- Clean up temporary resources

## Common Patterns

### Idempotent Operations

```[language]
# Example: Check before creating
if resource_exists(resource_name):
    log_info(f"{resource_name} already exists, skipping")
    return
else:
    create_resource(resource_name)
    log_success(f"Created {resource_name}")
```

### Error Handling

```[language]
# Example: Comprehensive error handling
try:
    result = perform_operation()
    log_success("Operation completed successfully")
except SpecificError as e:
    log_error(f"Operation failed: {e}")
    cleanup_partial_changes()
    return 1
except Exception as e:
    log_error(f"Unexpected error: {e}")
    log_debug(f"Error context: {get_context()}")
    return 1
```

### Progress Feedback

```[language]
# Example: Progress indicators
log_info("Starting operation...")
for i, item in enumerate(items):
    process_item(item)
    log_info(f"Progress: {i+1}/{len(items)}")
log_success("Operation completed")
```

## Troubleshooting

### Common Issues

1. **Issue**: [Description]
   - **Solution**: [How to fix]
   - **Prevention**: [How to avoid]

2. **Issue**: [Description]
   - **Solution**: [How to fix]
   - **Prevention**: [How to avoid]

### Getting Help

1. Check `docs/AI-AGENT-QUICK-REFERENCE.md`
2. Review similar code in the codebase
3. Use `codebase_search` for semantic queries
4. Review error logs and context

## Next Steps

After onboarding:

1. **Familiarize yourself** with the codebase structure
2. **Review** existing patterns and conventions
3. **Understand** the testing approach
4. **Learn** the deployment process (if applicable)
5. **Start** with small, well-understood tasks

## Additional Resources

- **Project Documentation**: `docs/` directory
- **Code Examples**: [Location of examples]
- **API Documentation**: [Location of API docs]
- **External Resources**: [Links to external docs]

---

**Remember**: When in doubt, check the documentation, review similar code, and test incrementally. It's better to ask for clarification than to make incorrect assumptions.

