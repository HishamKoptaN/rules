---
name: rules-responsive
description: Responsive design across laptop, tablet and mobile — adaptive layouts plus ScreenUtil spacing (.r/.w/.h/.sp) and the post-generation auto-fix pass
metadata:
  type: feedback
---

# Responsive Design Rules (Laptop / Tablet / Mobile)

Related: [[rules]], [[rules-dart-syntax]]

## Multi-Device Layout (ALWAYS)
Every screen MUST be designed and verified to work on **laptop (desktop-width), tablet, and mobile** — not mobile only.

- Build adaptive layouts, never a fixed mobile layout stretched on wide screens.
- Use `LayoutBuilder` / `MediaQuery.sizeOf(context)` breakpoints to switch layout, not device-type checks.
  - Mobile: `< 600` logical px — single column, bottom navigation.
  - Tablet: `600–1024` — 2 columns / master-detail, wider paddings.
  - Laptop: `> 1024` — multi-column with side navigation rail and a max content width.
- Constrain content width on wide screens (`.w` + `ConstrainedBox` / `Center`) instead of letting text and forms span the full width.
- Grids and lists MUST adapt their column count to the available width (e.g. `SliverGridDelegateWithMaxCrossAxisExtent`), never a hardcoded `crossAxisCount`.
- Never hardcode pixel widths/heights for containers that hold content; use flexible widgets (`Expanded`, `Flexible`, `Wrap`) and `.w` / `.h`.
- Text and touch targets MUST stay readable and tappable at every breakpoint (`.sp` for fonts, min 48 logical px targets).
- Verify no overflow (`RenderFlex overflowed`) and no clipped content in all three widths before reporting a UI task as done.

## ScreenUtil Spacing
- **ALWAYS combine Dot Shorthand with the ScreenUtil extension (`.r`, `.w`, `.h`, `.sp`)**.

## EdgeInsets & Padding
- DO: `padding: .all(24.r)`
- DO: `padding: .symmetric(horizontal: 16.w, vertical: 12.h)`
- DO: `padding: .only(top: 8.h, bottom: 16.h)`
- DONT: `padding: .all(24)` (without the responsive extension `.r`)
- DONT: `padding: EdgeInsets.all(24)`

## BorderRadius
- DO: `borderRadius: .circular(12.r)`
- DONT: `borderRadius: .circular(12)`

## Post-Generation Auto-Fix Rule
After generating or modifying any Dart file, automatically run a regex replacement/refactor pass to ensure:
1. Every `.all(X)`, `.symmetric(...)`, `.circular(X)` uses the `.r` extension (e.g., `.all(24.r)`).
2. No explicit `EdgeInsets.` or `BorderRadius.` static calls remain.