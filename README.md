# AI Agent Configuration Template

A comprehensive template for setting up AI agent configuration in new projects. This template supports both **Cursor IDE** and **Claude Code/CLI**, providing complete scaffolding for agent configuration including rules files, modular configurations, and comprehensive documentation.

## Quick Start

### Automated Setup with Interactive Questionnaire (Recommended)

Simply instruct your AI agent:

```
Set up this project with AI agent configuration
```

**For AI Agents**: See `AGENT-SETUP-INSTRUCTIONS.md` for detailed setup guidance.

Or run the setup script manually:

**Linux/macOS/WSL:**
```bash
bash setup.sh
```

**Windows (PowerShell):**
```powershell
.\setup.ps1
```

The setup script will:
1. ✅ Ask which agent system you're using (Cursor, Claude, or both)
2. ✅ Create necessary directory structure (`.cursor/` for Cursor, `.claude/` for Claude, `docs/`)
3. ✅ Run an interactive questionnaire to collect project-specific information
4. ✅ Automatically customize all configuration files with your project details
5. ✅ Remove irrelevant agent system configurations (keeps only what you selected)
6. ✅ Clean up template-specific files that are no longer needed
7. ✅ Guide you through final review steps

### What the Interactive Setup Collects

The setup process will ask you about:
- **Agent system selection**: Cursor IDE, Claude Code/CLI, or both
- Project name, type, and description
- Technology stack (languages, frameworks, databases)
- Development environment and file paths
- Configuration file locations and formats
- Project structure
- Common tasks and workflows
- Testing frameworks and approaches
- Deployment methods

### Agent System Support

- **Cursor IDE**: Uses `.cursorrules` and `.cursor/rules/` directory
- **Claude Code/CLI**: Uses `.claude/agents/` and `.claude/rules/` directory
- **Both**: Can set up both (not recommended - choose one for cleaner config)
- **Automatic Cleanup**: When you select one system, the other's configuration files are automatically removed

### Option 2: Manual Setup

If you prefer manual setup, the template includes all necessary files. Simply customize them:

1. Review and customize `.cursorrules` with your project-specific information
2. Update `.cursor/rules/ai-instructions.mdc` with your project details
3. Customize documentation in `docs/` directory
4. Review and adjust `.cursor/rules/code-quality-priorities.mdc` if needed

## What's Included

### Configuration Files

#### Cursor IDE Configuration

- **`.cursorrules`** - Main rules file automatically loaded by Cursor IDE
  - Project context and critical rules
  - Quick reference links
  - Development workflow guidance

- **`.cursor/rules/`** - Modular rule files
  - `code-quality-priorities.mdc` - Code quality standards and priorities
  - `ai-instructions.mdc` - Project-specific AI instructions
  - `general-preferences.mdc` - General development preferences

#### Claude Code/CLI Configuration

- **`.claude/agents/project-agent.md`** - Primary agent definition
  - Project overview and key principles
  - Common patterns and workflows
  - Development guidelines
  - Configuration update instructions

- **`.claude/rules/code-quality-priorities.md`** - Code quality standards
  - Priority system for code quality
  - Best practices and patterns
  - Resource management guidelines

### Documentation

- **`docs/AI-AGENT-ONBOARDING.md`** - Comprehensive onboarding guide for AI agents
- **`docs/AI-AGENT-QUICK-REFERENCE.md`** - Quick reference for common tasks and patterns
- **`docs/CURSOR-CONFIGURATION-GUIDE.md`** - Guide to customizing Cursor configuration

## Features

### Automated Setup Process

- **Interactive Questionnaire**: Collects all project-specific information through guided prompts
- **Automatic Customization**: Configures all files with your project details automatically
- **Template Cleanup**: Removes setup files after configuration is complete
- **Guided Review**: Highlights areas that may need additional customization

### Best Practices Included

This template incorporates best practices from production projects:

1. **Idempotency** - All operations safe to run multiple times
2. **Robust Error Handling** - Comprehensive error handling with cleanup
3. **User Experience** - Feedback on actions, no hanging functions
4. **Code Validation** - Always check for clean code
5. **Resource Management** - Check for existing resources before creating
6. **Modern Methodologies** - Latest stable versions and best practices
7. **Modularity** - Design for reuse and modularity
8. **Component Selection** - Prefer high-acceptance components
9. **Self-Updating Configuration** - Agents update their own configs when requirements change

### Code Quality Priorities

The template includes a priority system for code quality:

- **Priority 0**: Idempotency and Safety
- **Priority 1**: User Experience and Feedback
- **Priority 2**: Code Validation
- **Priority 3**: Resource Management
- **Priority 4**: Modern Methodologies
- **Priority 5**: Modularity and Reusability

## Customization

### Automated Customization (Recommended)

