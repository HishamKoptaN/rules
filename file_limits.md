# File Complexity & Size Limits

## File Length Limit
- Any single Dart file MUST NOT exceed 100 lines of code. If a file grows beyond 100 lines, it must be proactively refactored, split into smaller, cohesive widgets, or delegated to helper classes.

## Automatic Folder Modularization (The 4-File Threshold)
- **Trigger:** Whenever a directory contains more than **4 files** or small modular components, do not keep adding files to the same flat directory.
- **Action:** Automatically refactor and categorize the components into dedicated sub-directories based on their specific domain, feature, or technical responsibility.
- **Directory Structure Standard:**
  - `features/` or domain folders for business features.
  - `widgets/` or UI subfolders for isolated user interface components.
  - `models/` or `entities/` for data structures.
  - `blocs/` or `providers/` for state management.
- **Rule Enforcement:** Always ensure proper barrel files (`export ...`) are updated or created if necessary to keep import statements clean after reorganization.
