---
name: prosper-design-system-flutter
description: Prosper Design System (Flutter) with Figma-aligned tokens. Use when implementing UI from Figma, building Flutter screens from designs, or when the user mentions design tokens, Figma, or Prosper Design System. Ensures all styling uses design tokens—no hardcoded colors, spacing, or typography.
---

# Prosper Design System

A token-based Flutter design system with Figma naming fidelity. All styling MUST use design tokens—no hardcoded values. Use this skill when implementing any Figma design so the agent maps design styles to tokens correctly.

## Core Principle

```
❌ NEVER: Color(0xFF191919), fontSize: 16, padding: EdgeInsets.all(16)
✅ ALWAYS: context.ds.colors.textPrimary, context.ds.typography.lineDefaultMedium, DSSpacing.md
```

## Package Import

All tokens live in the `prosper_design_system` package. In apps that depend on it:

```dart
import 'package:prosper_design_system/design_system/design_system.dart';
```

## Theme Setup

```dart
MaterialApp(
  theme: DS.theme.light,
  darkTheme: DS.theme.dark,
  themeMode: ThemeMode.system,
  // ...
)
```

The package themes already include `DSThemeExtension`, so `context.ds` is available in any widget under this `MaterialApp`.

## Quick Reference

### Accessing Tokens

```dart
// Via BuildContext (theme-aware - PREFERRED)
context.ds.colors.textPrimary
context.ds.typography.headingLarge
context.ds.shadows.shadow200

// Via DS class (static access)
DS.space.md
DS.radius.xl
DS.colors(DSThemeMode.dark).bgPrimary
```

---

## Figma Implementation Workflow

When implementing UI from Figma:

1. **Map Figma styles to design system tokens.** Match Figma style names to token names:
   - Figma "text/primary" or "✦/text/primary" → `context.ds.colors.textPrimary`
   - Figma "bg/primary" → `context.ds.colors.bgPrimary`
   - Figma "spacing/md" → `DSSpacing.md` or `DS.space.md`
   - Figma "radius/xl" → `DS.radius.xl` or `DSRadius.xl.circular`
   - Figma "Display/Large" → `context.ds.typography.displayLarge`

2. **Resolve Figma token names to Dart identifiers.** Use `DSTokenNames` from the package:
   - `DSTokenNames.getDartSafeName('✦/text/primary')` → `'textPrimary'` (use with `context.ds.colors.textPrimary`)
   - `DSTokenNames.getOriginalName('textPrimary')` → `'✦/text/primary'` (for reverse lookup)

3. **Map Figma components to token-based widgets:**
   - Cards: `bgSecondary` or `bgPrimary`, `DSRadius.xl.circular`, `context.ds.shadows.shadow200`, padding `DSEdgeInsets.card` or `DSSpacing.md.all`
   - Primary buttons: `bgActionPrimary`, `textActionPrimary`, `DSRadius.xl`
   - Status chips: `signalBgPositivePrimary` / `signalTextPositive` for success; `signalBgNegativePrimary` / `signalTextNegative` for error; `DSRadius.full.circular`
   - Dividers: `context.ds.colors.borderPrimary`
   - Icons: always `DSIcon(DSIcons.<name>)` with `context.ds.colors.iconPrimary` (or signal colors) for color

4. **Never hardcode values from Figma.** If a Figma frame uses "16px padding", use `DSSpacing.md` (16), not `EdgeInsets.all(16)`. If a color is "#191919", use `context.ds.colors.textPrimary` (or the correct semantic token), not `Color(0xFF191919)`.

---

## Token Categories

### Colors (100+ tokens)

Access: `context.ds.colors.<token>` or `DS.colors(mode).<token>`

| Category | Tokens | Purpose |
|----------|--------|---------|
| **Text** | `textPrimary`, `textSecondary`, `textTertiary`, `textDisabled` | All typography |
| **Background** | `bgPrimary`, `bgSecondary`, `bgTertiary`, `bgDisabled` | Surfaces |
| **Border** | `borderPrimary`, `borderSecondary`, `borderHighContrast` | Edges, dividers |
| **Icon** | `iconPrimary`, `iconActionPrimary` | Icon coloring |
| **Signal** | `signalTextPositive`, `signalTextNegative`, `signalTextWarning` | Status |
| **Chart** | `chartGreenSeries1st`...`5th` (9 palettes) | Data visualization |
| **Brand** | `insightsBg`, `insightsText`, `directMutualFunds` | Product-specific |

**Key values (Light / Dark):** `textPrimary` #191919 / #FCFEFF · `bgPrimary` #FFFFFF / #101112 · `signalTextPositive` #23625E / #4EB3A9 · `signalTextNegative` #AB2626 / #FF5757

### Typography (27 styles)

Access: `context.ds.typography.<style>`. Font: **Inter**; weights 400, 500, 600.

