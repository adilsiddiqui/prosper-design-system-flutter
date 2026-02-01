// GENERATED FILE - DO NOT EDIT DIRECTLY
// Generated from Figma design tokens
// Update token values here when Figma design tokens change

import 'package:flutter/material.dart';
import 'package:prosper_design_system/design_system/design_system.dart' show DSTokenNames;
import 'package:prosper_design_system/design_system/tokens/token_names.dart' show DSTokenNames;

/// Design System Colors
/// 
/// Provides color tokens for both light and dark modes.
/// All color values are derived from Figma design tokens.
/// 
/// Token names are preserved exactly as they appear in Figma.
/// See [DSTokenNames] for the mapping between Figma names and Dart identifiers.
class DSColors {
  DSColors._();

  /// Light mode color palette
  static const DSColorPalette light = DSColorPalette(
    // Text colors - ✦/text/*
    textPrimary: Color(0xFF191919),
    textSecondary: Color(0xFF3D3D3D),
    textTertiary: Color(0xFF636363),
    textDisabled: Color(0xFFA9A9A9),
    textActionPrimary: Color(0xFFFFFFFF),
    textActionSecondary: Color(0xFFD9D9D9),

    // Background colors - ✦/bg/*
    bgPrimary: Color(0xFFFFFFFF),
    bgSecondary: Color(0xFFF7F7F7),
    bgTertiary: Color(0xFFE8E8E8),
    bgDisabled: Color(0xFFD9D9D9),
    bgActionPrimary: Color(0xFF191919),
    bgActionSecondary: Color(0xFF3D3D3D),

    // Border colors - ✦/border/*
    borderPrimary: Color(0xFFE8E8E8),
    borderSecondary: Color(0xFFC4C4C4),
    borderHighContrast: Color(0xFF888888),
    borderFocused: Color(0xFF636363),
    borderActionPrimary: Color(0xFF3D3D3D),
    borderActionHighContrast: Color(0xFF636363),
    borderMatchBackground: Color(0xFFFFFFFF),

    // Icon colors - ✦/icon/*
    iconPrimary: Color(0xFF191919),
    iconActionPrimary: Color(0xFFFFFFFF),
    iconActionSecondary: Color(0xFFD9D9D9),

    // Brand colors - 🎨/*
    directMutualFunds: Color(0xFFA9C982),
    regularMutualFunds: Color(0xFFA4ADF2),
    monthlyExpenses: Color(0xFFE58733),
    excessBalance: Color(0xFF8B834F),
    insightsBg: Color(0xFFCDE0B7),
    insightsText: Color(0xFF688546),
    goalPlanningHighContrast: Color(0xFF8B834F),
    goalPlanningLowContrast: Color(0xFFE4DEBD),

    // Always colors - 🚨/main/*
    mainAlwaysWhite: Color(0xFFFFFFFF),
    mainAlwaysBlack: Color(0xFF191919),
    alphaOverlay: Color(0x80191919),
    alphaPrimary0: Color(0x00FFFFFF),
    alphaInverted0: Color(0x00191919),

    // State colors - 🚨/states/*
    statesHoverPrimary: Color(0x0D000000),
    statesPressedPrimary: Color(0x1A000000),
    statesHoverInverted: Color(0x0DFFFFFF),
    statesPressedInverted: Color(0x1AFFFFFF),

    // Chart Red - 📊/red/*
    chartRedSeries1st: Color(0xFF8C2222),
    chartRedSeries2nd: Color(0xFFCF3030),
    chartRedSeries3rd: Color(0xFFFF5757),
    chartRedSeries4th: Color(0xFFFF9898),
    chartRedSeries5th: Color(0xFFFFC1C1),

    // Chart Yellow - 📊/yellow/*
    chartYellowSeries1st: Color(0xFF8D411F),
    chartYellowSeries2nd: Color(0xFFD56921),
    chartYellowSeries3rd: Color(0xFFE99E4E),
    chartYellowSeries4th: Color(0xFFF0C181),
    chartYellowSeries5th: Color(0xFFF6DAB2),

    // Chart Brown - 📊/brown/*
    chartBrownSeries1st: Color(0xFF5E3F35),
    chartBrownSeries2nd: Color(0xFF8A5E44),
    chartBrownSeries3rd: Color(0xFFB0885F),
    chartBrownSeries4th: Color(0xFFC2A582),
    chartBrownSeries5th: Color(0xFFD8C7B0),

    // Chart Light Green - 📊/lightGreen/*
    chartLightGreenSeries1st: Color(0xFF3B5321),
    chartLightGreenSeries2nd: Color(0xFF578026),
    chartLightGreenSeries3rd: Color(0xFF96C655),
    chartLightGreenSeries4th: Color(0xFFB3D87E),
    chartLightGreenSeries5th: Color(0xFFD2E8AE),

    // Chart Green - 📊/green/*
    chartGreenSeries1st: Color(0xFF204F4D),
    chartGreenSeries2nd: Color(0xFF277A74),
    chartGreenSeries3rd: Color(0xFF4EB3A9),
    chartGreenSeries4th: Color(0xFF79CFC3),
    chartGreenSeries5th: Color(0xFFABE4DA),

    // Chart Blue - 📊/blue/*
    chartBlueSeries1st: Color(0xFF084A84),
    chartBlueSeries2nd: Color(0xFF046BC5),
    chartBlueSeries3rd: Color(0xFF3AA5F6),
    chartBlueSeries4th: Color(0xFF7EC3FB),
    chartBlueSeries5th: Color(0xFFBBDEFC),

    // Chart Purple - 📊/purple/*
    chartPurpleSeries1st: Color(0xFF503D96),
    chartPurpleSeries2nd: Color(0xFF7258D3),
    chartPurpleSeries3rd: Color(0xFF908AEA),
    chartPurpleSeries4th: Color(0xFFAFB0F2),
    chartPurpleSeries5th: Color(0xFFCDCFF8),

    // Chart Pink - 📊/pink/*
    chartPinkSeries1st: Color(0xFF81335F),
    chartPinkSeries2nd: Color(0xFFB54D8C),
    chartPinkSeries3rd: Color(0xFFD37DB8),
    chartPinkSeries4th: Color(0xFFE8B9DB),
    chartPinkSeries5th: Color(0xFFF2D8EB),

    // Chart Gray - 📊/gray/*
    chartGraySeries1st: Color(0xFF454545),
    chartGraySeries2nd: Color(0xFF5D5D5D),
    chartGraySeries3rd: Color(0xFF888888),
    chartGraySeries4th: Color(0xFFB0B0B0),
    chartGraySeries5th: Color(0xFFD1D1D1),

    // Signal Background - 🚦/bg/*
    signalBgNegativePrimary: Color(0xFFFFEAEA),
    signalBgNegativeSecondary: Color(0xFFFFC1C1),
    signalBgWarningPrimary: Color(0xFFFBEED9),
    signalBgWarningSecondary: Color(0xFFF6DAB2),
    signalBgPositivePrimary: Color(0xFFD5F2ED),
    signalBgPositiveSecondary: Color(0xFFABE4DA),

    // Signal Border - 🚦/border/*
    signalBorderNegative: Color(0xFFFF9898),
    signalBorderWarning: Color(0xFFF0C181),
    signalBorderPositive: Color(0xFF79CFC3),

    // Signal Icon - 🚦/icon/*
    signalIconNegativePrimary: Color(0xFFAB2626),
    signalIconNegativeSecondary: Color(0xFFFF5757),
    signalIconWarningPrimary: Color(0xFFB1511D),
    signalIconWarningSecondary: Color(0xFFE99E4E),
    signalIconPositivePrimary: Color(0xFF23625E),
    signalIconPositiveSecondary: Color(0xFF3AA99F),

    // Signal Text - 🚦/text/*
    signalTextNegative: Color(0xFFAB2626),
    signalTextWarning: Color(0xFFB1511D),
    signalTextPositive: Color(0xFF23625E),
  );

