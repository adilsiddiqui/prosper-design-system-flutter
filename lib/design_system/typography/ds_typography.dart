// GENERATED FILE - DO NOT EDIT DIRECTLY
// Generated from Figma design tokens
// Update token values here when Figma design tokens change

import 'package:flutter/material.dart';

/// Design System Typography
/// 
/// Provides typography tokens derived from Figma design tokens.
/// All text styles use the Inter font family.
/// 
/// Token names are preserved exactly as they appear in Figma.
/// The typography system supports Mobile, Desktop, and Deck variants.
class DSTypography {
  DSTypography._();

  /// Font family used across all typography tokens
  static const String fontFamily = 'Inter';

  /// Mobile typography (default)
  static const DSTypographyData mobile = DSTypographyData(
    // Display styles - Display/*
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 40,
      fontWeight: FontWeight.w600,
      height: 1.2, // 48/40
      letterSpacing: -1,
    ),
    displayDefault: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 1.25, // 40/32
      letterSpacing: -0.8,
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 1.25, // 40/32
      letterSpacing: -0.8,
    ),

    // Heading styles - Heading/*
    headingLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 28,
      fontWeight: FontWeight.w600,
      height: 1.143, // 32/28
      letterSpacing: -0.7,
    ),
    headingDefault: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 1.333, // 32/24
      letterSpacing: -0.48,
    ),
    headingSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1.2, // 24/20
      letterSpacing: -0.4,
    ),

    // Line Large styles - Line Large/*
    lineLargeRegular: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 1.333, // 24/18
      letterSpacing: -0.27,
    ),
    lineLargeMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.333, // 24/18
      letterSpacing: -0.27,
    ),
    lineLargeBold: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.333, // 24/18
      letterSpacing: -0.27,
    ),

    // Para Large styles - Para Large/*
    paraLargeRegular: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 1.556, // 28/18
      letterSpacing: -0.27,
    ),
    paraLargeMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.556, // 28/18
      letterSpacing: -0.27,
    ),
    paraLargeBold: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.556, // 28/18
      letterSpacing: -0.27,
    ),

    // Line Default styles - Line Default/*
    lineDefaultRegular: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.25, // 20/16
      letterSpacing: -0.24,
    ),
    lineDefaultMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.25, // 20/16
      letterSpacing: -0.24,
    ),
    lineDefaultBold: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.25, // 20/16
      letterSpacing: -0.24,
    ),

    // Para Default styles - Para Default/*
    paraDefaultRegular: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5, // 24/16
      letterSpacing: -0.24,
    ),
    paraDefaultMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5, // 24/16
      letterSpacing: -0.24,
    ),
    paraDefaultBold: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.5, // 24/16
      letterSpacing: -0.24,
    ),

    // Line Small styles - Line Small/*
    lineSmallRegular: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.143, // 16/14
      letterSpacing: -0.14,
    ),
    lineSmallMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.143, // 16/14
      letterSpacing: -0.14,
    ),
    lineSmallBold: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.143, // 16/14
      letterSpacing: -0.14,
    ),

    // Para Small styles - Para Small/*
    paraSmallRegular: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.429, // 20/14
      letterSpacing: -0.14,
    ),
    paraSmallMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.429, // 20/14
      letterSpacing: -0.14,
    ),
    paraSmallBold: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.429, // 20/14
      letterSpacing: -0.14,
    ),

    // Uppercase styles - Uppercase/*
    uppercaseDefault: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.333, // 16/12
      letterSpacing: 0.6,
    ),
    uppercaseBold: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.333, // 16/12
      letterSpacing: 0.6,
    ),

    // Disclaimer styles - Disclaimer/*
    disclaimerDefault: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.333, // 16/12
      letterSpacing: 0,
    ),
    disclaimerParaDefault: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.667, // 20/12
      letterSpacing: 0,
    ),
    disclaimerSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 1.2, // 12/10
      letterSpacing: 0.1,
    ),
    disclaimerParaSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 1.6, // 16/10
      letterSpacing: 0.1,
    ),

    // Number styles - Number/*
    numberLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 40,
      fontWeight: FontWeight.w600,
      height: 1.2, // 48/40
      letterSpacing: -1,
    ),
    numberDefault: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 1.25, // 40/32
      letterSpacing: -0.8,
    ),
    numberSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 1.333, // 32/24
      letterSpacing: -0.48,
    ),
  );

  /// Desktop typography (scaled up for larger screens)
  static DSTypographyData get desktop => mobile.scale(1.1);

  /// Deck/Presentation typography (scaled up for presentations)
  static DSTypographyData get deck => mobile.scale(1.25);
}

