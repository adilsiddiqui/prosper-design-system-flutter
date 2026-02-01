// GENERATED FILE - DO NOT EDIT DIRECTLY
// Generated from Figma design tokens
// Update token values here when Figma design tokens change

import 'package:flutter/material.dart';

/// Design System Border Radius
/// 
/// Provides radius tokens derived from Figma design tokens.
/// All radius values are in logical pixels.
/// 
/// Token names are preserved exactly as they appear in Figma.
class DSRadius {
  DSRadius._();

  /// radius/xl - 16px
  static const double xl = 16;

  /// radius/3xl - 24px
  static const double xl3 = 24;

  /// radius/full - 9999px (fully rounded / circular)
  static const double full = 9999;

  /// Get radius value by Figma token name
  static double? byName(String name) => _tokenMap[name];

  static const Map<String, double> _tokenMap = {
    'radius/xl': xl,
    'radius/3xl': xl3,
    'radius/full': full,
  };
}

/// Extension methods for creating BorderRadius from radius tokens.
extension DSRadiusBorderRadius on double {
  /// Creates BorderRadius.circular with this value.
  BorderRadius get circular => BorderRadius.circular(this);

  /// Creates Radius.circular with this value.
  Radius get radius => Radius.circular(this);

  /// Creates BorderRadius with this value for top corners only.
  BorderRadius get top => BorderRadius.only(
        topLeft: Radius.circular(this),
        topRight: Radius.circular(this),
      );

  /// Creates BorderRadius with this value for bottom corners only.
  BorderRadius get bottom => BorderRadius.only(
        bottomLeft: Radius.circular(this),
        bottomRight: Radius.circular(this),
      );

  /// Creates BorderRadius with this value for left corners only.
  BorderRadius get left => BorderRadius.only(
        topLeft: Radius.circular(this),
        bottomLeft: Radius.circular(this),
      );

  /// Creates BorderRadius with this value for right corners only.
  BorderRadius get right => BorderRadius.only(
        topRight: Radius.circular(this),
        bottomRight: Radius.circular(this),
      );
}

/// Helper class for creating BorderRadius using design system radius tokens.
class DSBorderRadius {
  DSBorderRadius._();

  /// No radius
  static const BorderRadius zero = BorderRadius.zero;

  /// radius/xl - 16px circular
  static BorderRadius get xl => BorderRadius.circular(DSRadius.xl);

  /// radius/3xl - 24px circular
  static BorderRadius get xl3 => BorderRadius.circular(DSRadius.xl3);

  /// radius/full - fully rounded
  static BorderRadius get full => BorderRadius.circular(DSRadius.full);

  /// Creates circular BorderRadius with the given value.
  static BorderRadius circular(double radius) => BorderRadius.circular(radius);

  /// Creates BorderRadius with different values for each corner.
  static BorderRadius only({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) =>
      BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      );
}