  /// Dark mode color palette
  static const DSColorPalette dark = DSColorPalette(
    // Text colors - ✦/text/*
    textPrimary: Color(0xFFFCFEFF),
    textSecondary: Color(0xFFD5D8DA),
    textTertiary: Color(0xFFACB0B3),
    textDisabled: Color(0xFF63676A),
    textActionPrimary: Color(0xFF101112),
    textActionSecondary: Color(0xFF343739),

    // Background colors - ✦/bg/*
    bgPrimary: Color(0xFF101112),
    bgSecondary: Color(0xFF1B1D1E),
    bgTertiary: Color(0xFF26282A),
    bgDisabled: Color(0xFF343739),
    bgActionPrimary: Color(0xFFFCFEFF),
    bgActionSecondary: Color(0xFFD5D8DA),

    // Border colors - ✦/border/*
    borderPrimary: Color(0xFF26282A),
    borderSecondary: Color(0xFF494C4F),
    borderHighContrast: Color(0xFF85898D),
    borderFocused: Color(0xFFACB0B3),
    borderActionPrimary: Color(0xFFD5D8DA),
    borderActionHighContrast: Color(0xFFACB0B3),
    borderMatchBackground: Color(0xFF101112),

    // Icon colors - ✦/icon/*
    iconPrimary: Color(0xFFFCFEFF),
    iconActionPrimary: Color(0xFF101112),
    iconActionSecondary: Color(0xFF343739),

    // Brand colors - 🎨/*
    directMutualFunds: Color(0xFF93BC63),
    regularMutualFunds: Color(0xFF8D98EF),
    monthlyExpenses: Color(0xFFE99E4E),
    excessBalance: Color(0xFFD0C68C),
    insightsBg: Color(0xFF18240F),
    insightsText: Color(0xFF93BC63),
    goalPlanningHighContrast: Color(0xFFE4DEBD),
    goalPlanningLowContrast: Color(0xFF8B834F),

    // Always colors - 🚨/main/*
    mainAlwaysWhite: Color(0xFFFCFEFF),
    mainAlwaysBlack: Color(0xFF101112),
    alphaOverlay: Color(0x8063676A),
    alphaPrimary0: Color(0x00101112),
    alphaInverted0: Color(0x00FCFEFF),

    // State colors - 🚨/states/*
    statesHoverPrimary: Color(0x0DFFFFFF),
    statesPressedPrimary: Color(0x1AFFFFFF),
    statesHoverInverted: Color(0x0D000000),
    statesPressedInverted: Color(0x1A000000),

    // Chart Red - 📊/red/* (inverted order for dark mode)
    chartRedSeries1st: Color(0xFFFFC1C1),
    chartRedSeries2nd: Color(0xFFFF9898),
    chartRedSeries3rd: Color(0xFFFF5757),
    chartRedSeries4th: Color(0xFFCF3030),
    chartRedSeries5th: Color(0xFF8C2222),

    // Chart Yellow - 📊/yellow/*
    chartYellowSeries1st: Color(0xFFF6DAB2),
    chartYellowSeries2nd: Color(0xFFF0C181),
    chartYellowSeries3rd: Color(0xFFE99E4E),
    chartYellowSeries4th: Color(0xFFD56921),
    chartYellowSeries5th: Color(0xFF8D411F),

    // Chart Brown - 📊/brown/*
    chartBrownSeries1st: Color(0xFFD8C7B0),
    chartBrownSeries2nd: Color(0xFFC2A582),
    chartBrownSeries3rd: Color(0xFFB0885F),
    chartBrownSeries4th: Color(0xFF8A5E44),
    chartBrownSeries5th: Color(0xFF5E3F35),

    // Chart Light Green - 📊/lightGreen/*
    chartLightGreenSeries1st: Color(0xFFD2E8AE),
    chartLightGreenSeries2nd: Color(0xFFB3D87E),
    chartLightGreenSeries3rd: Color(0xFF96C655),
    chartLightGreenSeries4th: Color(0xFF578026),
    chartLightGreenSeries5th: Color(0xFF3B5321),

    // Chart Green - 📊/green/*
    chartGreenSeries1st: Color(0xFFABE4DA),
    chartGreenSeries2nd: Color(0xFF79CFC3),
    chartGreenSeries3rd: Color(0xFF4EB3A9),
    chartGreenSeries4th: Color(0xFF277A74),
    chartGreenSeries5th: Color(0xFF204F4D),

    // Chart Blue - 📊/blue/*
    chartBlueSeries1st: Color(0xFFBBDEFC),
    chartBlueSeries2nd: Color(0xFF7EC3FB),
    chartBlueSeries3rd: Color(0xFF3AA5F6),
    chartBlueSeries4th: Color(0xFF046BC5),
    chartBlueSeries5th: Color(0xFF084A84),

    // Chart Purple - 📊/purple/*
    chartPurpleSeries1st: Color(0xFFCDCFF8),
    chartPurpleSeries2nd: Color(0xFFAFB0F2),
    chartPurpleSeries3rd: Color(0xFF908AEA),
    chartPurpleSeries4th: Color(0xFF7258D3),
    chartPurpleSeries5th: Color(0xFF503D96),

    // Chart Pink - 📊/pink/*
    chartPinkSeries1st: Color(0xFFF2D8EB),
    chartPinkSeries2nd: Color(0xFFE8B9DB),
    chartPinkSeries3rd: Color(0xFFD37DB8),
    chartPinkSeries4th: Color(0xFFB54D8C),
    chartPinkSeries5th: Color(0xFF81335F),

    // Chart Gray - 📊/gray/*
    chartGraySeries1st: Color(0xFFD1D1D1),
    chartGraySeries2nd: Color(0xFFB0B0B0),
    chartGraySeries3rd: Color(0xFF888888),
    chartGraySeries4th: Color(0xFF5D5D5D),
    chartGraySeries5th: Color(0xFF454545),

    // Signal Background - 🚦/bg/*
    signalBgNegativePrimary: Color(0xFF3B0C0C),
    signalBgNegativeSecondary: Color(0xFF742525),
    signalBgWarningPrimary: Color(0xFF3D1A0D),
    signalBgWarningSecondary: Color(0xFF72371C),
    signalBgPositivePrimary: Color(0xFF0C2727),
    signalBgPositiveSecondary: Color(0xFF204F4D),

    // Signal Border - 🚦/border/*
    signalBorderNegative: Color(0xFF742525),
    signalBorderWarning: Color(0xFF72371C),
    signalBorderPositive: Color(0xFF204F4D),

    // Signal Icon - 🚦/icon/*
    signalIconNegativePrimary: Color(0xFFFF5757),
    signalIconNegativeSecondary: Color(0xFFCF3030),
    signalIconWarningPrimary: Color(0xFFE99E4E),
    signalIconWarningSecondary: Color(0xFFE58733),
    signalIconPositivePrimary: Color(0xFF4EB3A9),
    signalIconPositiveSecondary: Color(0xFF277A74),

    // Signal Text - 🚦/text/*
    signalTextNegative: Color(0xFFFF5757),
    signalTextWarning: Color(0xFFE99E4E),
    signalTextPositive: Color(0xFF4EB3A9),
  );
}