/// Immutable typography data class containing all text styles.
class DSTypographyData {
  const DSTypographyData({
    // Display
    required this.displayLarge,
    required this.displayDefault,
    required this.displaySmall,
    // Heading
    required this.headingLarge,
    required this.headingDefault,
    required this.headingSmall,
    // Line Large
    required this.lineLargeRegular,
    required this.lineLargeMedium,
    required this.lineLargeBold,
    // Para Large
    required this.paraLargeRegular,
    required this.paraLargeMedium,
    required this.paraLargeBold,
    // Line Default
    required this.lineDefaultRegular,
    required this.lineDefaultMedium,
    required this.lineDefaultBold,
    // Para Default
    required this.paraDefaultRegular,
    required this.paraDefaultMedium,
    required this.paraDefaultBold,
    // Line Small
    required this.lineSmallRegular,
    required this.lineSmallMedium,
    required this.lineSmallBold,
    // Para Small
    required this.paraSmallRegular,
    required this.paraSmallMedium,
    required this.paraSmallBold,
    // Uppercase
    required this.uppercaseDefault,
    required this.uppercaseBold,
    // Disclaimer
    required this.disclaimerDefault,
    required this.disclaimerParaDefault,
    required this.disclaimerSmall,
    required this.disclaimerParaSmall,
    // Number
    required this.numberLarge,
    required this.numberDefault,
    required this.numberSmall,
  });

  // Display styles
  final TextStyle displayLarge;
  final TextStyle displayDefault;
  final TextStyle displaySmall;

  // Heading styles
  final TextStyle headingLarge;
  final TextStyle headingDefault;
  final TextStyle headingSmall;

  // Line Large styles
  final TextStyle lineLargeRegular;
  final TextStyle lineLargeMedium;
  final TextStyle lineLargeBold;

  // Para Large styles
  final TextStyle paraLargeRegular;
  final TextStyle paraLargeMedium;
  final TextStyle paraLargeBold;

  // Line Default styles
  final TextStyle lineDefaultRegular;
  final TextStyle lineDefaultMedium;
  final TextStyle lineDefaultBold;

  // Para Default styles
  final TextStyle paraDefaultRegular;
  final TextStyle paraDefaultMedium;
  final TextStyle paraDefaultBold;

  // Line Small styles
  final TextStyle lineSmallRegular;
  final TextStyle lineSmallMedium;
  final TextStyle lineSmallBold;

  // Para Small styles
  final TextStyle paraSmallRegular;
  final TextStyle paraSmallMedium;
  final TextStyle paraSmallBold;

  // Uppercase styles
  final TextStyle uppercaseDefault;
  final TextStyle uppercaseBold;

  // Disclaimer styles
  final TextStyle disclaimerDefault;
  final TextStyle disclaimerParaDefault;
  final TextStyle disclaimerSmall;
  final TextStyle disclaimerParaSmall;

  // Number styles
  final TextStyle numberLarge;
  final TextStyle numberDefault;
  final TextStyle numberSmall;

