---
name: suggestions
description: Interactive suggestions — post-task actions execute on click; pre-execution fix/feature options are chosen then approved before execution
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
- Never offer PR creation as a suggestion — pull requests are created automatically on push; see [[rules-pull-requests]].

## Style
- Keep options short so the user can quickly tap them on mobile without typing.
- Prefer concrete actions over vague ideas ("Run the widget tests" rather than "Consider testing").

## Pre-Execution Suggestions (Fix / Implementation)
When the user asks what to fix, change, or build — or whenever you propose a plan before touching code — you MUST NOT start implementing and MUST NOT send a plain markdown bullet list.

- Present 2–4 concrete options through the interactive question/choices tool so they render as selectable buttons.
- Each option MUST be a self-contained executable change with a short scope label (e.g. "Fix signup crash", "Unify entity types", "Enable login validation").
- If there is a clear best next step, mark it as recommended by appending "(Recommended)" / "(موصى به)" to its label. The tool's automatic "Type your own answer" option is enough — do not add it manually.
- After the user selects an option, ask for explicit approval with the same interactive tool: short choices such as "ابدأ التنفيذ" / "اختر خيارًا آخر".
- EXECUTE ONLY after that approval. The first selection is a choice, not permission to write code.
- This extra approval applies only to pre-execution suggestions. Post-task suggestions above still execute immediately on click.
- If the approved option is large, split it into 2–4 smaller options and repeat selection → approval before each atomic step.
- Keep [[rules-git-granularity]] intact: one branch per approved option and commits of at most 150 lines.
- Implement exactly the approved option; do not add unrelated improvements after approval.

## Style for Pre-Execution Options
- Lead with the smallest safe step and put the recommended option first.
- Use Arabic labels when the user writes in Arabic; keep them short enough for mobile taps.
- Describe the outcome, not the file list ("Fix duplicate signup user" rather than "Edit AuthController").