/// Immutable color palette class containing all design system colors.
/// 
/// This class holds all color tokens for a specific theme mode (light/dark).
class DSColorPalette {
  const DSColorPalette({
    // Text colors
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.textActionPrimary,
    required this.textActionSecondary,

    // Background colors
    required this.bgPrimary,
    required this.bgSecondary,
    required this.bgTertiary,
    required this.bgDisabled,
    required this.bgActionPrimary,
    required this.bgActionSecondary,

    // Border colors
    required this.borderPrimary,
    required this.borderSecondary,
    required this.borderHighContrast,
    required this.borderFocused,
    required this.borderActionPrimary,
    required this.borderActionHighContrast,
    required this.borderMatchBackground,

    // Icon colors
    required this.iconPrimary,
    required this.iconActionPrimary,
    required this.iconActionSecondary,

    // Brand colors
    required this.directMutualFunds,
    required this.regularMutualFunds,
    required this.monthlyExpenses,
    required this.excessBalance,
    required this.insightsBg,
    required this.insightsText,
    required this.goalPlanningHighContrast,
    required this.goalPlanningLowContrast,

    // Always colors
    required this.mainAlwaysWhite,
    required this.mainAlwaysBlack,
    required this.alphaOverlay,
    required this.alphaPrimary0,
    required this.alphaInverted0,

    // State colors
    required this.statesHoverPrimary,
    required this.statesPressedPrimary,
    required this.statesHoverInverted,
    required this.statesPressedInverted,

    // Chart Red
    required this.chartRedSeries1st,
    required this.chartRedSeries2nd,
    required this.chartRedSeries3rd,
    required this.chartRedSeries4th,
    required this.chartRedSeries5th,

    // Chart Yellow
    required this.chartYellowSeries1st,
    required this.chartYellowSeries2nd,
    required this.chartYellowSeries3rd,
    required this.chartYellowSeries4th,
    required this.chartYellowSeries5th,

    // Chart Brown
    required this.chartBrownSeries1st,
    required this.chartBrownSeries2nd,
    required this.chartBrownSeries3rd,
    required this.chartBrownSeries4th,
    required this.chartBrownSeries5th,

    // Chart Light Green
    required this.chartLightGreenSeries1st,
    required this.chartLightGreenSeries2nd,
    required this.chartLightGreenSeries3rd,
    required this.chartLightGreenSeries4th,
    required this.chartLightGreenSeries5th,

    // Chart Green
    required this.chartGreenSeries1st,
    required this.chartGreenSeries2nd,
    required this.chartGreenSeries3rd,
    required this.chartGreenSeries4th,
    required this.chartGreenSeries5th,

    // Chart Blue
    required this.chartBlueSeries1st,
    required this.chartBlueSeries2nd,
    required this.chartBlueSeries3rd,
    required this.chartBlueSeries4th,
    required this.chartBlueSeries5th,

    // Chart Purple
    required this.chartPurpleSeries1st,
    required this.chartPurpleSeries2nd,
    required this.chartPurpleSeries3rd,
    required this.chartPurpleSeries4th,
    required this.chartPurpleSeries5th,

    // Chart Pink
    required this.chartPinkSeries1st,
    required this.chartPinkSeries2nd,
    required this.chartPinkSeries3rd,
    required this.chartPinkSeries4th,
    required this.chartPinkSeries5th,

    // Chart Gray
    required this.chartGraySeries1st,
    required this.chartGraySeries2nd,
    required this.chartGraySeries3rd,
    required this.chartGraySeries4th,
    required this.chartGraySeries5th,

    // Signal Background
    required this.signalBgNegativePrimary,
    required this.signalBgNegativeSecondary,
    required this.signalBgWarningPrimary,
    required this.signalBgWarningSecondary,
    required this.signalBgPositivePrimary,
    required this.signalBgPositiveSecondary,

    // Signal Border
    required this.signalBorderNegative,
    required this.signalBorderWarning,
    required this.signalBorderPositive,

    // Signal Icon
    required this.signalIconNegativePrimary,
    required this.signalIconNegativeSecondary,
    required this.signalIconWarningPrimary,
    required this.signalIconWarningSecondary,
    required this.signalIconPositivePrimary,
    required this.signalIconPositiveSecondary,

    // Signal Text
    required this.signalTextNegative,
    required this.signalTextWarning,
    required this.signalTextPositive,
  });

