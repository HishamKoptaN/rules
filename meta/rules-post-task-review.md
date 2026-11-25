---
name: rules-post-task-review
description: Post-task project review — after every task, the agent must run the project checks (e.g., flutter analyze) and fix any errors before considering the task complete
metadata:
  type: feedback
---

## Post-Task Project Review Rule
After completing any task requested from the agent, the agent MUST review the project to ensure there are no issues. For Flutter projects this means running `flutter analyze` (and equivalent checks for other stacks) and confirming the code is free of errors and warnings.

- If the analysis reports any errors or warnings, the agent MUST fix them before considering the task complete.
- This review must be performed after every task, even small ones, and its result must be reported to the user (e.g., "flutter analyze: no issues found").
- Do not declare a task finished while unresolved analyzer errors remain.
