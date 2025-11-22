# Code Quality Priorities

When evaluating or planning any code solutions, the following priorities apply in descending order (0 is the highest priority):

> **Exception Clause**: These practices should apply unless it is explicitly required and intentionally implemented in such a way not to be consistent with these practices. When deviating from these practices, the code should clearly document why the deviation is necessary and intentional.

## Priority 0: Idempotency and Safety

All code must be **idempotent** and **safe to run multiple times** without affecting previous runs. This applies to:
- Configuration changes
- Package installations
- Service setup
- File modifications
- Database operations
- Any state-changing operations

### Requirements:

1. **State Detection**: Code must detect if the target state already exists or has been previously applied. When detected:
   - Skip the operation with a clear message (e.g., "Already configured, skipping")
   - OR prompt the user for a decision when appropriate
   - Always verify current state before making changes

2. **Graceful Failure Handling**: If code fails or partially fails:
   - Handle all error cases gracefully
   - Never leave the system in a partial or unstable state
   - Provide clear error messages indicating what failed and why
   - Include actionable next steps in error messages

3. **Rollback Capability**: Any operation that modifies system state must have:
   - A way to completely undo changes if the operation fails
   - Cleanup logic to remove partial installations, configurations, or other artifacts
   - Transaction-like behavior where possible (all-or-nothing)
   - Backup/restore mechanisms for critical operations

4. **Robust Logging**: Always create comprehensive logs or output for:
   - Debugging purposes
   - Audit trails
   - Troubleshooting failed operations
   - Understanding what the code did and why
   - Include timestamps, operation context, and outcomes

### Examples of Good Practices:

- Check if a package is installed before attempting installation
- Verify file existence and content before modifying
- Use conditional logic to skip already-configured services
- Implement cleanup functions that can be called on failure
- Log all significant operations with timestamps and outcomes
- Check for existing resources (databases, files, configurations) before creating new ones
- Use atomic operations where possible
- Implement checkpoints for long-running operations

## Priority 1: User Experience and Feedback

### No Hanging Functions
- All operations must provide feedback to the user
- Never leave users wondering if something is working
- Show progress for operations longer than 1 second
- Use appropriate indicators (spinners, progress bars, status messages)

### Progress Indicators
- For operations < 1 second: Optional feedback
- For operations 1-5 seconds: Status messages
- For operations 5-30 seconds: Progress indicators
- For operations > 30 seconds: Detailed progress with time estimates

### Clear Communication
- Use clear, actionable error messages
- Provide context for what went wrong
- Suggest solutions or next steps
- Use appropriate log levels (info, warn, error, debug)

## Priority 2: Code Validation

### Always Validate Code
- Run linters before completing tasks
- Check for syntax errors
- Validate type safety (if using typed languages)
- Remove unused imports and dead code
- Format code according to project standards
- Check for security vulnerabilities

### Validation Checklist
- [ ] Code passes all linters
- [ ] No syntax errors
- [ ] Type checking passes (if applicable)
- [ ] No unused imports/variables
- [ ] Code is properly formatted
- [ ] Security checks pass
- [ ] Tests pass (if applicable)

## Priority 3: Resource Management

### Check Before Creating
- Always check if a resource already exists before creating
- Update existing resources when appropriate
- Reuse existing components and patterns
- Avoid duplicate resources

### Component Selection
- **Prefer high acceptance components**: Use well-established, widely-adopted libraries and frameworks
- **Avoid low acceptance components**: Steer clear of experimental or poorly-maintained dependencies
- **Research before adopting**: Check GitHub stars, maintenance status, community support
- **Version stability**: Prefer stable releases over beta/alpha versions

### Resource Cleanup
- Clean up temporary files and resources
- Remove failed operation artifacts
- Release acquired resources (connections, handles, etc.)
- Implement proper resource lifecycle management

## Priority 4: Modern Methodologies

### Use Latest Stable Resources
- Prefer latest stable versions of tools and libraries
- Stay current with framework updates (within reason)
- Use modern language features and APIs
- Adopt current best practices and patterns

### Technology Selection
- Choose technologies with active maintenance
- Prefer well-documented solutions
- Use industry-standard tools and patterns
- Consider long-term maintainability

## Priority 5: Modularity and Reusability

### Design for Reuse
- Create reusable components and functions
- Follow DRY (Don't Repeat Yourself) principles
- Build composable, testable units
- Use dependency injection where appropriate
- Design with separation of concerns

### Code Organization
- Group related functionality together
- Use clear module boundaries
- Minimize coupling between modules
- Maximize cohesion within modules
- Follow project structure conventions

## Command Execution Timeout Management

When executing shell commands, the agent must:

1. **Estimate Expected Duration**: Before running any command, estimate a reasonable maximum execution time based on:
   - Command type (quick queries: seconds; installations: minutes; compilations: 10+ minutes)
   - System resources and network conditions
   - Historical execution times for similar operations
   - Complexity of the operation

2. **Set Timeout Expectations**: 
   - Quick commands (< 30 seconds): Use appropriate timeout mechanisms
   - Medium commands (30s - 5 min): Monitor progress
   - Long operations (5+ min): Use progress monitoring or break into checkpoints
   - Network operations: Add appropriate timeouts based on network reliability

3. **Monitor and Cancel**: If a command exceeds its estimated reasonable time:
   - Cancel the command if possible
   - Re-evaluate the situation:
     - Check for error messages or partial output
     - Determine if the command is stuck or just slow
     - Consider alternative approaches or breaking the operation into smaller steps
   - Report findings to the user with recommendations

4. **Progress Monitoring**: For long-running commands:
   - Use commands that provide progress output when available
   - Consider breaking into smaller, verifiable steps
   - Use background execution with status checks for very long operations
   - Implement checkpoint verification to ensure progress is being made

5. **Error Detection**: When a command times out or is cancelled:
   - Examine any partial output for error indicators
   - Check system logs if applicable
   - Verify system state hasn't been left in an inconsistent condition
   - Propose next steps or alternative approaches