| Style | Size | Weight | Use For |
|-------|------|--------|---------|
| `displayLarge` | 40px | 600 | Hero numbers |
| `displayDefault` | 32px | 600 | Page titles |
| `headingLarge` | 28px | 600 | Section titles |
| `headingDefault` | 24px | 600 | Card titles |
| `headingSmall` | 20px | 600 | Subsections |
| `lineLargeRegular/Medium/Bold` | 18px | 400/500/600 | Single-line content |
| `lineDefaultRegular/Medium/Bold` | 16px | 400/500/600 | Body text |
| `lineSmallRegular/Medium/Bold` | 14px | 400/500/600 | Secondary text |
| `paraLarge/Default/Small*` | 18/16/14px | 400/500/600 | Paragraphs |
| `uppercaseDefault/Bold` | 12px | 500/600 | Labels, tags |
| `disclaimerDefault/Small` | 12/10px | 500 | Fine print |
| `numberLarge/Default/Small` | 40/32/24px | 600 | Financial figures |

### Spacing (15 tokens)

Access: `DS.space.<token>` or `DSSpacing.<token>`

| Token | Value | Token | Value |
|-------|-------|-------|-------|
| `px` | 1px | `md` | 16px |
| `pxpx` | 2px | `lg` | 20px |
| `xs2` | 4px | `xl` | 24px |
| `xs` | 8px | `xl2`–`xl8` | 32–80px |
| `sm` | 12px | | |

**Helpers:** `DSSpacing.md.all`, `DSSpacing.xl.horizontal`, `DSEdgeInsets.page`, `DSEdgeInsets.card`

### Radius (3 tokens)

Access: `DS.radius.<token>` or `DSRadius.<token>`

| Token | Value | Use |
|-------|-------|-----|
| `xl` | 16px | Cards, buttons, inputs |
| `xl3` | 24px | Large cards, modals |
| `full` | 9999px | Pills, avatars |

**Helper:** `DSRadius.xl.circular`, `DSRadius.xl3.top`

### Shadows (4 levels)

Access: `context.ds.shadows.<level>`

| Level | Use For |
|-------|---------|
| `shadow200` | Subtle elevation (cards) |
| `shadow400` | Medium elevation (dropdowns) |
| `shadow500` | Elevated (modals) |
| `shadow700` | High elevation (dialogs) |

### Icons (292 icons)

Access: `DSIcon(DSIcons.<name>)`. Line (default) and solid variants; sizes via `DSIconSize`, color via `context.ds.colors.iconPrimary` or signal colors.

---

## Implementation Patterns

### Standard Widget

```dart
Container(
  padding: DSSpacing.md.all,
  margin: DSSpacing.xs.vertical,
  decoration: BoxDecoration(
    color: context.ds.colors.bgSecondary,
    borderRadius: DSRadius.xl.circular,
    border: Border.all(color: context.ds.colors.borderPrimary),
  ),
  child: Text(
    'Content',
    style: context.ds.typography.lineDefaultMedium.copyWith(
      color: context.ds.colors.textPrimary,
    ),
  ),
)
```

### Card with Shadow

```dart
Container(
  padding: DSEdgeInsets.card,
  decoration: BoxDecoration(
    color: context.ds.colors.bgPrimary,
    borderRadius: DSRadius.xl.circular,
    boxShadow: context.ds.shadows.shadow200,
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Title', style: context.ds.typography.headingSmall),
      SizedBox(height: DSSpacing.xs),
      Text('Description', style: context.ds.typography.lineSmallRegular),
    ],
  ),
)
```

### Status Indicator

```dart
Container(
  padding: EdgeInsets.symmetric(
    horizontal: DSSpacing.sm,
    vertical: DSSpacing.xs2,
  ),
  decoration: BoxDecoration(
    color: context.ds.colors.signalBgPositivePrimary,
    borderRadius: DSRadius.full.circular,
  ),
  child: Text(
    '+12.5%',
    style: context.ds.typography.lineSmallBold.copyWith(
      color: context.ds.colors.signalTextPositive,
    ),
  ),
)
```

---

## Validation Checklist

Before completing any UI work, verify:

- [ ] **No hardcoded colors** — All colors use `context.ds.colors.<token>`
- [ ] **No hardcoded sizes** — All spacing uses `DSSpacing.<token>` or `DS.space.<token>`
- [ ] **No hardcoded fonts** — All text uses `context.ds.typography.<style>`
- [ ] **No hardcoded radius** — All corners use `DSRadius.<token>` or `DS.radius.<token>`
- [ ] **Icons from library** — All icons use `DSIcon(DSIcons.<name>)`
- [ ] **Theme-aware** — Widget renders correctly in both light and dark modes

---

## Package Files (reference)

When the app depends on `package:prosper_design_system`, token sources are:

- **Colors:** `design_system/colors/ds_colors.dart`
- **Typography:** `design_system/typography/ds_typography.dart`
- **Spacing:** `design_system/spacing/ds_spacing.dart`
- **Radius:** `design_system/radius/ds_radius.dart`
- **Shadows:** `design_system/shadows/ds_shadows.dart`
- **Icons:** `design_system/icons/ds_icons.dart`, `design_system/icons/ds_icon_widget.dart`
- **Theme:** `design_system/theme/ds_theme.dart`, `design_system/theme/ds_theme_extension.dart`
- **Figma name mapping:** `design_system/tokens/token_names.dart` (`DSTokenNames`)

For the full token list and setup (fonts, assets), see the design system README in the package or repo (`lib/design_system/README.md`).
