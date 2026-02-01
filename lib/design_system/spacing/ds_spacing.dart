// GENERATED FILE - DO NOT EDIT DIRECTLY
// Generated from Figma design tokens
// Update token values here when Figma design tokens change

import 'package:flutter/material.dart';

/// Design System Spacing
/// 
/// Provides spacing tokens derived from Figma design tokens.
/// All spacing values are in logical pixels.
/// 
/// Token names are preserved exactly as they appear in Figma.
class DSSpacing {
  DSSpacing._();

  // Positive spacing tokens - spacing/*

  /// spacing/px - 1px
  static const double px = 1;

  /// spacing/pxpx - 2px
  static const double pxpx = 2;

  /// spacing/2xs - 4px
  static const double xs2 = 4;

  /// spacing/xs - 8px
  static const double xs = 8;

  /// spacing/sm - 12px
  static const double sm = 12;

  /// spacing/md - 16px
  static const double md = 16;

  /// spacing/lg - 20px
  static const double lg = 20;

  /// spacing/xl - 24px
  static const double xl = 24;

  /// spacing/2xl - 32px
  static const double xl2 = 32;

  /// spacing/3xl - 40px
  static const double xl3 = 40;

  /// spacing/4xl - 48px
  static const double xl4 = 48;

  /// spacing/5xl - 56px
  static const double xl5 = 56;

  /// spacing/6xl - 64px
  static const double xl6 = 64;

  /// spacing/7xl - 72px
  static const double xl7 = 72;

  /// spacing/8xl - 80px
  static const double xl8 = 80;

  // Negative spacing tokens - minus spacing/*

  /// minus spacing/-px - -1px
  static const double minusPx = -1;

  /// minus spacing/-pxpx - -2px
  static const double minusPxpx = -2;

  /// minus spacing/-2xs - -4px
  static const double minusXs2 = -4;

  /// minus spacing/-xs - -8px
  static const double minusXs = -8;

  /// minus spacing/-sm - -12px
  static const double minusSm = -12;

  /// minus spacing/-md - -16px
  static const double minusMd = -16;

  /// minus spacing/-lg - -20px
  static const double minusLg = -20;

  /// minus spacing/-xl - -24px
  static const double minusXl = -24;

  /// minus spacing/-2xl - -32px
  static const double minusXl2 = -32;

  /// minus spacing/-3xl - -40px
  static const double minusXl3 = -40;

  /// minus spacing/-4xl - -48px
  static const double minusXl4 = -48;

  /// minus spacing/-5xl - -56px
  static const double minusXl5 = -56;

  /// minus spacing/-6xl - -64px
  static const double minusXl6 = -64;

  /// minus spacing/-7xl - -72px
  static const double minusXl7 = -72;

  /// minus spacing/-8xl - -80px
  static const double minusXl8 = -80;

  /// All spacing values as a list (positive only)
  static const List<double> all = [
    px, pxpx, xs2, xs, sm, md, lg, xl, xl2, xl3, xl4, xl5, xl6, xl7, xl8,
  ];

  /// Get spacing value by Figma token name
  static double? byName(String name) => _tokenMap[name];

  static const Map<String, double> _tokenMap = {
    'spacing/px': px,
    'spacing/pxpx': pxpx,
    'spacing/2xs': xs2,
    'spacing/xs': xs,
    'spacing/sm': sm,
    'spacing/md': md,
    'spacing/lg': lg,
    'spacing/xl': xl,
    'spacing/2xl': xl2,
    'spacing/3xl': xl3,
    'spacing/4xl': xl4,
    'spacing/5xl': xl5,
    'spacing/6xl': xl6,
    'spacing/7xl': xl7,
    'spacing/8xl': xl8,
    'minus spacing/-px': minusPx,
    'minus spacing/-pxpx': minusPxpx,
    'minus spacing/-2xs': minusXs2,
    'minus spacing/-xs': minusXs,
    'minus spacing/-sm': minusSm,
    'minus spacing/-md': minusMd,
    'minus spacing/-lg': minusLg,
    'minus spacing/-xl': minusXl,
    'minus spacing/-2xl': minusXl2,
    'minus spacing/-3xl': minusXl3,
    'minus spacing/-4xl': minusXl4,
    'minus spacing/-5xl': minusXl5,
    'minus spacing/-6xl': minusXl6,
    'minus spacing/-7xl': minusXl7,
    'minus spacing/-8xl': minusXl8,
  };
}

/// Extension methods for creating EdgeInsets from spacing tokens.
extension DSSpacingEdgeInsets on double {
  /// Creates EdgeInsets with this value for all sides.
  EdgeInsets get all => EdgeInsets.all(this);

  /// Creates EdgeInsets with this value for horizontal sides only.
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this);

  /// Creates EdgeInsets with this value for vertical sides only.
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this);

  /// Creates EdgeInsets with this value for the left side only.
  EdgeInsets get left => EdgeInsets.only(left: this);

  /// Creates EdgeInsets with this value for the right side only.
  EdgeInsets get right => EdgeInsets.only(right: this);

  /// Creates EdgeInsets with this value for the top side only.
  EdgeInsets get top => EdgeInsets.only(top: this);

  /// Creates EdgeInsets with this value for the bottom side only.
  EdgeInsets get bottom => EdgeInsets.only(bottom: this);
}

/// Helper class for creating EdgeInsets using design system spacing tokens.
class DSEdgeInsets {
  DSEdgeInsets._();

  /// Creates EdgeInsets with the same spacing on all sides.
  static EdgeInsets all(double value) => EdgeInsets.all(value);

  /// Creates EdgeInsets with symmetric horizontal and vertical spacing.
  static EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  /// Creates EdgeInsets with individual spacing for each side.
  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);

  /// No spacing.
  static const EdgeInsets zero = EdgeInsets.zero;

  // Pre-defined common spacing combinations

  /// Horizontal md (16) padding
  static EdgeInsets get horizontalMd => const EdgeInsets.symmetric(horizontal: DSSpacing.md);

  /// Vertical md (16) padding
  static EdgeInsets get verticalMd => const EdgeInsets.symmetric(vertical: DSSpacing.md);

  /// All sides md (16) padding
  static EdgeInsets get allMd => const EdgeInsets.all(DSSpacing.md);

  /// Horizontal xl (24) padding
  static EdgeInsets get horizontalXl => const EdgeInsets.symmetric(horizontal: DSSpacing.xl);

  /// Vertical xl (24) padding
  static EdgeInsets get verticalXl => const EdgeInsets.symmetric(vertical: DSSpacing.xl);

  /// All sides xl (24) padding
  static EdgeInsets get allXl => const EdgeInsets.all(DSSpacing.xl);

  /// Page padding (horizontal xl, vertical md)
  static EdgeInsets get page => const EdgeInsets.symmetric(
        horizontal: DSSpacing.xl,
        vertical: DSSpacing.md,
      );

  /// Card padding (all md)
  static EdgeInsets get card => const EdgeInsets.all(DSSpacing.md);

  /// List item padding (horizontal md, vertical sm)
  static EdgeInsets get listItem => const EdgeInsets.symmetric(
        horizontal: DSSpacing.md,
        vertical: DSSpacing.sm,
      );
}
