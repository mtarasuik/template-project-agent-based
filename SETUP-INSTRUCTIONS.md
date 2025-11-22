# Setup Instructions

This document provides detailed instructions for setting up AI agent configuration using this template.

## Overview

This template provides a complete scaffolding for AI agent configuration in Cursor IDE, based on best practices from production projects. It includes:

- Comprehensive `.cursorrules` file with project context and critical rules
- Modular rule files in `.cursor/rules/` directory
- Complete documentation for AI agents
- Setup scripts for automated configuration

## Quick Start

### Method 1: AI Agent Setup (Recommended)

Simply instruct your AI agent:

```
Set up this project with AI agent configuration
```

The agent will:
1. Create necessary directory structure
2. Set up all configuration files
3. Guide you through customization

### Method 2: Manual Script Execution

**Linux/macOS/WSL:**
```bash
bash setup.sh
```

**Windows (PowerShell):**
```powershell
.\setup.ps1
```

### Method 3: Manual Setup

All files are already in place. Simply customize them:

1. Review `.cursorrules` and update project-specific information
2. Update `.cursor/rules/ai-instructions.mdc` with your project details
3. Customize documentation in `docs/` directory
4. Review and adjust priorities if needed

## Customization Steps

### Step 1: Update `.cursorrules`

Replace placeholders with your project information:

- `[PROJECT_TYPE]` → Your project type (e.g., "Web Application", "CLI Tool")
- `[Brief description]` → Brief project description
- `[List main technologies]` → Your technology stack
- `[Path to local project]` → Your project paths
- `[Location of config files]` → Your configuration file locations

**Key sections to customize:**
- "Project Information" section
- "File Paths and Locations" section
- "Configuration Management" section
- Any project-specific workflows or rules

### Step 2: Customize `.cursor/rules/ai-instructions.mdc`

Update with your project details:

1. **Project Overview**: Describe what your project does
2. **Project Structure**: Document your directory structure
3. **Common Patterns**: Add patterns specific to your stack
4. **Development Workflow**: Document your workflow
5. **Testing Requirements**: Document your testing approach

### Step 3: Customize Documentation

Update files in `docs/` directory:

1. **`AI-AGENT-ONBOARDING.md`**:
   - Update quick start prompt
   - Customize onboarding sequence
   - Add project-specific information
   - Include your common tasks

2. **`AI-AGENT-QUICK-REFERENCE.md`**:
   - Add your common tasks
   - Document your code patterns
   - Include your utility functions
   - Add troubleshooting guidance

3. **`CURSOR-CONFIGURATION-GUIDE.md`**:
   - Update with your customization examples
   - Add project-specific guidance

### Step 4: Review Priorities (Optional)

Review `.cursor/rules/code-quality-priorities.mdc`:

- Adjust priorities if needed for your project
- Add project-specific patterns
- Update examples for your technology stack
- Modify timeout values if needed

## Best Practices Included

This template includes best practices from the openstack project example:

### 1. Idempotency
- All operations safe to run multiple times
- State detection before modifications
- Skip operations if already done
- Clear logging of skipped operations

### 2. Error Handling
- Comprehensive error handling
- Appropriate exit codes
- Context-rich error messages
- Cleanup on failure
- Never log sensitive data

### 3. User Experience
- Feedback for all operations
- Progress indicators for long operations
- No hanging functions
- Clear, actionable messages
- Status updates during operations

### 4. Code Validation
- Always validate before completing
- Run linters and formatters
- Check for syntax errors
- Remove unused code
- Type checking (if applicable)

### 5. Resource Management
- Check for existing resources
- Update instead of creating duplicates
- Reuse high-acceptance components
- Avoid low-acceptance components
- Clean up temporary resources

### 6. Modern Methodologies
- Use latest stable versions
- Follow current best practices
- Prefer modern patterns
- Stay current with frameworks
- Industry-standard conventions

### 7. Modularity and Reusability
- Design for reuse
- Create reusable components
- Follow DRY principles
- Composable, testable units
- Separation of concerns

### 8. Component Selection
- Prefer high-acceptance components
- Research before adopting
- Check maintenance status
- Verify community support
- Prefer stable releases

## File Structure

```
.
├── .cursorrules                    # Main rules file (customize this)
├── .cursor/
│   └── rules/
│       ├── code-quality-priorities.mdc  # Code quality standards
│       ├── ai-instructions.mdc          # Project-specific instructions (customize)
│       └── general-preferences.mdc     # General preferences
├── docs/
│   ├── AI-AGENT-ONBOARDING.md            # Onboarding guide (customize)
│   ├── AI-AGENT-QUICK-REFERENCE.md      # Quick reference (customize)
│   └── CURSOR-CONFIGURATION-GUIDE.md    # Configuration guide
├── setup.sh                        # Setup script (Linux/macOS/WSL)
├── setup.ps1                       # Setup script (Windows)
├── README.md                       # Project README
└── SETUP-INSTRUCTIONS.md           # This file
```

## Verification

After setup, verify configuration:

1. **Check Files Exist**:
   ```bash
   ls -la .cursorrules
   ls -la .cursor/rules/
   ls -la docs/
   ```

2. **Review Configuration**:
   - Open `.cursorrules` and verify it's customized
   - Check `.cursor/rules/` files are present
   - Verify documentation is updated

3. **Test in Cursor**:
   - Open project in Cursor IDE
   - Verify rules are loaded (check Cursor settings)
   - Test with a simple AI agent request

## Troubleshooting

### Configuration Not Loading

- **Check file locations**: Files must be in project root
- **Verify syntax**: Check markdown syntax in `.mdc` files
- **Restart Cursor**: Restart IDE after configuration changes
- **Check frontmatter**: `.mdc` files need proper frontmatter

### Too Much Context

- Split large files into smaller, focused files
- Use `alwaysApply: false` for less critical rules
- Reference external docs instead of duplicating

### Not Enough Context

- Add project-specific examples
- Include common patterns
- Reference detailed documentation
- Add troubleshooting guidance

## Next Steps

After setup:

1. **Test Configuration**: Try a simple AI agent request
2. **Refine Rules**: Adjust based on agent behavior
3. **Update Documentation**: Keep docs current with project changes
4. **Share with Team**: Ensure team members use consistent configuration

## Additional Resources

- **Cursor Configuration Guide**: `docs/CURSOR-CONFIGURATION-GUIDE.md`
- **Onboarding Guide**: `docs/AI-AGENT-ONBOARDING.md`
- **Quick Reference**: `docs/AI-AGENT-QUICK-REFERENCE.md`
- **Project README**: `README.md`

---

**Remember**: The goal is to provide clear, actionable context to AI agents while maintaining code quality, safety, and excellent user experience. Customize the template to fit your project's specific needs.

