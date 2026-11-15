---
name: rules-theming
description: Zero hardcoded colors or text styles in widgets — all colors from Theme.of(context).colorScheme and all typography from Theme.of(context).textTheme
metadata:
  type: feedback
---

# Theme-Driven Styling Rules

Related: [[rules]], [[rules-dart-syntax]]

## ZERO HARDCODED STYLES & COLORS (STRICT RULE)
- **NEVER** use explicit colors via `Color(0xFF...)`, `Colors.green`, or `Colors.white` inside UI components.
- **NEVER** instantiate explicit text styles like `style: TextStyle(fontSize: ..., color: ..., fontWeight: ...)` directly in Widgets.
- **NEVER** hardcode font sizes, line heights, or text colors inside individual screens or widgets.

## Mandatory Theme Access
- **ALL Colors** MUST be pulled directly from `Theme.of(context).colorScheme`:
  - DO: `color: Theme.of(context).colorScheme.primary`
  - DO: `color: Theme.of(context).colorScheme.surface`
  - DONT: `color: const Color(0xFF006838)`
- **ALL Typography & Fonts** MUST be pulled directly from `Theme.of(context).textTheme`:
  - DO: `style: Theme.of(context).textTheme.titleMedium`
  - DO: `style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.primary)`
  - DONT: `style: TextStyle(color: Color(0xFF006838), fontSize: 11.sp)`

## Dot Shorthand Integration
- Combine theme access with dot shorthand where applicable:
  - DO: `padding: .all(16.r)` (see [[rules-responsive]])
  - DO: `color: Theme.of(context).colorScheme.primary`