When you run `setup.sh`, the interactive questionnaire automatically customizes:
- `.cursorrules` - Project context, technology stack, file paths
- `.cursor/rules/ai-instructions.mdc` - Project overview, structure, common tasks
- All configuration files are populated with your project details

### Post-Setup Review

After automated setup, review and refine:

**For Cursor:**
1. **`.cursorrules`**: Verify project context is accurate, add any missing details
2. **`.cursor/rules/ai-instructions.mdc`**: Add project-specific patterns and workflows
3. **`.cursor/rules/code-quality-priorities.mdc`**: Adjust priorities if needed

**For Claude:**
1. **`.claude/agents/project-agent.md`**: Verify project context, add project-specific patterns
2. **`.claude/rules/code-quality-priorities.md`**: Adjust priorities if needed

**For Both:**
3. **`docs/AI-AGENT-ONBOARDING.md`**: Customize onboarding with your workflows
4. **`docs/AI-AGENT-QUICK-REFERENCE.md`**: Add your common tasks and patterns

### Manual Customization (Alternative)

If you prefer manual setup or need to make changes:

**For Cursor:**
1. Edit `.cursorrules` and replace placeholders with your project information
2. Update `.cursor/rules/ai-instructions.mdc` with project details
3. Remove `.claude/` directory if you're only using Cursor

**For Claude:**
1. Edit `.claude/agents/project-agent.md` with your project information
2. Update agent description and instructions
3. Remove `.cursor/` directory and `.cursorrules` if you're only using Claude

**For Both:**
3. Customize documentation in `docs/` directory
4. Review and adjust priorities as needed

See `docs/CURSOR-CONFIGURATION-GUIDE.md` for detailed customization instructions.

## File Structure

### Template Files (Before Setup)

```
.
├── .cursorrules                    # Cursor main rules file (template)
├── .cursor/
│   └── rules/
│       ├── code-quality-priorities.mdc
│       ├── ai-instructions.mdc    # Template
│       └── general-preferences.mdc
├── .claude/
│   ├── agents/
│   │   └── project-agent.md       # Claude agent definition (template)
│   └── rules/
│       └── code-quality-priorities.md
├── docs/
│   ├── AI-AGENT-ONBOARDING.md
│   ├── AI-AGENT-QUICK-REFERENCE.md
│   └── CURSOR-CONFIGURATION-GUIDE.md
├── setup.sh                        # Main setup script (Linux/macOS/WSL)
├── setup.ps1                       # Setup script (Windows)
├── interactive-setup.sh            # Interactive questionnaire
├── customize-config.sh             # Configuration customizer
├── cleanup-template.sh             # Template cleanup script
├── SETUP-INSTRUCTIONS.md           # Detailed setup guide
└── README.md                       # This file
```

### After Setup (Cursor Selected)

```
.
├── .cursorrules                    # Customized for your project
├── .cursor/
│   └── rules/
│       ├── code-quality-priorities.mdc
│       ├── ai-instructions.mdc    # Customized
│       └── general-preferences.mdc
├── docs/                            # Customized documentation
└── README.md
```

### After Setup (Claude Selected)

```
.
├── .claude/
│   ├── agents/
│   │   └── project-agent.md       # Customized
│   └── rules/
│       └── code-quality-priorities.md
├── docs/                            # Customized documentation
└── README.md
```

**Note**: Template-specific setup files and the other agent system's configuration are automatically removed after setup.

## Usage

### For New Projects

1. **Clone this template repository** or copy files to your project
2. **Run the setup script**: `bash setup.sh` (or instruct AI agent: "set up this project")
3. **Answer the interactive questionnaire** with your project details
4. **Review the automatically customized files** and make any additional refinements
5. **Start developing** with AI agent assistance - agents will update configs as needed

### For Existing Projects

1. Copy configuration files from this template to your project
2. Run `bash setup.sh` to customize with your project details
3. Or manually customize:
   - `.cursorrules` with your project context
   - `.cursor/rules/ai-instructions.mdc` with project details
   - Documentation in `docs/` directory
4. Review and adjust priorities as needed
5. Commit configuration to version control

### After Setup

Once setup is complete:
- Template-specific setup files are automatically removed
- All configuration files are customized for your project
- Agents are ready to assist with development
- Agents will update configuration files as project evolves

## Key Principles

The template enforces these key principles:

1. **Idempotency**: All code must be safe to run multiple times
2. **Error Handling**: Comprehensive error handling with cleanup
3. **User Experience**: Always provide feedback, no hanging functions
4. **Code Quality**: Always validate code before completing
5. **Resource Management**: Check before creating, update when appropriate
6. **Modern Practices**: Use latest stable versions and best practices
7. **Modularity**: Design for reuse and modularity
8. **Component Selection**: Prefer high-acceptance components
9. **Self-Updating Configuration**: Agents update their own configs when requirements change

