# Prosper Design System

A comprehensive design token system for Flutter, generated from Figma.

## Overview

This design system provides a centralized, token-based approach to styling your Flutter application. All design values (colors, typography, spacing, shadows, icons) are derived from Figma design tokens, ensuring pixel-perfect consistency between design and implementation.

## Quick Start

### 1. Setup Theme

```dart
import 'package:your_app/design_system/design_system.dart';

void main() {
  runApp(
    MaterialApp(
      theme: DS.theme.light,
      darkTheme: DS.theme.dark,
      themeMode: ThemeMode.system,
      home: MyApp(),
    ),
  );
}
```

### 2. Use Tokens in Widgets

```dart
// Access tokens via context
Widget build(BuildContext context) {
  return Container(
    color: context.ds.colors.bgPrimary,
    padding: EdgeInsets.all(DS.space.md),
    child: Text(
      'Hello, World!',
      style: context.ds.typography.headingLarge,
    ),
  );
}
```

## Token Reference

### Colors

Access colors via `context.ds.colors` or `DS.colors(mode)`.

```dart
// Via context (respects current theme mode)
context.ds.colors.textPrimary
context.ds.colors.bgPrimary
context.ds.colors.borderPrimary

// Static access (specify mode)
DS.colors(DSThemeMode.light).textPrimary
DS.colors(DSThemeMode.dark).bgPrimary
```

**Available Color Tokens:**

| Category | Tokens |
|----------|--------|
| Text | `textPrimary`, `textSecondary`, `textTertiary`, `textDisabled`, `textActionPrimary`, `textActionSecondary` |
| Background | `bgPrimary`, `bgSecondary`, `bgTertiary`, `bgDisabled`, `bgActionPrimary`, `bgActionSecondary` |
| Border | `borderPrimary`, `borderSecondary`, `borderHighContrast`, `borderFocused`, `borderActionPrimary`, `borderActionHighContrast`, `borderMatchBackground` |
| Icon | `iconPrimary`, `iconActionPrimary`, `iconActionSecondary` |
| Brand | `directMutualFunds`, `regularMutualFunds`, `monthlyExpenses`, `excessBalance`, `insightsBg`, `insightsText`, `goalPlanningHighContrast`, `goalPlanningLowContrast` |
| Signal | `signalBgNegative*`, `signalBgWarning*`, `signalBgPositive*`, `signalBorder*`, `signalIcon*`, `signalText*` |
| Chart | `chartRedSeries1st-5th`, `chartYellowSeries1st-5th`, `chartBrownSeries1st-5th`, `chartLightGreenSeries1st-5th`, `chartGreenSeries1st-5th`, `chartBlueSeries1st-5th`, `chartPurpleSeries1st-5th`, `chartPinkSeries1st-5th`, `chartGraySeries1st-5th` |

### Typography

Access typography via `context.ds.typography` or `DS.type.*`.

```dart
// Via context
context.ds.typography.displayLarge
context.ds.typography.headingDefault
context.ds.typography.lineLargeMedium

// Static access
DS.type.mobile.displayLarge
DS.type.desktop.headingDefault  // Scaled for desktop
DS.type.deck.displayLarge       // Scaled for presentations
```

**Available Typography Tokens:**

| Category | Tokens |
|----------|--------|
| Display | `displayLarge`, `displayDefault`, `displaySmall` |
| Heading | `headingLarge`, `headingDefault`, `headingSmall` |
| Line Large | `lineLargeRegular`, `lineLargeMedium`, `lineLargeBold` |
| Para Large | `paraLargeRegular`, `paraLargeMedium`, `paraLargeBold` |
| Line Default | `lineDefaultRegular`, `lineDefaultMedium`, `lineDefaultBold` |
| Para Default | `paraDefaultRegular`, `paraDefaultMedium`, `paraDefaultBold` |
| Line Small | `lineSmallRegular`, `lineSmallMedium`, `lineSmallBold` |
| Para Small | `paraSmallRegular`, `paraSmallMedium`, `paraSmallBold` |
| Uppercase | `uppercaseDefault`, `uppercaseBold` |
| Disclaimer | `disclaimerDefault`, `disclaimerParaDefault`, `disclaimerSmall`, `disclaimerParaSmall` |
| Number | `numberLarge`, `numberDefault`, `numberSmall` |

