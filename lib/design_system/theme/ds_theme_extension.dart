// GENERATED FILE - DO NOT EDIT DIRECTLY
// Generated from Figma design tokens

import 'package:flutter/material.dart';

import '../colors/ds_colors.dart';
import '../shadows/ds_shadows.dart';
import '../spacing/ds_spacing.dart';
import '../radius/ds_radius.dart';
import '../typography/ds_typography.dart';

/// Design System Theme Extension
/// 
/// Provides access to all design system tokens through the BuildContext.
/// Use `context.ds` to access the design system tokens.
/// 
/// Example:
/// ```dart
/// Container(
///   color: context.ds.colors.bgPrimary,
///   padding: EdgeInsets.all(DSSpacing.md),
///   child: Text(
///     'Hello',
///     style: context.ds.typography.headingLarge,
///   ),
/// )
/// ```
class DSThemeExtension extends ThemeExtension<DSThemeExtension> {
  const DSThemeExtension({
    required this.colors,
    required this.shadows,
    required this.typography,
    required this.isDark,
  });

  /// The color palette for the current theme mode.
  final DSColorPalette colors;

  /// The shadow palette for the current theme mode.
  final DSShadowPalette shadows;

  /// The typography data for the current platform variant.
  final DSTypographyData typography;

  /// Whether the current theme is dark mode.
  final bool isDark;

  /// Light theme extension
  static DSThemeExtension get light => const DSThemeExtension(
        colors: DSColors.light,
        shadows: DSShadows.light,
        typography: DSTypography.mobile,
        isDark: false,
      );

  /// Dark theme extension
  static DSThemeExtension get dark => const DSThemeExtension(
        colors: DSColors.dark,
        shadows: DSShadows.dark,
        typography: DSTypography.mobile,
        isDark: true,
      );

  /// Creates a light theme extension with specified typography variant.
  static DSThemeExtension lightWith({
    DSTypographyData typography = DSTypography.mobile,
  }) =>
      DSThemeExtension(
        colors: DSColors.light,
        shadows: DSShadows.light,
        typography: typography,
        isDark: false,
      );

  /// Creates a dark theme extension with specified typography variant.
  static DSThemeExtension darkWith({
    DSTypographyData typography = DSTypography.mobile,
  }) =>
      DSThemeExtension(
        colors: DSColors.dark,
        shadows: DSShadows.dark,
        typography: typography,
        isDark: true,
      );

  @override
  DSThemeExtension copyWith({
    DSColorPalette? colors,
    DSShadowPalette? shadows,
    DSTypographyData? typography,
    bool? isDark,
  }) => DSThemeExtension(
      colors: colors ?? this.colors,
      shadows: shadows ?? this.shadows,
      typography: typography ?? this.typography,
      isDark: isDark ?? this.isDark,
    );

  @override
  DSThemeExtension lerp(covariant ThemeExtension<DSThemeExtension>? other, double t) {
    // For theme extensions, we typically just switch at t >= 0.5
    if (other is! DSThemeExtension) {
      return this;
    }
    return t < 0.5 ? this : other;
  }
}

/// Extension on BuildContext to easily access design system tokens.
extension DSThemeContext on BuildContext {
  /// Access the design system theme extension.
  /// 
  /// Usage:
  /// ```dart
  /// final colors = context.ds.colors;
  /// final typography = context.ds.typography;
  /// final shadows = context.ds.shadows;
  /// ```
  DSThemeExtension get ds {
    final extension = Theme.of(this).extension<DSThemeExtension>();
    if (extension == null) {
      throw FlutterError(
        'DSThemeExtension not found in the current theme.\n'
        'Make sure to add DSThemeExtension to your ThemeData:\n\n'
        'ThemeData(\n'
        '  extensions: [DSThemeExtension.light],\n'
        '  // ... other theme properties\n'
        ')',
      );
    }
    return extension;
  }

  /// Safely try to access the design system theme extension.
  /// Returns null if not found.
  DSThemeExtension? get dsOrNull => Theme.of(this).extension<DSThemeExtension>();
}
