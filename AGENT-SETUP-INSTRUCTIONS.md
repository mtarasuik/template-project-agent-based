# Agent Setup Instructions

**For AI Agents**: When a user asks you to "set up this project" or "set up this project with AI agent configuration", follow these instructions.

## Quick Setup Command

Simply run:

```bash
bash setup.sh
```

This will:
1. Ask the user which agent system they're using (Cursor/Claude/Both)
2. Collect project information through an interactive questionnaire
3. Automatically customize all configuration files
4. Remove irrelevant agent system configurations
5. Clean up template files

## What Happens During Setup

The `setup.sh` script orchestrates the complete process:

1. **Interactive Questionnaire** (`interactive-setup.sh`):
   - Asks which agent system (Cursor/Claude/Both)
   - Collects project name, type, description
   - Gathers technology stack information
   - Asks about development environment
   - Collects project structure details
   - Gathers common tasks and workflows

2. **Automatic Customization** (`customize-config.sh`):
   - Updates `.cursorrules` (if Cursor selected)
   - Updates `.cursor/rules/ai-instructions.mdc` (if Cursor selected)
   - Updates `.claude/agents/project-agent.md` (if Claude selected)
   - Updates `.claude/rules/code-quality-priorities.md` (if Claude selected)
   - All placeholders replaced with actual project information

3. **Cleanup**:
   - Removes irrelevant agent system configs (Cursor removes Claude, Claude removes Cursor)
   - Removes template setup files after configuration is complete

## Important Notes

- **The script is interactive**: It will prompt the user for information. You cannot automate all responses.
- **Agent System Selection**: The user must choose which system they're using (Cursor/Claude/Both)
- **Project Information**: The user needs to provide project details through the questionnaire
- **After Setup**: Template files are removed, leaving only the customized configuration

## Alternative: Manual Guidance

If the interactive script doesn't work or the user wants manual setup:

1. Guide the user to run: `bash setup.sh`
2. Help them answer the questionnaire prompts
3. Review the customized files after setup
4. Make any additional customizations needed

## What NOT to Do

- Don't try to manually edit template files - use the setup script
- Don't skip the questionnaire - it's needed to customize the configs
- Don't remove files manually - the cleanup script handles this
- Don't set up both systems unless the user explicitly wants both

## Expected User Interaction

The setup process requires user input for:
- Agent system selection
- Project information (name, type, description, etc.)
- Technology stack details
- Project structure description
- Common tasks/workflows

You should guide the user through these prompts if needed.

## Verification After Setup

After setup completes, verify:
- [ ] Appropriate agent system directory exists (`.cursor/` or `.claude/`)
- [ ] Configuration files are customized (no placeholders like `[PROJECT_TYPE]`)
- [ ] Other agent system's configs are removed (if only one selected)
- [ ] Template setup files are removed
- [ ] Documentation files exist in `docs/`

## Troubleshooting

**If setup fails:**
- Check that you're in the project root directory
- Verify `setup.sh` is executable: `chmod +x setup.sh`
- Check for error messages in the script output
- Ensure bash is available

**If user wants to switch agent systems:**
- They can run `bash setup.sh` again
- Select the other agent system
- The script will remove old configs and set up new ones

---

**Remember**: The goal is to make setup as easy as possible for the user. Guide them through the interactive process and help with any questions they have.

