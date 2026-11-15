---
name: rules-action-buttons
description: Action buttons (Save/Submit/Update) stay disabled until real changes exist, and the hasChanges logic lives in the domain-layer Entity
metadata:
  type: feedback
---

# Action Button Activation & Modification Logic Rules

Related: [[rules]], [[architecture]]

- **Action Button State:** Any action button inside the application (e.g., Save, Submit, Update) must be enabled **only** if it actually performs a new action or there is an actual difference/modification compared to the original data.
- **Modification Checking Logic:** The logic that checks whether there are modifications (`hasChanges`, etc.) **MUST** be implemented inside the **Domain layer** within the **Entity**.