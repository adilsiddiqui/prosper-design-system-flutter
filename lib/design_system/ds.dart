import 'package:flutter/material.dart';

import 'colors/ds_colors.dart';
import 'icons/ds_icons.dart';
import 'radius/ds_radius.dart';
import 'shadows/ds_shadows.dart';
import 'spacing/ds_spacing.dart';
import 'theme/ds_theme.dart';
import 'theme/ds_theme_extension.dart';
import 'typography/ds_typography.dart';

/// Design System Entry Point
/// 
/// Provides a centralized access point to all design system tokens and utilities.
/// Uses ONLY design system values - no fallbacks.
/// 
/// Usage:
/// ```dart
/// // Static access (mode-agnostic)
/// DS.space.md           // 16.0
/// DS.radius.xl          // 16.0
/// DS.type.mobile        // DSTypographyData
/// DS.icons.check        // DSIconData
/// 
/// // Mode-specific colors
/// DS.colors(DSThemeMode.light).textPrimary
/// DS.colors(DSThemeMode.dark).bgPrimary
/// 
/// // Theme access via context
/// context.ds.colors.textPrimary
/// context.ds.typography.headingLarge
/// ```
class DS {
  DS._();

  // ===== STATIC TOKEN ACCESS =====

  /// Spacing tokens
  static const DSSpacingTokens space = DSSpacingTokens._();

  /// Radius tokens
  static const DSRadiusTokens radius = DSRadiusTokens._();

  /// Typography tokens
  static const DSTypographyTokens type = DSTypographyTokens._();

  /// Icon tokens
  static const DSIconTokens icons = DSIconTokens._();

  /// Theme utilities
  static const DSThemeTokens theme = DSThemeTokens._();

  /// Get colors for a specific theme mode.
  static DSColorPalette colors(DSThemeMode mode) {
    switch (mode) {
      case DSThemeMode.light:
        return DSColors.light;
      case DSThemeMode.dark:
        return DSColors.dark;
      case DSThemeMode.system:
        return DSColors.light;
    }
  }

  /// Get shadows for a specific theme mode.
  static DSShadowPalette shadows(DSThemeMode mode) {
    switch (mode) {
      case DSThemeMode.light:
        return DSShadows.light;
      case DSThemeMode.dark:
        return DSShadows.dark;
      case DSThemeMode.system:
        return DSShadows.light;
    }
  }

  /// Get the appropriate ThemeData for a theme mode.
  static ThemeData themeData(DSThemeMode mode) {
    switch (mode) {
      case DSThemeMode.light:
        return DSTheme.light;
      case DSThemeMode.dark:
        return DSTheme.dark;
      case DSThemeMode.system:
        return DSTheme.light;
    }
  }
}

/// Spacing token accessor
class DSSpacingTokens {
  const DSSpacingTokens._();

  /// 1px
  double get px => DSSpacing.px;

  /// 2px
  double get pxpx => DSSpacing.pxpx;

  /// 4px
  double get xs2 => DSSpacing.xs2;

  /// 8px
  double get xs => DSSpacing.xs;

  /// 12px
  double get sm => DSSpacing.sm;

  /// 16px
  double get md => DSSpacing.md;

  /// 20px
  double get lg => DSSpacing.lg;

  /// 24px
  double get xl => DSSpacing.xl;

  /// 32px
  double get xl2 => DSSpacing.xl2;

  /// 40px
  double get xl3 => DSSpacing.xl3;

  /// 48px
  double get xl4 => DSSpacing.xl4;

  /// 56px
  double get xl5 => DSSpacing.xl5;

  /// 64px
  double get xl6 => DSSpacing.xl6;

  /// 72px
  double get xl7 => DSSpacing.xl7;

  /// 80px
  double get xl8 => DSSpacing.xl8;
}

/// Radius token accessor
class DSRadiusTokens {
  const DSRadiusTokens._();

  /// 16px
  double get xl => DSRadius.xl;

  /// 24px
  double get xl3 => DSRadius.xl3;

  /// Fully rounded (9999px)
  double get full => DSRadius.full;

  /// Creates circular BorderRadius
  BorderRadius circular(double radius) => BorderRadius.circular(radius);
}

/// Typography token accessor
class DSTypographyTokens {
  const DSTypographyTokens._();

  /// Mobile typography (default)
  DSTypographyData get mobile => DSTypography.mobile;

  /// Desktop typography (scaled up)
  DSTypographyData get desktop => DSTypography.desktop;

  /// Deck/Presentation typography (scaled up more)
  DSTypographyData get deck => DSTypography.deck;

  /// Font family
  String get fontFamily => DSTypography.fontFamily;
}

/// Icon token accessor
/// Icons will be populated when exported from Figma
class DSIconTokens {
  const DSIconTokens._();

  /// Get icon by name
  DSIconData? byName(String name) => DSIcons.byName(name);

  /// All registered icons
  List<DSIconData> get all => DSIcons.all;

  /// Icons with both line and solid variants
  List<DSIconData> get withBothVariants => DSIcons.iconsWithBothVariants;
}

/// Theme utilities accessor
class DSThemeTokens {
  const DSThemeTokens._();

  /// Light theme data
  ThemeData get light => DSTheme.light;

  /// Dark theme data
  ThemeData get dark => DSTheme.dark;

  /// Light theme extension
  DSThemeExtension get lightExtension => DSThemeExtension.light;

  /// Dark theme extension
  DSThemeExtension get darkExtension => DSThemeExtension.dark;

  /// Create light theme with custom typography
  ThemeData lightWith({DSTypographyData? typography}) =>
      DSTheme.lightWith(typography: typography ?? DSTypography.mobile);

  /// Create dark theme with custom typography
  ThemeData darkWith({DSTypographyData? typography}) =>
      DSTheme.darkWith(typography: typography ?? DSTypography.mobile);
}