  /// Creates a copy of this typography data with all font sizes scaled by the given factor.
  DSTypographyData scale(double factor) {
    TextStyle scaleStyle(TextStyle style) => style.copyWith(
        fontSize: (style.fontSize ?? 14) * factor,
      );

    return DSTypographyData(
      displayLarge: scaleStyle(displayLarge),
      displayDefault: scaleStyle(displayDefault),
      displaySmall: scaleStyle(displaySmall),
      headingLarge: scaleStyle(headingLarge),
      headingDefault: scaleStyle(headingDefault),
      headingSmall: scaleStyle(headingSmall),
      lineLargeRegular: scaleStyle(lineLargeRegular),
      lineLargeMedium: scaleStyle(lineLargeMedium),
      lineLargeBold: scaleStyle(lineLargeBold),
      paraLargeRegular: scaleStyle(paraLargeRegular),
      paraLargeMedium: scaleStyle(paraLargeMedium),
      paraLargeBold: scaleStyle(paraLargeBold),
      lineDefaultRegular: scaleStyle(lineDefaultRegular),
      lineDefaultMedium: scaleStyle(lineDefaultMedium),
      lineDefaultBold: scaleStyle(lineDefaultBold),
      paraDefaultRegular: scaleStyle(paraDefaultRegular),
      paraDefaultMedium: scaleStyle(paraDefaultMedium),
      paraDefaultBold: scaleStyle(paraDefaultBold),
      lineSmallRegular: scaleStyle(lineSmallRegular),
      lineSmallMedium: scaleStyle(lineSmallMedium),
      lineSmallBold: scaleStyle(lineSmallBold),
      paraSmallRegular: scaleStyle(paraSmallRegular),
      paraSmallMedium: scaleStyle(paraSmallMedium),
      paraSmallBold: scaleStyle(paraSmallBold),
      uppercaseDefault: scaleStyle(uppercaseDefault),
      uppercaseBold: scaleStyle(uppercaseBold),
      disclaimerDefault: scaleStyle(disclaimerDefault),
      disclaimerParaDefault: scaleStyle(disclaimerParaDefault),
      disclaimerSmall: scaleStyle(disclaimerSmall),
      disclaimerParaSmall: scaleStyle(disclaimerParaSmall),
      numberLarge: scaleStyle(numberLarge),
      numberDefault: scaleStyle(numberDefault),
      numberSmall: scaleStyle(numberSmall),
    );
  }

  /// Applies a color to all text styles.
  DSTypographyData withColor(Color color) {
    TextStyle applyColor(TextStyle style) => style.copyWith(color: color);

    return DSTypographyData(
      displayLarge: applyColor(displayLarge),
      displayDefault: applyColor(displayDefault),
      displaySmall: applyColor(displaySmall),
      headingLarge: applyColor(headingLarge),
      headingDefault: applyColor(headingDefault),
      headingSmall: applyColor(headingSmall),
      lineLargeRegular: applyColor(lineLargeRegular),
      lineLargeMedium: applyColor(lineLargeMedium),
      lineLargeBold: applyColor(lineLargeBold),
      paraLargeRegular: applyColor(paraLargeRegular),
      paraLargeMedium: applyColor(paraLargeMedium),
      paraLargeBold: applyColor(paraLargeBold),
      lineDefaultRegular: applyColor(lineDefaultRegular),
      lineDefaultMedium: applyColor(lineDefaultMedium),
      lineDefaultBold: applyColor(lineDefaultBold),
      paraDefaultRegular: applyColor(paraDefaultRegular),
      paraDefaultMedium: applyColor(paraDefaultMedium),
      paraDefaultBold: applyColor(paraDefaultBold),
      lineSmallRegular: applyColor(lineSmallRegular),
      lineSmallMedium: applyColor(lineSmallMedium),
      lineSmallBold: applyColor(lineSmallBold),
      paraSmallRegular: applyColor(paraSmallRegular),
      paraSmallMedium: applyColor(paraSmallMedium),
      paraSmallBold: applyColor(paraSmallBold),
      uppercaseDefault: applyColor(uppercaseDefault),
      uppercaseBold: applyColor(uppercaseBold),
      disclaimerDefault: applyColor(disclaimerDefault),
      disclaimerParaDefault: applyColor(disclaimerParaDefault),
      disclaimerSmall: applyColor(disclaimerSmall),
      disclaimerParaSmall: applyColor(disclaimerParaSmall),
      numberLarge: applyColor(numberLarge),
      numberDefault: applyColor(numberDefault),
      numberSmall: applyColor(numberSmall),
    );
  }
}