### Spacing

Access spacing via `DS.space.*`.

```dart
EdgeInsets.all(DS.space.md)              // 16px all sides
EdgeInsets.symmetric(
  horizontal: DS.space.xl,                // 24px horizontal
  vertical: DS.space.sm,                  // 12px vertical
)

// Extension methods
DS.space.md.all          // EdgeInsets.all(16)
DS.space.xl.horizontal   // EdgeInsets.symmetric(horizontal: 24)
```

**Available Spacing Tokens:**

| Token | Value |
|-------|-------|
| `px` | 1px |
| `pxpx` | 2px |
| `xs2` | 4px |
| `xs` | 8px |
| `sm` | 12px |
| `md` | 16px |
| `lg` | 20px |
| `xl` | 24px |
| `xl2` | 32px |
| `xl3` | 40px |
| `xl4` | 48px |
| `xl5` | 56px |
| `xl6` | 64px |
| `xl7` | 72px |
| `xl8` | 80px |

### Radius

Access radius via `DS.radius.*` or `DSBorderRadius.*`.

```dart
BorderRadius.circular(DS.radius.xl)   // 16px
DSBorderRadius.xl                      // Pre-built BorderRadius
DSBorderRadius.full                    // Fully rounded

// Extension methods
DS.radius.xl.circular  // BorderRadius.circular(16)
DS.radius.xl.top       // BorderRadius only on top corners
```

**Available Radius Tokens:**

| Token | Value |
|-------|-------|
| `xl` | 16px |
| `xl3` | 24px |
| `full` | 9999px (circular) |

### Shadows

Access shadows via `context.ds.shadows` or `DS.shadows(mode)`.

```dart
Container(
  decoration: BoxDecoration(
    boxShadow: context.ds.shadows.shadow400,
  ),
)

// By level
context.ds.shadows.byLevel(DSShadowLevel.medium)
```

**Available Shadow Tokens:**

| Token | Level | Description |
|-------|-------|-------------|
| `shadow200` | Subtle | Light elevation |
| `shadow400` | Medium | Card elevation |
| `shadow500` | Elevated | Modal elevation |
| `shadow700` | High | Dropdown elevation |

### Icons

Access icons via `DSIcon` widget or `DS.icons.*`.

```dart
// Using DSIconData
DSIcon(DSIcons.check)
DSIcon(DSIcons.bell, size: DSIconSize.large)
DSIcon(DSIcons.archive, stroke: DSIconStroke.solid)

// Using string name
DSIcon.byName('check')

// Via DS entry point
DSIcon(DS.icons.check)

// With custom color
DSIcon(DSIcons.check, color: context.ds.colors.signalIconPositivePrimary)
```

**Icon Sizes:**

| Size | Pixels |
|------|--------|
| `small` | 16px |
| `medium` | 20px |
| `defaultSize` | 24px |
| `large` | 32px |

**Icon Strokes:**

| Stroke | Description |
|--------|-------------|
| `line` | Outline style (default) |
| `solid` | Filled style |

## File Structure

```
lib/design_system/
├── design_system.dart      # Barrel export
├── ds.dart                 # Main entry point (DS class)
├── colors/
│   └── ds_colors.dart      # Color tokens (light/dark)
├── typography/
│   └── ds_typography.dart  # Typography tokens
├── spacing/
│   └── ds_spacing.dart     # Spacing tokens
├── radius/
│   └── ds_radius.dart      # Radius tokens
├── shadows/
│   └── ds_shadows.dart     # Shadow tokens (light/dark)
├── icons/
│   ├── ds_icons.dart       # Icon registry
│   └── ds_icon_widget.dart # DSIcon widget
├── theme/
│   ├── ds_theme.dart       # ThemeData builders
│   └── ds_theme_extension.dart  # ThemeExtension
├── tokens/
│   └── token_names.dart    # Figma name mapping
└── README.md               # This file

assets/icons/
├── generic/
│   ├── line/               # Line-style generic icons
│   └── solid/              # Solid-style generic icons
└── brand/
    ├── line/               # Line-style brand icons
    └── solid/              # Solid-style brand icons
```

