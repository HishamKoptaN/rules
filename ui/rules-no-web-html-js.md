---
name: rules-no-web-html-js
description: In Flutter projects, never build pages or code as HTML/JavaScript inside the web/ folder — implement them in Flutter/Dart instead
metadata:
  type: feedback
---

# No HTML/JS Pages Inside `web/` (Flutter-Dart Only)

Related: [[rules]], [[rules-components]], [[rules-responsive]]

## Rule
- In Flutter projects, **anything** that would otherwise be built as a page or as code using web technologies (HTML / CSS / JavaScript) is **FORBIDDEN** to be created inside the `web/` directory — no custom HTML views, JS-driven pages, hand-written feature screens, or iframe-based pages shipped as static web assets.
- Always **attempt to build it with Flutter/Dart code instead** (widgets, screens, painters, animations, platform channels / plugins), within the normal Flutter layering and theming.
- The `web/` folder is reserved for the Flutter-web bootstrap scaffold only (`index.html`, `manifest.json`, favicon/icons, meta tags). It must not contain hand-written feature pages or application code.
- Even on web builds, the UI must come from the Flutter engine (CanvasKit / HTML renderer), never from parallel HTML/JS implementations.

## Why
- Keeps every page implemented, themed, responsive and testable through one Flutter codebase instead of hidden "web islands" inside a Flutter app.
- Avoids duplicate logic, inconsistent theming, and unmaintainable JS/HTML drift.

## Allowed Exceptions
- Editing the default Flutter web scaffold is allowed: `web/index.html` meta tags, title, favicon, PWA `manifest.json`, and host rewrites/config for deployment.
- A browser-only capability with no Flutter/Dart equivalent (e.g. a third-party JS SDK) may be used only through a Dart abstraction (`dart:js_interop`, `package:web`, or a plugin) — never as standalone HTML/JS pages inside `web/`.
