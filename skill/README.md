# Prosper Design System — Cursor Skill (standalone export)

Copy the contents of this folder to your project as **`.cursor/skills/prosper-design-system-flutter/`** to use the Prosper Design System (Flutter) skill in Cursor when implementing Figma designs.

The skill ensures the agent uses design tokens (colors, typography, spacing, radius, shadows, icons) instead of hardcoded values and maps Figma styles to tokens via `DSTokenNames`.

## Steps

1. **Copy this folder** into your repo:
   - Create `.cursor/skills/prosper-design-system-flutter/` in your project.
   - Copy `SKILL.md` (and this README if you like) into it.

2. **Add the Flutter package** to your app’s `pubspec.yaml`:
   - See the main repository README: **"Using this design system in another project"** for the `prosper_design_system` git dependency and theme setup.

3. When implementing UI from Figma, the Cursor agent will use this skill to apply token-based styling and the Figma implementation workflow.

**Main repo:** The repository that contains this skill and the `prosper_design_system` package. See its root README for the full "Using this design system in another project" section and link to `lib/design_system/README.md` for the complete token reference.