## Updating Tokens from Figma

When design tokens are updated in Figma, follow these steps:

### 1. Colors and Other Variables

1. Open the Figma file and navigate to the Variables panel
2. For each mode (Light/Dark), copy the updated values
3. Update the corresponding values in `lib/design_system/colors/ds_colors.dart`
4. Light mode values go in `DSColors.light`, dark mode in `DSColors.dark`

### 2. Typography

1. Check the typography frame in Figma for any changes
2. Update `lib/design_system/typography/ds_typography.dart`
3. Values to check: font size, line height, letter spacing, font weight

### 3. Spacing

1. Check spacing variables in Figma
2. Update `lib/design_system/spacing/ds_spacing.dart`

### 4. Shadows

1. Check shadow styles in Figma (separate for Light/Dark)
2. Update `lib/design_system/shadows/ds_shadows.dart`
3. Note: Each shadow level has multiple layers

### 5. Icons

To export icons from Figma:

1. Open the Figma file
2. Navigate to the icons frame
3. Select the icon components (use the default size variants)
4. Export as SVG:
   - Format: SVG
   - Include "id" attributes: No
   - Outline text: Yes
5. Save to the appropriate folder:
   - Generic line icons → `assets/icons/generic/line/`
   - Generic solid icons → `assets/icons/generic/solid/`
   - Brand icons → `assets/icons/brand/line/` or `brand/solid/`
6. File naming: Use the exact Figma layer name (e.g., `check-circle.svg`)

### Automated Sync (Future)

For automated token syncing, consider:
- Figma Tokens plugin with GitHub sync
- Custom script using Figma API
- Build-time code generation

## Token Name Fidelity

All token names are preserved exactly as they appear in Figma. For tokens with characters invalid in Dart identifiers, we provide:

```dart
// Get original Figma name from Dart identifier
DSTokenNames.getOriginalName('textPrimary');  // Returns '✦/text/primary'

// Get Dart identifier from Figma name
DSTokenNames.getDartSafeName('✦/text/primary');  // Returns 'textPrimary'
```

This ensures bidirectional mapping and single source of truth.

## Best Practices

### DO

- Use tokens for ALL styling values
- Access colors via `context.ds.colors` for theme-awareness
- Use `DS.space.*` for consistent spacing
- Use `DSIcon` for all icons
- Apply text colors via `.copyWith(color: ...)` on typography styles

### DON'T

- Hardcode color values (e.g., `Color(0xFF191919)`)
- Use magic numbers for spacing (e.g., `EdgeInsets.all(16)`)
- Mix token values with hardcoded values
- Bypass the design system for "one-off" styling

## Example Usage

```dart
import 'package:flutter/material.dart';
import 'package:your_app/design_system/design_system.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.title, required this.description});
  
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(DS.space.md),
      decoration: BoxDecoration(
        color: context.ds.colors.bgPrimary,
        borderRadius: DSBorderRadius.xl,
        boxShadow: context.ds.shadows.shadow400,
        border: Border.all(color: context.ds.colors.borderPrimary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              DSIcon(DSIcons.chart, color: context.ds.colors.iconPrimary),
              SizedBox(width: DS.space.sm),
              Text(
                title,
                style: context.ds.typography.lineLargeBold.copyWith(
                  color: context.ds.colors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: DS.space.xs),
          Text(
            description,
            style: context.ds.typography.paraDefaultRegular.copyWith(
              color: context.ds.colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
```

## Dependencies

- `flutter_svg: ^2.0.10+1` - For rendering SVG icons
- `flutter` SDK - Core framework

## Font Setup

The design system uses the Inter font family. Ensure the font files are added to `assets/fonts/`:

- `Inter-Regular.ttf` (weight: 400)
- `Inter-Medium.ttf` (weight: 500)
- `Inter-SemiBold.ttf` (weight: 600)

Download from: https://fonts.google.com/specimen/Inter
