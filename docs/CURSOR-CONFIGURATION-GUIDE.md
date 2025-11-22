# Cursor Configuration Guide

This guide explains how Cursor IDE configuration works in this project and how to customize it for your needs.

## Overview

Cursor IDE uses several configuration files to provide context and instructions to AI agents:

1. **`.cursorrules`** - Main rules file (automatically loaded)
2. **`.cursor/rules/`** - Directory of modular rule files
3. **`.cursor/`** - Additional Cursor-specific configuration

## Configuration Files

### `.cursorrules`

The main rules file that Cursor automatically loads. This file should contain:
- Project-specific context
- Critical rules and priorities
- Quick reference information
- Links to detailed documentation

**Best Practices**:
- Keep it concise (focus on critical information)
- Reference detailed docs rather than duplicating
- Update when project structure changes
- Include quick reference links

### `.cursor/rules/` Directory

This directory contains modular rule files that can be organized by topic:

- **`code-quality-priorities.mdc`** - Code quality standards and priorities
- **`ai-instructions.mdc`** - Project-specific AI instructions
- **`general-preferences.mdc`** - General development preferences

**File Format**: `.mdc` files support frontmatter:
```markdown
---
alwaysApply: true  # Always apply these rules
---

# Rule content
```

### Rule File Organization

Organize rules by concern:
- **Code Quality**: `code-quality-priorities.mdc`
- **Project-Specific**: `ai-instructions.mdc`
- **General**: `general-preferences.mdc`
- **Task-Specific**: Create additional files as needed

## Customization

### For Your Project

1. **Update `.cursorrules`**:
   - Replace `[PROJECT_TYPE]` with your project type
   - Update file paths and locations
   - Customize critical rules for your project
   - Add project-specific context

2. **Update `.cursor/rules/ai-instructions.mdc`**:
   - Add project overview
   - Document project structure
   - Add common patterns for your stack
   - Include project-specific workflows

3. **Customize Rule Files**:
   - Modify priorities if needed
   - Add project-specific patterns
   - Update examples for your technology stack
   - Add task-specific rules

### Adding New Rules

Create a new `.mdc` file in `.cursor/rules/`:

```markdown
---
alwaysApply: false  # Or true if always needed
---

# Your Rule Title

## Section 1
Content here

## Section 2
More content
```

## Best Practices

### Keep Rules Focused

- Each rule file should focus on a specific concern
- Avoid duplicating information across files
- Reference other docs rather than duplicating

### Update Regularly

- Update rules when project structure changes
- Keep rules in sync with actual practices
- Remove outdated rules
- Add new rules as patterns emerge

### Test Your Rules

- Verify rules are being applied
- Check that AI agents understand the context
- Refine based on agent behavior
- Get feedback from team members

## Troubleshooting

### Rules Not Being Applied

1. Check file location (`.cursor/rules/` or `.cursorrules`)
2. Verify file format (correct markdown syntax)
3. Check `alwaysApply` frontmatter if using `.mdc`
4. Restart Cursor IDE

### Too Much Context

- Split large rule files into smaller, focused files
- Use `alwaysApply: false` for less critical rules
- Reference external docs instead of including everything

### Not Enough Context

- Add project-specific examples
- Include common patterns
- Reference detailed documentation
- Add troubleshooting guidance

## Example Customization

### For a Web Application

```markdown
# .cursorrules excerpt

## Critical Project Context

### Project Information
- **Project Type**: Full-stack web application
- **Frontend**: React with TypeScript
- **Backend**: Node.js with Express
- **Database**: PostgreSQL
- **Development**: Local development with Docker
```

### For a CLI Tool

```markdown
# .cursorrules excerpt

## Critical Project Context

### Project Information
- **Project Type**: Command-line tool
- **Language**: Python 3.10+
- **Distribution**: PyPI package
- **Testing**: pytest
- **Documentation**: Sphinx
```

## Additional Resources

- **Cursor Documentation**: [Cursor IDE docs]
- **Project Onboarding**: `docs/AI-AGENT-ONBOARDING.md`
- **Quick Reference**: `docs/AI-AGENT-QUICK-REFERENCE.md`

---

**Remember**: The goal is to provide clear, actionable context to AI agents while keeping the configuration maintainable and up to date.