  // Text colors - ✦/text/*
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
  final Color textActionPrimary;
  final Color textActionSecondary;

  // Background colors - ✦/bg/*
  final Color bgPrimary;
  final Color bgSecondary;
  final Color bgTertiary;
  final Color bgDisabled;
  final Color bgActionPrimary;
  final Color bgActionSecondary;

  // Border colors - ✦/border/*
  final Color borderPrimary;
  final Color borderSecondary;
  final Color borderHighContrast;
  final Color borderFocused;
  final Color borderActionPrimary;
  final Color borderActionHighContrast;
  final Color borderMatchBackground;

  // Icon colors - ✦/icon/*
  final Color iconPrimary;
  final Color iconActionPrimary;
  final Color iconActionSecondary;

  // Brand colors - 🎨/*
  final Color directMutualFunds;
  final Color regularMutualFunds;
  final Color monthlyExpenses;
  final Color excessBalance;
  final Color insightsBg;
  final Color insightsText;
  final Color goalPlanningHighContrast;
  final Color goalPlanningLowContrast;

  // Always colors - 🚨/main/*
  final Color mainAlwaysWhite;
  final Color mainAlwaysBlack;
  final Color alphaOverlay;
  final Color alphaPrimary0;
  final Color alphaInverted0;

  // State colors - 🚨/states/*
  final Color statesHoverPrimary;
  final Color statesPressedPrimary;
  final Color statesHoverInverted;
  final Color statesPressedInverted;

