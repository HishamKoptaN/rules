---
name: suggestions
description: Post-task suggestions must be interactive clickable actions that are executed immediately when selected
metadata:
  type: feedback
---

## Post-Task Suggestions Rule
At the end of every completed task or response, you MUST provide 2 to 3 concise, highly relevant follow-up action suggestions for the next logical steps.

## Interactive Buttons (Mandatory)
- ALWAYS deliver the suggestions through the interactive question/choices tool so they render as clickable buttons — never as plain markdown bullet points.
- Each option MUST be a direct executable action phrased from the user's perspective (e.g. "Merge PR #30", "Deploy dev", "Add a regression check").
- As soon as the user clicks an option, EXECUTE it immediately: do not ask for a second confirmation and do not merely explain the steps.
- If the chosen action needs another decision, present the next set of options with the same interactive tool.
- Standing git rules still apply: only offer merge or destructive actions when already authorized by the user or by the rules.

## Style
- Keep options short so the user can quickly tap them on mobile without typing.
- Prefer concrete actions over vague ideas ("Run the widget tests" rather than "Consider testing").