## Agent Self-Update Instructions

**Important Feature**: Agents are configured to update their own configuration files when project requirements change.

### When Agents Should Update Configuration

- New patterns or conventions emerge during development
- Project structure changes significantly
- New common tasks or workflows are established
- Technology stack or dependencies change
- Development workflow evolves
- New best practices are discovered

### What Gets Updated

- **`.cursorrules`**: Project context, critical rules, file paths, workflows
- **`.cursor/rules/ai-instructions.mdc`**: New patterns, project structure, common tasks
- **`docs/AI-AGENT-QUICK-REFERENCE.md`**: New patterns, tasks, troubleshooting
- **`docs/AI-AGENT-ONBOARDING.md`**: Updated workflows and processes

### How It Works

Agents are instructed in `.cursorrules` and `.cursor/rules/ai-instructions.mdc` to:
1. Recognize when patterns or requirements change
2. Review current configuration
3. Update relevant files
4. Test that changes work correctly
5. Document what changed and why

This ensures the agent configuration stays current with your project's evolving needs.

## Examples

### Example 1: Web Application

For a web application project:
- Update project type to "Full-stack web application"
- Add frontend/backend framework information
- Include database and deployment details

### Example 2: CLI Tool

For a CLI tool:
- Update project type to "Command-line tool"
- Add language and distribution information
- Include testing and documentation details

### Example 3: Library/Package

For a library or package:
- Update project type to "Library/Package"
- Add package manager and distribution details
- Include API documentation requirements

## Troubleshooting

### Setup Issues

**Questionnaire not running:**
- Ensure you have bash installed (Linux/macOS/WSL)
- Check file permissions: `chmod +x setup.sh interactive-setup.sh customize-config.sh cleanup-template.sh`
- Run scripts from project root directory

**Customization not working:**
- Check that all scripts are executable
- Verify you answered all questionnaire prompts
- Review error messages in script output

### Configuration Not Loading

- Verify files are in correct locations
- Check file formats (`.mdc` files need proper frontmatter)
- Restart Cursor IDE
- Verify `.cursorrules` syntax

### Too Much Context

- Split large rule files into smaller, focused files
- Use `alwaysApply: false` for less critical rules
- Reference external docs instead of including everything

### Not Enough Context

- Add project-specific examples
- Include common patterns
- Reference detailed documentation
- Add troubleshooting guidance

### Agent Not Updating Configuration

**For Cursor:**
- Verify `.cursorrules` includes self-update instructions
- Check that agents have read the configuration update guidelines

**For Claude:**
- Verify `.claude/agents/project-agent.md` includes self-update instructions
- Check that agents have read the configuration update guidelines

**For Both:**
- Manually update if needed, then agents should follow the pattern

## Contributing

When contributing improvements:

1. Follow the same principles (idempotency, error handling, etc.)
2. Keep documentation up to date
3. Test with different project types
4. Maintain backward compatibility where possible

## Workflow Summary

### Complete Setup Flow

```
1. Clone/Copy Template
   ↓
2. Run: bash setup.sh
   ↓
3. Answer Interactive Questionnaire
   ├─ Select agent system (Cursor/Claude/Both)
   ├─ Project name, type, description
   ├─ Technology stack
   ├─ Development environment
   ├─ Project structure
   └─ Common tasks
   ↓
4. Automatic Customization
   ├─ Cursor: .cursorrules + .cursor/rules/ updated
   ├─ Claude: .claude/agents/ + .claude/rules/ updated
   └─ All files populated with project details
   ↓
5. Remove Irrelevant Configs
   ├─ If Cursor: Remove .claude/ directory
   └─ If Claude: Remove .cursor/ and .cursorrules
   ↓
6. Template Cleanup
   └─ Setup files removed
   ↓
7. Review & Refine
   └─ Make any additional customizations
   ↓
8. Start Development
   └─ Agents assist and update configs as needed
```

### Ongoing Maintenance

- **Agents automatically update** configuration when patterns change
- **Review agent updates** before committing
- **Manually refine** as project evolves
- **Keep documentation current** with project changes

## Additional Resources

- **Setup Instructions**: `SETUP-INSTRUCTIONS.md` (before setup) or see setup output
- **Cursor Configuration Guide**: `docs/CURSOR-CONFIGURATION-GUIDE.md`
- **Onboarding Guide**: `docs/AI-AGENT-ONBOARDING.md`
- **Quick Reference**: `docs/AI-AGENT-QUICK-REFERENCE.md`
- **Best Practices**: See `.cursor/rules/code-quality-priorities.mdc`
- **Cursor IDE Documentation**: [Cursor docs]

## License

[Add your license here]

---

**Remember**: The goal is to provide clear, actionable context to AI agents while maintaining code quality, safety, and excellent user experience. The template automates setup and agents keep configuration current as your project evolves.
