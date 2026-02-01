// GENERATED FILE - DO NOT EDIT DIRECTLY
// Generated from Figma design tokens
// Update token values here when Figma design tokens change

import 'package:flutter/material.dart';

/// Design System Shadows
/// 
/// Provides shadow tokens derived from Figma design tokens.
/// Each shadow level can have multiple layers.
/// 
/// Token names are preserved exactly as they appear in Figma.
class DSShadows {
  DSShadows._();

  /// Light mode shadow palette
  static const DSShadowPalette light = DSShadowPalette(
    // shadows with border/200
    shadow200: [
      BoxShadow(
        color: Color(0x2E000000), // #0000002e
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0x1A000000), // #0000001a
        offset: Offset(0, 1),
        blurRadius: 3,
      ),
      BoxShadow(
        color: Color(0x1A000000), // #0000001a
        offset: Offset(0, 3),
        blurRadius: 8,
      ),
    ],

    // shadows with border/400
    shadow400: [
      BoxShadow(
        color: Color(0x26000000), // #00000026
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0x1A000000), // #0000001a
        offset: Offset(0, 1),
        blurRadius: 3,
      ),
      BoxShadow(
        color: Color(0x21000000), // #00000021
        offset: Offset(0, 5),
        blurRadius: 12,
      ),
    ],

    // shadows with border/500
    shadow500: [
      BoxShadow(
        color: Color(0x1F000000), // #0000001f
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0x26000000), // #00000026
        offset: Offset(0, 2),
        blurRadius: 5,
      ),
      BoxShadow(
        color: Color(0x1F000000), // #0000001f
        offset: Offset(0, 10),
        blurRadius: 16,
      ),
    ],

    // shadows with border/700
    shadow700: [
      BoxShadow(
        color: Color(0x14000000), // #00000014
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0x26000000), // #00000026
        offset: Offset(0, 2),
        blurRadius: 5,
      ),
      BoxShadow(
        color: Color(0x0D000000), // #0000000d
        offset: Offset(0, 3),
        blurRadius: 12,
      ),
      BoxShadow(
        color: Color(0x2E000000), // #0000002e
        offset: Offset(0, 10),
        blurRadius: 24,
      ),
    ],
  );

  /// Dark mode shadow palette
  static const DSShadowPalette dark = DSShadowPalette(
    // shadows with border/200
    shadow200: [
      BoxShadow(
        color: Color(0x80000000), // #00000080
        offset: Offset(0, 1),
        blurRadius: 3,
      ),
      BoxShadow(
        color: Color(0x59000000), // #00000059
        offset: Offset(0, 3),
        blurRadius: 8,
      ),
    ],

    // shadows with border/400
    shadow400: [
      BoxShadow(
        color: Color(0x59000000), // #00000059
        offset: Offset(0, 5),
        blurRadius: 12,
      ),
      BoxShadow(
        color: Color(0x80000000), // #00000080
        offset: Offset(0, 1),
        blurRadius: 3,
      ),
    ],

    // shadows with border/500
    shadow500: [
      BoxShadow(
        color: Color(0x59000000), // #00000059
        offset: Offset(0, 10),
        blurRadius: 16,
      ),
      BoxShadow(
        color: Color(0x59000000), // #00000059
        offset: Offset(0, 2),
        blurRadius: 5,
      ),
    ],

    // shadows with border/700
    shadow700: [
      BoxShadow(
        color: Color(0x73000000), // #00000073
        offset: Offset(0, 10),
        blurRadius: 24,
      ),
      BoxShadow(
        color: Color(0x59000000), // #00000059
        offset: Offset(0, 3),
        blurRadius: 5,
      ),
    ],
  );
}

/// Immutable shadow palette class containing all design system shadows.
class DSShadowPalette {
  const DSShadowPalette({
    required this.shadow200,
    required this.shadow400,
    required this.shadow500,
    required this.shadow700,
  });

  /// shadows with border/200 - Subtle elevation
  final List<BoxShadow> shadow200;

  /// shadows with border/400 - Medium elevation
  final List<BoxShadow> shadow400;

  /// shadows with border/500 - Elevated
  final List<BoxShadow> shadow500;

  /// shadows with border/700 - High elevation
  final List<BoxShadow> shadow700;

  /// Get shadow by elevation level.
  /// Accepts values: 200, 400, 500, 700
  List<BoxShadow> byLevel(int level) {
    switch (level) {
      case 200:
        return shadow200;
      case 400:
        return shadow400;
      case 500:
        return shadow500;
      case 700:
        return shadow700;
      default:
        throw ArgumentError('Invalid shadow level: $level. Valid levels are: 200, 400, 500, 700');
    }
  }

  /// Get shadow by Figma token name
  List<BoxShadow>? byName(String name) {
    switch (name) {
      case 'shadows with border/200':
        return shadow200;
      case 'shadows with border/400':
        return shadow400;
      case 'shadows with border/500':
        return shadow500;
      case 'shadows with border/700':
        return shadow700;
      default:
        return null;
    }
  }
}

/// Shadow elevation levels as constants
class DSShadowLevel {
  DSShadowLevel._();

  /// Subtle elevation (200)
  static const int subtle = 200;

  /// Medium elevation (400)
  static const int medium = 400;

  /// Elevated (500)
  static const int elevated = 500;

  /// High elevation (700)
  static const int high = 700;
}
