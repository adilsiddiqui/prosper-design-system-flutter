# Prosper Design System — Cursor Skill

This skill teaches Cursor (and developers) to implement Flutter UI from Figma using the **Prosper Design System**: a token-based design system with Figma naming fidelity. All styling uses design tokens—no hardcoded colors, spacing, or typography.

## What this skill does

- Ensures UI is built with `context.ds.colors`, `context.ds.typography`, `DS.space.*`, `DSRadius.*`, `context.ds.shadows`, and `DSIcon(DSIcons.*)` instead of magic numbers or hardcoded colors.
- Provides a **Figma implementation workflow**: map Figma styles to tokens, use `DSTokenNames.getDartSafeName(figmaName)` to resolve Figma token names to Dart identifiers, and map common components (cards, buttons, status chips) to token-based widgets.
- Includes a validation checklist so the agent verifies token-only styling and theme-aware behavior before finishing.

## How to use this skill in Cursor

1. **Copy this folder** into your project’s Cursor skills directory:
   - Copy `.cursor/skills/prosper-design-system-flutter/` (this folder) into your repo as `.cursor/skills/prosper-design-system-flutter/`.
2. Alternatively, if you use the **standalone export**: copy the contents of the repo’s `skill/` folder (at the repository root) into your project as `.cursor/skills/prosper-design-system-flutter/`.

Cursor will then have access to the skill when you (or the agent) are implementing UI from Figma or working with design tokens.

## How to add the design system package to your Flutter app

Add the Prosper Design System as a **git dependency** in your app’s `pubspec.yaml`:

```yaml
dependencies:
  prosper_design_system:
    git:
      url: https://github.com/<your-org>/<repo>.git
  flutter_svg: ^2.0.10+1  # required by the package
```

Replace `<your-org>/<repo>` with the actual GitHub repo URL that contains the `prosper_design_system` package (e.g. the same repo that contains this skill).

Then in your app:

1. **Theme:** Use `MaterialApp(theme: DS.theme.light, darkTheme: DS.theme.dark, ...)` so `context.ds` is available.
2. **Fonts:** The package uses **Inter**. Add Inter font assets to your app (see the main repo or [lib/design_system/README.md](../../lib/design_system/README.md) in the package repo for paths and weights).
3. **Icons:** If you use icons, ensure the package’s icon assets are available (the package may expect assets under `packages/prosper_design_system/assets/icons/` when used as a dependency; see the main repo README).

**Import in your code:**

```dart
import 'package:prosper_design_system/design_system/design_system.dart';
```

## Links

- **Full token reference and setup:** See the design system README in the package repo: `lib/design_system/README.md`.
- **Main repo:** The repository that contains both this skill and the Flutter package (see root README for “Using this design system in another project”).
