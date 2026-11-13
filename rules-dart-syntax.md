---
name: rules-dart-syntax
description: Dart syntax style — always use block bodies instead of arrow bodies, and mandatory dot shorthand for enums, constructors and static members
metadata:
  type: feedback
---

# Dart Syntax Rules (Block Bodies & Dot Shorthand)

Related: [[rules]], [[rules-theming]], [[rules-responsive]]

## Use Block Bodies (`Convert to block body`)
- Always prefer full block bodies `{ return ...; }` for methods, functions, and widget builders.
- Avoid arrow syntax / expression bodies (`=>`) whenever possible, even for single-line statements or return expressions.

## Convert to Dot Shorthand
- **Mandatory Conversion:** Any line or piece of code that accepts conversion to dot shorthand (enums, constructors, static properties such as `MainAxisSize.min` -> `.min`, `MainAxisAlignment.center` -> `.center`, `EdgeInsets.all` -> `.all`, `BorderRadius.circular` -> `.circular`) MUST be converted using dot shorthand syntax (`Convert to dot shorthand`).
- Whenever a quick fix or language construct supports dot shorthand, it must be applied across all codebase files.