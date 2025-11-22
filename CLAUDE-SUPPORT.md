# Claude Code/CLI Support

This template now supports both **Cursor IDE** and **Claude Code/CLI** agent configurations.

## Quick Overview

- **Cursor IDE**: Uses `.cursorrules` and `.cursor/rules/` directory
- **Claude Code/CLI**: Uses `.claude/agents/` and `.claude/rules/` directory
- **Automatic Cleanup**: When you select one system, the other's configuration is automatically removed

## Setup Process

When you run `bash setup.sh`, you'll be asked:

```
Which AI agent system are you using?
  1) Cursor IDE
  2) Claude Code/CLI
  3) Both (not recommended - will set up Cursor only)
```

### If You Select Cursor (Option 1)

- Creates `.cursor/` directory structure
- Customizes `.cursorrules` with your project details
- Customizes `.cursor/rules/ai-instructions.mdc`
- **Removes** `.claude/` directory (Claude configs)

### If You Select Claude (Option 2)

- Creates `.claude/` directory structure
- Customizes `.claude/agents/project-agent.md` with your project details
- Customizes `.claude/rules/code-quality-priorities.md`
- **Removes** `.cursor/` directory and `.cursorrules` (Cursor configs)

### If You Select Both (Option 3)

- Creates both directory structures
- Customizes both configurations
- **Warning**: Not recommended - choose one for cleaner configuration

## Claude Configuration Structure

```
.claude/
├── agents/
│   └── project-agent.md          # Main agent definition
└── rules/
    └── code-quality-priorities.md # Code quality standards
```

### project-agent.md

This is the main agent definition file with:
- YAML frontmatter (name, description, tools, model)
- Project overview and key principles
- Common patterns and workflows
- Development guidelines
- Self-update instructions

### code-quality-priorities.md

Contains the same priority system as Cursor:
- Priority 0: Idempotency and Safety
- Priority 1: User Experience and Feedback
- Priority 2: Code Validation
- Priority 3: Resource Management
- Priority 4: Modern Methodologies
- Priority 5: Modularity and Reusability

## Agent Self-Update

Claude agents are also configured to update their own configuration files when project requirements change. The instructions are included in `.claude/agents/project-agent.md`.

## Switching Between Systems

If you need to switch from one system to another:

1. Run `bash setup.sh` again
2. Select the other agent system
3. The setup will remove the old configuration and set up the new one

## Manual Setup

If you prefer to set up Claude manually:

1. Keep `.claude/` directory
2. Customize `.claude/agents/project-agent.md` with your project details
3. Remove `.cursor/` directory and `.cursorrules` if present
4. Review and adjust `.claude/rules/code-quality-priorities.md` if needed

## Documentation

The shared documentation in `docs/` works for both systems:
- `docs/AI-AGENT-ONBOARDING.md` - Onboarding guide
- `docs/AI-AGENT-QUICK-REFERENCE.md` - Quick reference
- `docs/CURSOR-CONFIGURATION-GUIDE.md` - Configuration guide (applies to both)

## Differences from Cursor

- **File Format**: Claude uses Markdown with YAML frontmatter (`.md`), Cursor uses `.mdc` files
- **Structure**: Claude uses `agents/` subdirectory for agent definitions
- **Main Config**: Cursor has `.cursorrules` at root, Claude has agent files in `.claude/agents/`
- **Rules**: Both use similar rule structures, but file extensions differ

## Best Practices

1. **Choose One System**: Don't use both - it creates confusion and maintenance overhead
2. **Consistent Updates**: Keep agent configurations updated as project evolves
3. **Version Control**: Commit agent configurations to version control
4. **Team Alignment**: Ensure team uses the same agent system

---

For more information, see the main `README.md`.

