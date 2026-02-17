# Prosper Design System (Flutter)

This repo includes the Cursor skill **prosper-design-system-flutter** for token-based Flutter UI from Figma.

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Design System

This project uses the **Prosper Design System**: a token-based Flutter design system aligned with Figma, with full light and dark theme support. All UI styling (colors, typography, spacing, radius, shadows, icons) goes through design tokens. For the full token reference, usage examples, and file structure, see [lib/design_system/README.md](lib/design_system/README.md).

### Using this design system in another project

You can use the Prosper Design System and its Cursor skill in other Flutter apps so that implementing Figma designs uses tokens instead of hardcoded values. The Cursor skill name is **prosper-design-system-flutter**; copy the skill folder to `.cursor/skills/prosper-design-system-flutter/` in your project.

1. **Cursor skill** — Copy the skill into your project so Cursor uses it when implementing UI from Figma:
   - Copy [.cursor/skills/prosper-design-system-flutter/](.cursor/skills/prosper-design-system-flutter/) into your repo as `.cursor/skills/prosper-design-system-flutter/`, or
   - Copy the contents of the [skill/](skill/) folder into your project as `.cursor/skills/prosper-design-system-flutter/`.
2. **Flutter dependency** — Add the design system package to your app’s `pubspec.yaml`:
   ```yaml
   dependencies:
     prosper_design_system:
       git:
         url: https://github.com/<your-org>/ClaudeDesignSystem.git
     flutter_svg: ^2.0.10+1
   ```
   Replace the `url` with your fork or the repo that contains this package (package is at repo root).
3. **App setup** — In your app, use `MaterialApp(theme: DS.theme.light, darkTheme: DS.theme.dark, ...)` and add the Inter font assets. See [lib/design_system/README.md](lib/design_system/README.md) for fonts and assets.

When implementing from Figma, use the Prosper Design System skill in Cursor so the agent applies token-based styling and Figma name mapping (`DSTokenNames`).
