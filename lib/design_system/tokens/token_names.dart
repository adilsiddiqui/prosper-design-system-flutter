// GENERATED FILE - DO NOT EDIT DIRECTLY
// Generated from Figma design tokens
// This file contains the mapping between Figma token names and Dart-safe identifiers

/// Maps Figma token names to Dart-safe identifiers.
/// Use this class to ensure token name fidelity is maintained.
class DSTokenNames {
  DSTokenNames._();

  /// Returns the original Figma token name from a Dart-safe identifier.
  static String? getOriginalName(String dartSafeName) => _dartToFigma[dartSafeName];

  /// Returns the Dart-safe identifier from a Figma token name.
  static String? getDartSafeName(String figmaName) => _figmaToDart[figmaName];

  // Bidirectional mapping for reversibility
  static const Map<String, String> _dartToFigma = {
    // Color tokens - Text
    'textPrimary': '✦/text/primary',
    'textSecondary': '✦/text/secondary',
    'textTertiary': '✦/text/tertiary',
    'textDisabled': '✦/text/disabled',
    'textActionPrimary': '✦/text/action primary',
    'textActionSecondary': '✦/text/action secondary',

    // Color tokens - Background
    'bgPrimary': '✦/bg/primary',
    'bgSecondary': '✦/bg/secondary',
    'bgTertiary': '✦/bg/tertiary',
    'bgDisabled': '✦/bg/disabled',
    'bgActionPrimary': '✦/bg/action primary',
    'bgActionSecondary': '✦/bg/action secondary',

    // Color tokens - Border
    'borderPrimary': '✦/border/primary',
    'borderSecondary': '✦/border/secondary',
    'borderHighContrast': '✦/border/high contrast',
    'borderFocused': '✦/border/focused',
    'borderActionPrimary': '✦/border/action primary',
    'borderActionHighContrast': '✦/border/action high contrast',
    'borderMatchBackground': '✦/border/match background',

    // Color tokens - Icon
    'iconPrimary': '✦/icon/primary',
    'iconActionPrimary': '✦/icon/action primary',
    'iconActionSecondary': '✦/icon/action secondary',

    // Brand colors
    'directMutualFunds': '🎨/direct mutual funds',
    'regularMutualFunds': '🎨/regular mutual funds',
    'monthlyExpenses': '🎨/monthly expenses',
    'excessBalance': '🎨/excess balance',
    'insightsBg': '🎨/insights bg',
    'insightsText': '🎨/insights text',
    'goalPlanningHighContrast': '🎨/goal planning high contrast',
    'goalPlanningLowContrast': '🎨/goal planning low contrast',

    // Always colors
    'mainAlwaysWhite': '🚨/main/always white',
    'mainAlwaysBlack': '🚨/main/always black',
    'alphaOverlay': '🚨/alpha/overlay',
    'alphaPrimary0': '🚨/alpha/primary 0%',
    'alphaInverted0': '🚨/alpha/inverted 0%',

    // State colors
    'statesHoverPrimary': '🚨/states/hover primary',
    'statesPressedPrimary': '🚨/states/pressed primary',
    'statesHoverInverted': '🚨/states/hover inverted',
    'statesPressedInverted': '🚨/states/pressed inverted',

    // Chart colors - Red
    'chartRedSeries1st': '📊/red/series 1ˢᵗ',
    'chartRedSeries2nd': '📊/red/series 2ⁿᵈ',
    'chartRedSeries3rd': '📊/red/series 3ʳᵈ',
    'chartRedSeries4th': '📊/red/series 4ᵗʰ',
    'chartRedSeries5th': '📊/red/series 5ᵗʰ',

    // Chart colors - Yellow
    'chartYellowSeries1st': '📊/yellow/series 1ˢᵗ',
    'chartYellowSeries2nd': '📊/yellow/series 2ⁿᵈ',
    'chartYellowSeries3rd': '📊/yellow/series 3ʳᵈ',
    'chartYellowSeries4th': '📊/yellow/series 4ᵗʰ',
    'chartYellowSeries5th': '📊/yellow/series 5ᵗʰ',

    // Chart colors - Brown
    'chartBrownSeries1st': '📊/brown/series 1ˢᵗ',
    'chartBrownSeries2nd': '📊/brown/series 2ⁿᵈ',
    'chartBrownSeries3rd': '📊/brown/series 3ʳᵈ',
    'chartBrownSeries4th': '📊/brown/series 4ᵗʰ',
    'chartBrownSeries5th': '📊/brown/series 5ᵗʰ',

    // Chart colors - Light Green
    'chartLightGreenSeries1st': '📊/lightGreen/series 1ˢᵗ',
    'chartLightGreenSeries2nd': '📊/lightGreen/series 2ⁿᵈ',
    'chartLightGreenSeries3rd': '📊/lightGreen/series 3ʳᵈ',
    'chartLightGreenSeries4th': '📊/lightGreen/series 4ᵗʰ',
    'chartLightGreenSeries5th': '📊/lightGreen/series 5ᵗʰ',

    // Chart colors - Green
    'chartGreenSeries1st': '📊/green/series 1ˢᵗ',
    'chartGreenSeries2nd': '📊/green/series 2ⁿᵈ',
    'chartGreenSeries3rd': '📊/green/series 3ʳᵈ',
    'chartGreenSeries4th': '📊/green/series 4ᵗʰ',
    'chartGreenSeries5th': '📊/green/series 5ᵗʰ',

    // Chart colors - Blue
    'chartBlueSeries1st': '📊/blue/series 1ˢᵗ',
    'chartBlueSeries2nd': '📊/blue/series 2ⁿᵈ',
    'chartBlueSeries3rd': '📊/blue/series 3ʳᵈ',
    'chartBlueSeries4th': '📊/blue/series 4ᵗʰ',
    'chartBlueSeries5th': '📊/blue/series 5ᵗʰ',

    // Chart colors - Purple
    'chartPurpleSeries1st': '📊/purple/series 1ˢᵗ',
    'chartPurpleSeries2nd': '📊/purple/series 2ⁿᵈ',
    'chartPurpleSeries3rd': '📊/purple/series 3ʳᵈ',
    'chartPurpleSeries4th': '📊/purple/series 4ᵗʰ',
    'chartPurpleSeries5th': '📊/purple/series 5ᵗʰ',

    // Chart colors - Pink
    'chartPinkSeries1st': '📊/pink/series 1ˢᵗ',
    'chartPinkSeries2nd': '📊/pink/series 2ⁿᵈ',
    'chartPinkSeries3rd': '📊/pink/series 3ʳᵈ',
    'chartPinkSeries4th': '📊/pink/series 4ᵗʰ',
    'chartPinkSeries5th': '📊/pink/series 5ᵗʰ',

    // Chart colors - Gray
    'chartGraySeries1st': '📊/gray/series 1ˢᵗ',
    'chartGraySeries2nd': '📊/gray/series 2ⁿᵈ',
    'chartGraySeries3rd': '📊/gray/series 3ʳᵈ',
    'chartGraySeries4th': '📊/gray/series 4ᵗʰ',
    'chartGraySeries5th': '📊/gray/series 5ᵗʰ',

    // Signal colors - Background
    'signalBgNegativePrimary': '🚦/bg/negative primary',
    'signalBgNegativeSecondary': '🚦/bg/negative secondary',
    'signalBgWarningPrimary': '🚦/bg/warning primary',
    'signalBgWarningSecondary': '🚦/bg/warning secondary',
    'signalBgPositivePrimary': '🚦/bg/positive primary',
    'signalBgPositiveSecondary': '🚦/bg/positive secondary',

    // Signal colors - Border
    'signalBorderNegative': '🚦/border/negative',
    'signalBorderWarning': '🚦/border/warning',
    'signalBorderPositive': '🚦/border/positive',

    // Signal colors - Icon
    'signalIconNegativePrimary': '🚦/icon/negative primary',
    'signalIconNegativeSecondary': '🚦/icon/negative secondary',
    'signalIconWarningPrimary': '🚦/icon/warning primary',
    'signalIconWarningSecondary': '🚦/icon/warning secondary',
    'signalIconPositivePrimary': '🚦/icon/positive primary',
    'signalIconPositiveSecondary': '🚦/icon/positive secondary',

    // Signal colors - Text
    'signalTextNegative': '🚦/text/negative',
    'signalTextWarning': '🚦/text/warning',
    'signalTextPositive': '🚦/text/positive',

    // Spacing tokens
    'spacingPx': 'spacing/px',
    'spacingPxpx': 'spacing/pxpx',
    'spacing2xs': 'spacing/2xs',
    'spacingXs': 'spacing/xs',
    'spacingSm': 'spacing/sm',
    'spacingMd': 'spacing/md',
    'spacingLg': 'spacing/lg',
    'spacingXl': 'spacing/xl',
    'spacing2xl': 'spacing/2xl',
    'spacing3xl': 'spacing/3xl',
    'spacing4xl': 'spacing/4xl',
    'spacing5xl': 'spacing/5xl',
    'spacing6xl': 'spacing/6xl',
    'spacing7xl': 'spacing/7xl',
    'spacing8xl': 'spacing/8xl',

    // Negative spacing tokens
    'minusSpacingPx': 'minus spacing/-px',
    'minusSpacingPxpx': 'minus spacing/-pxpx',
    'minusSpacing2xs': 'minus spacing/-2xs',
    'minusSpacingXs': 'minus spacing/-xs',
    'minusSpacingSm': 'minus spacing/-sm',
    'minusSpacingMd': 'minus spacing/-md',
    'minusSpacingLg': 'minus spacing/-lg',
    'minusSpacingXl': 'minus spacing/-xl',
    'minusSpacing2xl': 'minus spacing/-2xl',
    'minusSpacing3xl': 'minus spacing/-3xl',
    'minusSpacing4xl': 'minus spacing/-4xl',
    'minusSpacing5xl': 'minus spacing/-5xl',
    'minusSpacing6xl': 'minus spacing/-6xl',
    'minusSpacing7xl': 'minus spacing/-7xl',
    'minusSpacing8xl': 'minus spacing/-8xl',

    // Radius tokens
    'radiusFull': 'radius/full',
    'radiusXl': 'radius/xl',
    'radius3xl': 'radius/3xl',

    // Shadow tokens
    'shadow200': 'shadows with border/200',
    'shadow400': 'shadows with border/400',
    'shadow500': 'shadows with border/500',
    'shadow700': 'shadows with border/700',

    // Typography tokens
    'displayLarge': 'Display/Large',
    'displayDefault': 'Display/Default',
    'displaySmall': 'Display/Small',
    'headingLarge': 'Heading/Large',
    'headingDefault': 'Heading/Default',
    'headingSmall': 'Heading/Small',
    'lineLargeRegular': 'Line Large/Regular',
    'lineLargeMedium': 'Line Large/Medium',
    'lineLargeBold': 'Line Large/Bold',
    'paraLargeRegular': 'Para Large/Regular',
    'paraLargeMedium': 'Para Large/Medium',
    'paraLargeBold': 'Para Large/Bold',
    'lineDefaultRegular': 'Line Default/Regular',
    'lineDefaultMedium': 'Line Default/Medium',
    'lineDefaultBold': 'Line Default/Bold',
    'paraDefaultRegular': 'Para Default/Regular',
    'paraDefaultMedium': 'Para Default/Medium',
    'paraDefaultBold': 'Para Default/Bold',
    'lineSmallRegular': 'Line Small/Regular',
    'lineSmallMedium': 'Line Small/Medium',
    'lineSmallBold': 'Line Small/Bold',
    'paraSmallRegular': 'Para Small/Regular',
    'paraSmallMedium': 'Para Small/Medium',
    'paraSmallBold': 'Para Small/Bold',
    'uppercaseDefault': 'Uppercase/Default',
    'uppercaseBold': 'Uppercase/Bold',
    'disclaimerDefault': 'Disclaimer/Default',
    'disclaimerParaDefault': 'Disclaimer/Para Default',
    'disclaimerSmall': 'Disclaimer/Small',
    'disclaimerParaSmall': 'Disclaimer/Para Small',
    'numberLarge': 'Number/Large',
    'numberDefault': 'Number/Default',
    'numberSmall': 'Number/Small',
  };

  static final Map<String, String> _figmaToDart = {
    for (final entry in _dartToFigma.entries) entry.value: entry.key,
  };
}
