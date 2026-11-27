---
name: rules-action-buttons
description: Action buttons stay disabled until real changes exist AND all required fields are valid; hasChanges and validation logic live in the domain-layer Entity
metadata:
  type: feedback
---

# Action Button Activation & Modification Logic Rules

Related: [[rules]], [[architecture]]

- **Action Button State:** Any action button inside the application (e.g., Save, Submit, Update) must be enabled **only** if it actually performs a new action or there is an actual difference/modification compared to the original data.
- **Modification Checking Logic:** The logic that checks whether there are modifications (`hasChanges`, etc.) **MUST** be implemented inside the **Domain layer** within the **Entity**.
- **Valid Input Required:** The same button must stay disabled unless **every required field holds a valid value** (via `formz` / `FormInput`) and all required data is present. Both conditions — real changes **and** valid input — apply together; one alone is not enough.
- **Validation Logic Location:** Validity checks (`isValid`, required-value checks) **MUST** live in the Domain layer (Entity / `FormInput`), and the UI only consumes a combined `canSubmit` / `isEnabled` state — it must not re-implement validation inside widgets.