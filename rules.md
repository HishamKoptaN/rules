---
name: rules
description: Index of the Flutter/Dart code style rulebook — each concern lives in its own memory file (stack packages, BLoC, Dart syntax, theming, responsive spacing, components, action buttons, file structure)
metadata:
  type: feedback
---

# Flutter & Dart Code Style Rules — Index

Each rule group is maintained in its own file:

- [[rules-packages]] — permanent package stack, in-house git packages, dev dependencies, and banned libraries.
- [[rules-bloc]] — BLoC part directives, structure, and GetIt dispatching.
- [[rules-dart-syntax]] — block bodies and mandatory dot shorthand.
- [[rules-theming]] — zero hardcoded colors/styles; theme-driven colors and typography.
- [[rules-responsive]] — adaptive layouts for laptop/tablet/mobile, ScreenUtil spacing (`.r`, `.w`, `.h`, `.sp`), and the post-generation auto-fix pass.
- [[rules-components]] — phone form field and icon library choices.
- [[rules-action-buttons]] — action button activation and domain-layer `hasChanges` logic.
- [[rules-file-structure]] — 100-line file limit and the 4-file folder modularization threshold.
- [[rules-git-granularity]] — max 150 lines per commit, 350-400 lines per PR, and large features auto-splitting.

Related: [[architecture]], [[git-workflow]], [[rules-git-granularity]], [[rules-packages]]