  // Chart Red - 📊/red/*
  final Color chartRedSeries1st;
  final Color chartRedSeries2nd;
  final Color chartRedSeries3rd;
  final Color chartRedSeries4th;
  final Color chartRedSeries5th;

  // Chart Yellow - 📊/yellow/*
  final Color chartYellowSeries1st;
  final Color chartYellowSeries2nd;
  final Color chartYellowSeries3rd;
  final Color chartYellowSeries4th;
  final Color chartYellowSeries5th;

  // Chart Brown - 📊/brown/*
  final Color chartBrownSeries1st;
  final Color chartBrownSeries2nd;
  final Color chartBrownSeries3rd;
  final Color chartBrownSeries4th;
  final Color chartBrownSeries5th;

  // Chart Light Green - 📊/lightGreen/*
  final Color chartLightGreenSeries1st;
  final Color chartLightGreenSeries2nd;
  final Color chartLightGreenSeries3rd;
  final Color chartLightGreenSeries4th;
  final Color chartLightGreenSeries5th;

  // Chart Green - 📊/green/*
  final Color chartGreenSeries1st;
  final Color chartGreenSeries2nd;
  final Color chartGreenSeries3rd;
  final Color chartGreenSeries4th;
  final Color chartGreenSeries5th;

  // Chart Blue - 📊/blue/*
  final Color chartBlueSeries1st;
  final Color chartBlueSeries2nd;
  final Color chartBlueSeries3rd;
  final Color chartBlueSeries4th;
  final Color chartBlueSeries5th;

