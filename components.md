# Components, Forms & Action Logic Rules

## Form Input Component Rules
- For phone number input fields, ALWAYS use `CustomPhoneFormField` located at `@lib/core/widgets/forms/custom_phone_form_field.dart`.

## Iconography Rules
- **ALWAYS** use icons from `Fontawesome` or `lucide_icons_flutter` libraries.
- **TRY TO AVOID** using standard Material `Icons` (`Icons.xxx`) as much as possible.

## Action Button Activation & Modification Logic Rules
- **Action Button State:** Any action button inside the application (e.g., Save, Submit, Update) must be enabled **only** if it actually performs a new action or there is an actual difference/modification compared to original data.
- **Modification Checking Logic:** The logic to check whether there are modifications or not (`hasChanges`, etc.) **MUST** be implemented inside the **Domain layer** within the **Entity**.
