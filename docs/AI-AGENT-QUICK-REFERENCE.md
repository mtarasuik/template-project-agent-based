# AI Agent Quick Reference

This document provides a quick reference for common tasks, patterns, and workflows in this project.

## Table of Contents

- [Common Tasks](#common-tasks)
- [Code Patterns](#code-patterns)
- [Configuration](#configuration)
- [Testing](#testing)
- [Troubleshooting](#troubleshooting)
- [Utility Functions](#utility-functions)

## Common Tasks

### Task 1: [Task Name]

**Description**: [What this task does]

**Steps**:
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Example**:
```[language]
# Example code
```

**Common Issues**:
- [Issue 1]: [Solution]
- [Issue 2]: [Solution]

### Task 2: [Task Name]

[Repeat pattern for other common tasks]

## Code Patterns

### Pattern 1: Idempotent Resource Creation

```[language]
# Check if resource exists before creating
if not resource_exists(resource_name):
    create_resource(resource_name)
    log_success(f"Created {resource_name}")
else:
    log_info(f"{resource_name} already exists, skipping")
```

### Pattern 2: Configuration Loading

```[language]
# Load and validate configuration
config = load_config(config_path)
if not validate_config(config):
    log_error("Invalid configuration")
    return 1
```

### Pattern 3: Error Handling with Cleanup

```[language]
# Comprehensive error handling
try:
    result = perform_operation()
except Exception as e:
    log_error(f"Operation failed: {e}")
    cleanup_partial_changes()
    return 1
```

### Pattern 4: Progress Feedback

```[language]
# Show progress for long operations
total = len(items)
for i, item in enumerate(items):
    process_item(item)
    if (i + 1) % 10 == 0:
        log_info(f"Progress: {i+1}/{total}")
```

## Configuration

### Configuration Files

- **Main Config**: [Location]
- **Example Config**: [Location]
- **Schema**: [Location]

### Loading Configuration

```[language]
# Example: Load configuration
config = load_config("config/main-config.yaml")
value = config.get("section.field", "default")
```

### Validating Configuration

```[language]
# Example: Validate configuration
if not validate_config(config, schema_path):
    log_error("Configuration validation failed")
    return 1
```

## Testing

### Running Tests

```bash
# [Example test commands]
```

### Writing Tests

```[language]
# Example test pattern
def test_feature():
    # Setup
    setup_test_environment()
    
    # Execute
    result = feature_function()
    
    # Assert
    assert result == expected
    
    # Cleanup
    cleanup_test_environment()
```

### Test Best Practices

- Tests should be idempotent
- Clean up test artifacts
- Use descriptive test names
- Test edge cases and error conditions
- Keep tests simple and focused

## Troubleshooting

### Debugging Workflow

1. **Check Logs**: Review error logs and context
2. **Verify State**: Check current system state
3. **Test Incrementally**: Break down the problem
4. **Review Similar Code**: Look for existing patterns
5. **Search Documentation**: Check relevant docs

### Common Issues

#### Issue: [Description]

**Symptoms**: [What you see]

**Causes**: [Possible causes]

**Solutions**:
1. [Solution 1]
2. [Solution 2]

**Prevention**: [How to avoid]

#### Issue: [Another Issue]

[Repeat pattern]

## Utility Functions

### Logging

```[language]
# Logging functions
log_info("Information message")
log_success("Success message")
log_warn("Warning message")
log_error("Error message")
log_debug("Debug message")
```

### Validation

```[language]
# Validation functions
if not is_valid_input(value):
    log_error("Invalid input")
    return 1
```

### Resource Management

```[language]
# Resource management
if resource_exists(name):
    resource = get_resource(name)
else:
    resource = create_resource(name)
```

## Code Quality Checklist

Before completing any task, ensure:

- [ ] Code is idempotent
- [ ] Error handling is comprehensive
- [ ] Progress feedback is provided
- [ ] Code passes linting
- [ ] Code is properly formatted
- [ ] Tests pass (if applicable)
- [ ] Documentation is updated
- [ ] No sensitive data is logged
- [ ] Resources are properly managed

## Best Practices Summary

1. **Idempotency**: Always check state before modifying
2. **Error Handling**: Comprehensive error handling with cleanup
3. **User Experience**: Always provide feedback
4. **Code Quality**: Validate before completing
5. **Resource Management**: Check before creating, update when appropriate
6. **Modern Practices**: Use latest stable versions and best practices
7. **Modularity**: Design for reuse and modularity
8. **Documentation**: Keep docs up to date

## Quick Commands Reference

```bash
# [List quick commands for your project]
# Adapt to your project's needs
```

## Additional Resources

- **Onboarding Guide**: `docs/AI-AGENT-ONBOARDING.md`
- **Project README**: `README.md`
- **Configuration Guide**: [Location]
- **API Documentation**: [Location]

---

**Remember**: When in doubt, check the documentation, review similar code, and test incrementally.