  // Chart Purple - 📊/purple/*
  final Color chartPurpleSeries1st;
  final Color chartPurpleSeries2nd;
  final Color chartPurpleSeries3rd;
  final Color chartPurpleSeries4th;
  final Color chartPurpleSeries5th;

  // Chart Pink - 📊/pink/*
  final Color chartPinkSeries1st;
  final Color chartPinkSeries2nd;
  final Color chartPinkSeries3rd;
  final Color chartPinkSeries4th;
  final Color chartPinkSeries5th;

  // Chart Gray - 📊/gray/*
  final Color chartGraySeries1st;
  final Color chartGraySeries2nd;
  final Color chartGraySeries3rd;
  final Color chartGraySeries4th;
  final Color chartGraySeries5th;

  // Signal Background - 🚦/bg/*
  final Color signalBgNegativePrimary;
  final Color signalBgNegativeSecondary;
  final Color signalBgWarningPrimary;
  final Color signalBgWarningSecondary;
  final Color signalBgPositivePrimary;
  final Color signalBgPositiveSecondary;

  // Signal Border - 🚦/border/*
  final Color signalBorderNegative;
  final Color signalBorderWarning;
  final Color signalBorderPositive;

  // Signal Icon - 🚦/icon/*
  final Color signalIconNegativePrimary;
  final Color signalIconNegativeSecondary;
  final Color signalIconWarningPrimary;
  final Color signalIconWarningSecondary;
  final Color signalIconPositivePrimary;
  final Color signalIconPositiveSecondary;

  // Signal Text - 🚦/text/*
  final Color signalTextNegative;
  final Color signalTextWarning;
  final Color signalTextPositive;

  /// Returns a list of chart colors for the specified palette.
  List<Color> chartPalette(DSChartColorPalette palette) {
    switch (palette) {
      case DSChartColorPalette.red:
        return [chartRedSeries1st, chartRedSeries2nd, chartRedSeries3rd, chartRedSeries4th, chartRedSeries5th];
      case DSChartColorPalette.yellow:
        return [chartYellowSeries1st, chartYellowSeries2nd, chartYellowSeries3rd, chartYellowSeries4th, chartYellowSeries5th];
      case DSChartColorPalette.brown:
        return [chartBrownSeries1st, chartBrownSeries2nd, chartBrownSeries3rd, chartBrownSeries4th, chartBrownSeries5th];
      case DSChartColorPalette.lightGreen:
        return [chartLightGreenSeries1st, chartLightGreenSeries2nd, chartLightGreenSeries3rd, chartLightGreenSeries4th, chartLightGreenSeries5th];
      case DSChartColorPalette.green:
        return [chartGreenSeries1st, chartGreenSeries2nd, chartGreenSeries3rd, chartGreenSeries4th, chartGreenSeries5th];
      case DSChartColorPalette.blue:
        return [chartBlueSeries1st, chartBlueSeries2nd, chartBlueSeries3rd, chartBlueSeries4th, chartBlueSeries5th];
      case DSChartColorPalette.purple:
        return [chartPurpleSeries1st, chartPurpleSeries2nd, chartPurpleSeries3rd, chartPurpleSeries4th, chartPurpleSeries5th];
      case DSChartColorPalette.pink:
        return [chartPinkSeries1st, chartPinkSeries2nd, chartPinkSeries3rd, chartPinkSeries4th, chartPinkSeries5th];
      case DSChartColorPalette.gray:
        return [chartGraySeries1st, chartGraySeries2nd, chartGraySeries3rd, chartGraySeries4th, chartGraySeries5th];
    }
  }
}

/// Enumeration of available chart color palettes.
enum DSChartColorPalette {
  red,
  yellow,
  brown,
  lightGreen,
  green,
  blue,
  purple,
  pink,
  gray,
}
