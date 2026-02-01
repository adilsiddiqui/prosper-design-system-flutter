import 'package:flutter/material.dart';

import '../design_system/design_system.dart';

/// Design System Demo Page
/// 
/// Displays ALL design system tokens - no fallbacks, only design system values.
class DesignSystemDemo extends StatefulWidget {
  const DesignSystemDemo({super.key});

  @override
  State<DesignSystemDemo> createState() => _DesignSystemDemoState();
}

class _DesignSystemDemoState extends State<DesignSystemDemo> {
  bool _isDarkMode = false;
  bool _showSolidIcons = false; // false = line, true = solid

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Prosper Design System',
      theme: DS.theme.light,
      darkTheme: DS.theme.dark,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: context.ds.colors.bgPrimary,
          appBar: AppBar(
            backgroundColor: context.ds.colors.bgPrimary,
            title: Text(
              'Prosper Design System',
              style: context.ds.typography.lineLargeBold.copyWith(
                color: context.ds.colors.textPrimary,
              ),
            ),
            actions: [
              // Light/Dark Mode Switch
              Padding(
                padding: EdgeInsets.only(right: DSSpacing.md),
                child: Row(
                  children: [
                    Text(
                      'Light',
                      style: context.ds.typography.lineSmallMedium.copyWith(
                        color: !_isDarkMode 
                            ? context.ds.colors.textPrimary 
                            : context.ds.colors.textTertiary,
                      ),
                    ),
                    SizedBox(width: DSSpacing.xs),
                    Switch(
                      value: _isDarkMode,
                      onChanged: (value) => setState(() => _isDarkMode = value),
                      activeColor: context.ds.colors.bgActionPrimary,
                      activeTrackColor: context.ds.colors.bgActionSecondary,
                      inactiveThumbColor: context.ds.colors.bgActionPrimary,
                      inactiveTrackColor: context.ds.colors.bgTertiary,
                    ),
                    SizedBox(width: DSSpacing.xs),
                    Text(
                      'Dark',
                      style: context.ds.typography.lineSmallMedium.copyWith(
                        color: _isDarkMode 
                            ? context.ds.colors.textPrimary 
                            : context.ds.colors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(DSSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildModeIndicator(context),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Text Colors', _buildTextColors(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Background Colors', _buildBgColors(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Border Colors', _buildBorderColors(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Icon Colors', _buildIconColors(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Brand Colors', _buildBrandColors(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Signal Colors', _buildSignalColors(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Chart Colors', _buildChartColors(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'State Colors', _buildStateColors(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Typography - Display', _buildDisplayTypography(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Typography - Heading', _buildHeadingTypography(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Typography - Line Large', _buildLineLargeTypography(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Typography - Para Large', _buildParaLargeTypography(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Typography - Line Default', _buildLineDefaultTypography(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Typography - Para Default', _buildParaDefaultTypography(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Typography - Line Small', _buildLineSmallTypography(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Typography - Para Small', _buildParaSmallTypography(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Typography - Uppercase', _buildUppercaseTypography(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Typography - Disclaimer', _buildDisclaimerTypography(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Typography - Number', _buildNumberTypography(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Spacing Tokens', _buildSpacingTokens(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Radius Tokens', _buildRadiusTokens(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Shadow Tokens', _buildShadowTokens(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Icons - All Available', _buildAllIcons(context)),
                SizedBox(height: DSSpacing.xl2),
                _buildSection(context, 'Icon Sizes', _buildIconSizes(context)),
                SizedBox(height: DSSpacing.xl3),
              ],
            ),
          ),
        ),
      ),
    );

  Widget _buildModeIndicator(BuildContext context) => Container(
      width: double.infinity,
      padding: EdgeInsets.all(DSSpacing.md),
      decoration: BoxDecoration(
        color: context.ds.colors.bgSecondary,
        borderRadius: BorderRadius.circular(DSRadius.xl),
        border: Border.all(color: context.ds.colors.borderPrimary),
      ),
      child: Row(
        children: [
          Container(
            width: DSSpacing.xl,
            height: DSSpacing.xl,
            decoration: BoxDecoration(
              color: _isDarkMode 
                  ? context.ds.colors.mainAlwaysBlack 
                  : context.ds.colors.mainAlwaysWhite,
              borderRadius: BorderRadius.circular(DSRadius.full),
              border: Border.all(color: context.ds.colors.borderSecondary),
            ),
          ),
          SizedBox(width: DSSpacing.md),
          Text(
            'Current Mode: ${_isDarkMode ? "Dark" : "Light"}',
            style: context.ds.typography.lineLargeBold.copyWith(
              color: context.ds.colors.textPrimary,
            ),
          ),
        ],
      ),
    );

  Widget _buildSection(BuildContext context, String title, Widget content) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: DSSpacing.md,
            vertical: DSSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: context.ds.colors.bgActionPrimary,
            borderRadius: BorderRadius.circular(DSRadius.xl),
          ),
          child: Text(
            title,
            style: context.ds.typography.lineDefaultBold.copyWith(
              color: context.ds.colors.textActionPrimary,
            ),
          ),
        ),
        SizedBox(height: DSSpacing.md),
        content,
      ],
    );

  Widget _buildColorSwatch(BuildContext context, String name, Color color) => Container(
      width: 100,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(DSRadius.xl),
              border: Border.all(color: context.ds.colors.borderSecondary),
            ),
          ),
          SizedBox(height: DSSpacing.xs),
          Text(
            name,
            style: context.ds.typography.disclaimerDefault.copyWith(
              color: context.ds.colors.textSecondary,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

  Widget _buildTextColors(BuildContext context) {
    final c = context.ds.colors;
    return Wrap(
      spacing: DSSpacing.md,
      runSpacing: DSSpacing.md,
      children: [
        _buildColorSwatch(context, 'textPrimary', c.textPrimary),
        _buildColorSwatch(context, 'textSecondary', c.textSecondary),
        _buildColorSwatch(context, 'textTertiary', c.textTertiary),
        _buildColorSwatch(context, 'textDisabled', c.textDisabled),
        _buildColorSwatch(context, 'textActionPrimary', c.textActionPrimary),
        _buildColorSwatch(context, 'textActionSecondary', c.textActionSecondary),
      ],
    );
  }

  Widget _buildBgColors(BuildContext context) {
    final c = context.ds.colors;
    return Wrap(
      spacing: DSSpacing.md,
      runSpacing: DSSpacing.md,
      children: [
        _buildColorSwatch(context, 'bgPrimary', c.bgPrimary),
        _buildColorSwatch(context, 'bgSecondary', c.bgSecondary),
        _buildColorSwatch(context, 'bgTertiary', c.bgTertiary),
        _buildColorSwatch(context, 'bgDisabled', c.bgDisabled),
        _buildColorSwatch(context, 'bgActionPrimary', c.bgActionPrimary),
        _buildColorSwatch(context, 'bgActionSecondary', c.bgActionSecondary),
      ],
    );
  }

  Widget _buildBorderColors(BuildContext context) {
    final c = context.ds.colors;
    return Wrap(
      spacing: DSSpacing.md,
      runSpacing: DSSpacing.md,
      children: [
        _buildColorSwatch(context, 'borderPrimary', c.borderPrimary),
        _buildColorSwatch(context, 'borderSecondary', c.borderSecondary),
        _buildColorSwatch(context, 'borderHighContrast', c.borderHighContrast),
        _buildColorSwatch(context, 'borderFocused', c.borderFocused),
        _buildColorSwatch(context, 'borderActionPrimary', c.borderActionPrimary),
        _buildColorSwatch(context, 'borderActionHighContrast', c.borderActionHighContrast),
        _buildColorSwatch(context, 'borderMatchBackground', c.borderMatchBackground),
      ],
    );
  }

  Widget _buildIconColors(BuildContext context) {
    final c = context.ds.colors;
    return Wrap(
      spacing: DSSpacing.md,
      runSpacing: DSSpacing.md,
      children: [
        _buildColorSwatch(context, 'iconPrimary', c.iconPrimary),
        _buildColorSwatch(context, 'iconActionPrimary', c.iconActionPrimary),
        _buildColorSwatch(context, 'iconActionSecondary', c.iconActionSecondary),
      ],
    );
  }

  Widget _buildBrandColors(BuildContext context) {
    final c = context.ds.colors;
    return Wrap(
      spacing: DSSpacing.md,
      runSpacing: DSSpacing.md,
      children: [
        _buildColorSwatch(context, 'directMutualFunds', c.directMutualFunds),
        _buildColorSwatch(context, 'regularMutualFunds', c.regularMutualFunds),
        _buildColorSwatch(context, 'monthlyExpenses', c.monthlyExpenses),
        _buildColorSwatch(context, 'excessBalance', c.excessBalance),
        _buildColorSwatch(context, 'insightsBg', c.insightsBg),
        _buildColorSwatch(context, 'insightsText', c.insightsText),
        _buildColorSwatch(context, 'goalPlanningHigh', c.goalPlanningHighContrast),
        _buildColorSwatch(context, 'goalPlanningLow', c.goalPlanningLowContrast),
      ],
    );
  }

  Widget _buildSignalColors(BuildContext context) {
    final c = context.ds.colors;
    return Wrap(
      spacing: DSSpacing.md,
      runSpacing: DSSpacing.md,
      children: [
        _buildColorSwatch(context, 'signalBgNegativePrimary', c.signalBgNegativePrimary),
        _buildColorSwatch(context, 'signalBgNegativeSecondary', c.signalBgNegativeSecondary),
        _buildColorSwatch(context, 'signalBgWarningPrimary', c.signalBgWarningPrimary),
        _buildColorSwatch(context, 'signalBgWarningSecondary', c.signalBgWarningSecondary),
        _buildColorSwatch(context, 'signalBgPositivePrimary', c.signalBgPositivePrimary),
        _buildColorSwatch(context, 'signalBgPositiveSecondary', c.signalBgPositiveSecondary),
        _buildColorSwatch(context, 'signalBorderNegative', c.signalBorderNegative),
        _buildColorSwatch(context, 'signalBorderWarning', c.signalBorderWarning),
        _buildColorSwatch(context, 'signalBorderPositive', c.signalBorderPositive),
        _buildColorSwatch(context, 'signalIconNegativePrimary', c.signalIconNegativePrimary),
        _buildColorSwatch(context, 'signalIconNegativeSecondary', c.signalIconNegativeSecondary),
        _buildColorSwatch(context, 'signalIconWarningPrimary', c.signalIconWarningPrimary),
        _buildColorSwatch(context, 'signalIconWarningSecondary', c.signalIconWarningSecondary),
        _buildColorSwatch(context, 'signalIconPositivePrimary', c.signalIconPositivePrimary),
        _buildColorSwatch(context, 'signalIconPositiveSecondary', c.signalIconPositiveSecondary),
        _buildColorSwatch(context, 'signalTextNegative', c.signalTextNegative),
        _buildColorSwatch(context, 'signalTextWarning', c.signalTextWarning),
        _buildColorSwatch(context, 'signalTextPositive', c.signalTextPositive),
      ],
    );
  }

  Widget _buildChartColors(BuildContext context) {
    final c = context.ds.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildChartPaletteRow(context, 'Red', [
          c.chartRedSeries1st, c.chartRedSeries2nd, c.chartRedSeries3rd, 
          c.chartRedSeries4th, c.chartRedSeries5th,
        ]),
        const SizedBox(height: DSSpacing.md),
        _buildChartPaletteRow(context, 'Yellow', [
          c.chartYellowSeries1st, c.chartYellowSeries2nd, c.chartYellowSeries3rd, 
          c.chartYellowSeries4th, c.chartYellowSeries5th,
        ]),
        const SizedBox(height: DSSpacing.md),
        _buildChartPaletteRow(context, 'Brown', [
          c.chartBrownSeries1st, c.chartBrownSeries2nd, c.chartBrownSeries3rd, 
          c.chartBrownSeries4th, c.chartBrownSeries5th,
        ]),
        const SizedBox(height: DSSpacing.md),
        _buildChartPaletteRow(context, 'Light Green', [
          c.chartLightGreenSeries1st, c.chartLightGreenSeries2nd, c.chartLightGreenSeries3rd, 
          c.chartLightGreenSeries4th, c.chartLightGreenSeries5th,
        ]),
        const SizedBox(height: DSSpacing.md),
        _buildChartPaletteRow(context, 'Green', [
          c.chartGreenSeries1st, c.chartGreenSeries2nd, c.chartGreenSeries3rd, 
          c.chartGreenSeries4th, c.chartGreenSeries5th,
        ]),
        const SizedBox(height: DSSpacing.md),
        _buildChartPaletteRow(context, 'Blue', [
          c.chartBlueSeries1st, c.chartBlueSeries2nd, c.chartBlueSeries3rd, 
          c.chartBlueSeries4th, c.chartBlueSeries5th,
        ]),
        const SizedBox(height: DSSpacing.md),
        _buildChartPaletteRow(context, 'Purple', [
          c.chartPurpleSeries1st, c.chartPurpleSeries2nd, c.chartPurpleSeries3rd, 
          c.chartPurpleSeries4th, c.chartPurpleSeries5th,
        ]),
        const SizedBox(height: DSSpacing.md),
        _buildChartPaletteRow(context, 'Pink', [
          c.chartPinkSeries1st, c.chartPinkSeries2nd, c.chartPinkSeries3rd, 
          c.chartPinkSeries4th, c.chartPinkSeries5th,
        ]),
        const SizedBox(height: DSSpacing.md),
        _buildChartPaletteRow(context, 'Gray', [
          c.chartGraySeries1st, c.chartGraySeries2nd, c.chartGraySeries3rd, 
          c.chartGraySeries4th, c.chartGraySeries5th,
        ]),
      ],
    );
  }

  Widget _buildChartPaletteRow(BuildContext context, String name, List<Color> colors) => Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            name,
            style: context.ds.typography.lineSmallMedium.copyWith(
              color: context.ds.colors.textSecondary,
            ),
          ),
        ),
        ...colors.map((color) => Container(
          width: 48,
          height: 48,
          margin: EdgeInsets.only(right: DSSpacing.xs),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(DSRadius.xl),
            border: Border.all(color: context.ds.colors.borderPrimary),
          ),
        )),
      ],
    );

  Widget _buildStateColors(BuildContext context) {
    final c = context.ds.colors;
    return Wrap(
      spacing: DSSpacing.md,
      runSpacing: DSSpacing.md,
      children: [
        _buildColorSwatch(context, 'mainAlwaysWhite', c.mainAlwaysWhite),
        _buildColorSwatch(context, 'mainAlwaysBlack', c.mainAlwaysBlack),
        _buildColorSwatch(context, 'alphaOverlay', c.alphaOverlay),
        _buildColorSwatch(context, 'alphaPrimary0', c.alphaPrimary0),
        _buildColorSwatch(context, 'alphaInverted0', c.alphaInverted0),
        _buildColorSwatch(context, 'statesHoverPrimary', c.statesHoverPrimary),
        _buildColorSwatch(context, 'statesPressedPrimary', c.statesPressedPrimary),
        _buildColorSwatch(context, 'statesHoverInverted', c.statesHoverInverted),
        _buildColorSwatch(context, 'statesPressedInverted', c.statesPressedInverted),
      ],
    );
  }

  Widget _buildTypographyRow(BuildContext context, String name, TextStyle style) => Padding(
      padding: EdgeInsets.only(bottom: DSSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          SizedBox(
            width: 180,
            child: Text(
              name,
              style: context.ds.typography.lineSmallRegular.copyWith(
                color: context.ds.colors.textTertiary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'The quick brown fox',
              style: style.copyWith(color: context.ds.colors.textPrimary),
            ),
          ),
        ],
      ),
    );

  Widget _buildDisplayTypography(BuildContext context) {
    final t = context.ds.typography;
    return Column(
      children: [
        _buildTypographyRow(context, 'Display/Large', t.displayLarge),
        _buildTypographyRow(context, 'Display/Default', t.displayDefault),
        _buildTypographyRow(context, 'Display/Small', t.displaySmall),
      ],
    );
  }

  Widget _buildHeadingTypography(BuildContext context) {
    final t = context.ds.typography;
    return Column(
      children: [
        _buildTypographyRow(context, 'Heading/Large', t.headingLarge),
        _buildTypographyRow(context, 'Heading/Default', t.headingDefault),
        _buildTypographyRow(context, 'Heading/Small', t.headingSmall),
      ],
    );
  }

  Widget _buildLineLargeTypography(BuildContext context) {
    final t = context.ds.typography;
    return Column(
      children: [
        _buildTypographyRow(context, 'Line Large/Regular', t.lineLargeRegular),
        _buildTypographyRow(context, 'Line Large/Medium', t.lineLargeMedium),
        _buildTypographyRow(context, 'Line Large/Bold', t.lineLargeBold),
      ],
    );
  }

  Widget _buildParaLargeTypography(BuildContext context) {
    final t = context.ds.typography;
    return Column(
      children: [
        _buildTypographyRow(context, 'Para Large/Regular', t.paraLargeRegular),
        _buildTypographyRow(context, 'Para Large/Medium', t.paraLargeMedium),
        _buildTypographyRow(context, 'Para Large/Bold', t.paraLargeBold),
      ],
    );
  }

  Widget _buildLineDefaultTypography(BuildContext context) {
    final t = context.ds.typography;
    return Column(
      children: [
        _buildTypographyRow(context, 'Line Default/Regular', t.lineDefaultRegular),
        _buildTypographyRow(context, 'Line Default/Medium', t.lineDefaultMedium),
        _buildTypographyRow(context, 'Line Default/Bold', t.lineDefaultBold),
      ],
    );
  }

  Widget _buildParaDefaultTypography(BuildContext context) {
    final t = context.ds.typography;
    return Column(
      children: [
        _buildTypographyRow(context, 'Para Default/Regular', t.paraDefaultRegular),
        _buildTypographyRow(context, 'Para Default/Medium', t.paraDefaultMedium),
        _buildTypographyRow(context, 'Para Default/Bold', t.paraDefaultBold),
      ],
    );
  }

  Widget _buildLineSmallTypography(BuildContext context) {
    final t = context.ds.typography;
    return Column(
      children: [
        _buildTypographyRow(context, 'Line Small/Regular', t.lineSmallRegular),
        _buildTypographyRow(context, 'Line Small/Medium', t.lineSmallMedium),
        _buildTypographyRow(context, 'Line Small/Bold', t.lineSmallBold),
      ],
    );
  }

  Widget _buildParaSmallTypography(BuildContext context) {
    final t = context.ds.typography;
    return Column(
      children: [
        _buildTypographyRow(context, 'Para Small/Regular', t.paraSmallRegular),
        _buildTypographyRow(context, 'Para Small/Medium', t.paraSmallMedium),
        _buildTypographyRow(context, 'Para Small/Bold', t.paraSmallBold),
      ],
    );
  }

  Widget _buildUppercaseTypography(BuildContext context) {
    final t = context.ds.typography;
    return Column(
      children: [
        _buildTypographyRow(context, 'Uppercase/Default', t.uppercaseDefault),
        _buildTypographyRow(context, 'Uppercase/Bold', t.uppercaseBold),
      ],
    );
  }

  Widget _buildDisclaimerTypography(BuildContext context) {
    final t = context.ds.typography;
    return Column(
      children: [
        _buildTypographyRow(context, 'Disclaimer/Default', t.disclaimerDefault),
        _buildTypographyRow(context, 'Disclaimer/Para Default', t.disclaimerParaDefault),
        _buildTypographyRow(context, 'Disclaimer/Small', t.disclaimerSmall),
        _buildTypographyRow(context, 'Disclaimer/Para Small', t.disclaimerParaSmall),
      ],
    );
  }

  Widget _buildNumberTypography(BuildContext context) {
    final t = context.ds.typography;
    return Column(
      children: [
        _buildTypographyRow(context, 'Number/Large', t.numberLarge),
        _buildTypographyRow(context, 'Number/Default', t.numberDefault),
        _buildTypographyRow(context, 'Number/Small', t.numberSmall),
      ],
    );
  }

  Widget _buildSpacingTokens(BuildContext context) {
    final spacings = [
      ('px', DSSpacing.px),
      ('pxpx', DSSpacing.pxpx),
      ('2xs', DSSpacing.xs2),
      ('xs', DSSpacing.xs),
      ('sm', DSSpacing.sm),
      ('md', DSSpacing.md),
      ('lg', DSSpacing.lg),
      ('xl', DSSpacing.xl),
      ('2xl', DSSpacing.xl2),
      ('3xl', DSSpacing.xl3),
      ('4xl', DSSpacing.xl4),
      ('5xl', DSSpacing.xl5),
      ('6xl', DSSpacing.xl6),
      ('7xl', DSSpacing.xl7),
      ('8xl', DSSpacing.xl8),
    ];

    return Column(
      children: spacings.map((s) => Padding(
        padding: const EdgeInsets.only(bottom: DSSpacing.xs),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              child: Text(
                '${s.$1} (${s.$2.toInt()})',
                style: context.ds.typography.lineSmallRegular.copyWith(
                  color: context.ds.colors.textSecondary,
                ),
              ),
            ),
            Container(
              width: s.$2,
              height: DSSpacing.xl,
              decoration: BoxDecoration(
                color: context.ds.colors.bgActionPrimary,
                borderRadius: BorderRadius.circular(DSSpacing.xs2),
              ),
            ),
          ],
        ),
      ),).toList(),
    );
  }

  Widget _buildRadiusTokens(BuildContext context) {
    final radii = [
      ('xl (16)', DSRadius.xl),
      ('3xl (24)', DSRadius.xl3),
      ('full (9999)', DSRadius.full),
    ];

    return Wrap(
      spacing: DSSpacing.xl,
      runSpacing: DSSpacing.md,
      children: radii.map((r) => Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: context.ds.colors.bgSecondary,
              borderRadius: BorderRadius.circular(r.$2.clamp(0, 40)),
              border: Border.all(
                color: context.ds.colors.borderActionPrimary,
                width: 2,
              ),
            ),
          ),
          const SizedBox(height: DSSpacing.xs),
          Text(
            r.$1,
            style: context.ds.typography.disclaimerDefault.copyWith(
              color: context.ds.colors.textSecondary,
            ),
          ),
        ],
      ),).toList(),
    );
  }

  Widget _buildShadowTokens(BuildContext context) {
    final shadows = [
      ('shadow200', context.ds.shadows.shadow200),
      ('shadow400', context.ds.shadows.shadow400),
      ('shadow500', context.ds.shadows.shadow500),
      ('shadow700', context.ds.shadows.shadow700),
    ];

    return Wrap(
      spacing: DSSpacing.xl2,
      runSpacing: DSSpacing.xl,
      children: shadows.map((s) => Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: context.ds.colors.bgPrimary,
              borderRadius: BorderRadius.circular(DSRadius.xl),
              border: Border.all(color: context.ds.colors.borderPrimary),
              boxShadow: s.$2,
            ),
            child: Center(
              child: Text(
                s.$1,
                style: context.ds.typography.lineSmallMedium.copyWith(
                  color: context.ds.colors.textSecondary,
                ),
              ),
            ),
          ),
        ],
      ),).toList(),
    );
  }

  Widget _buildAllIcons(BuildContext context) {
    // Get all available icons
    const allIcons = DSIcons.all;
    final currentStroke = _showSolidIcons ? DSIconStroke.solid : DSIconStroke.line;
    
    // Filter icons based on current stroke availability
    final displayIcons = _showSolidIcons 
        ? allIcons.where((icon) => icon.hasSolidVariant).toList()
        : allIcons.where((icon) => icon.hasLineVariant).toList();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tab toggle for Line/Solid
        Container(
          padding: const EdgeInsets.all(DSSpacing.xs2),
          decoration: BoxDecoration(
            color: context.ds.colors.bgSecondary,
            borderRadius: BorderRadius.circular(DSRadius.xl),
            border: Border.all(color: context.ds.colors.borderPrimary),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Line tab
              GestureDetector(
                onTap: () => setState(() => _showSolidIcons = false),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DSSpacing.lg,
                    vertical: DSSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: !_showSolidIcons 
                        ? context.ds.colors.bgActionPrimary 
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(DSRadius.xl),
                  ),
                  child: Text(
                    'Outline (${allIcons.where((i) => i.hasLineVariant).length})',
                    style: context.ds.typography.lineDefaultMedium.copyWith(
                      color: !_showSolidIcons 
                          ? context.ds.colors.textActionPrimary 
                          : context.ds.colors.textSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: DSSpacing.xs),
              // Solid tab
              GestureDetector(
                onTap: () => setState(() => _showSolidIcons = true),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DSSpacing.lg,
                    vertical: DSSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: _showSolidIcons 
                        ? context.ds.colors.bgActionPrimary 
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(DSRadius.xl),
                  ),
                  child: Text(
                    'Filled (${allIcons.where((i) => i.hasSolidVariant).length})',
                    style: context.ds.typography.lineDefaultMedium.copyWith(
                      color: _showSolidIcons 
                          ? context.ds.colors.textActionPrimary 
                          : context.ds.colors.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.lg),
        // Icons grid with actual SVG icons
        Wrap(
          spacing: DSSpacing.md,
          runSpacing: DSSpacing.md,
          children: displayIcons.map((icon) => Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: context.ds.colors.bgSecondary,
                  borderRadius: BorderRadius.circular(DSRadius.xl),
                  border: Border.all(color: context.ds.colors.borderPrimary),
                ),
                child: Center(
                  child: DSIcon(
                    icon,
                    stroke: currentStroke,
                    color: context.ds.colors.iconPrimary,
                  ),
                ),
              ),
              const SizedBox(height: DSSpacing.xs2),
              SizedBox(
                width: 70,
                child: Text(
                  icon.name,
                  style: context.ds.typography.disclaimerSmall.copyWith(
                    color: context.ds.colors.textTertiary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),).toList(),
        ),
      ],
    );
  }

  Widget _buildIconSizes(BuildContext context) {
    final sizes = [
      ('small (16)', DSIconSize.small),
      ('medium (20)', DSIconSize.medium),
      ('default (24)', DSIconSize.defaultSize),
      ('large (32)', DSIconSize.large),
    ];

    // Use first available icon for size demo
    final sampleIcon = DSIcons.all.isNotEmpty ? DSIcons.all.first : null;

    if (sampleIcon == null) {
      return Text(
        'No icons available',
        style: context.ds.typography.lineDefaultRegular.copyWith(
          color: context.ds.colors.textTertiary,
        ),
      );
    }

    return Row(
      children: sizes.map((s) => Padding(
        padding: const EdgeInsets.only(right: DSSpacing.xl),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(DSSpacing.sm),
              decoration: BoxDecoration(
                color: context.ds.colors.bgSecondary,
                borderRadius: BorderRadius.circular(DSRadius.xl),
                border: Border.all(color: context.ds.colors.borderPrimary),
              ),
              child: Center(
                child: DSIcon(
                  sampleIcon,
                  size: s.$2,
                  color: context.ds.colors.iconPrimary,
                ),
              ),
            ),
            const SizedBox(height: DSSpacing.xs),
            Text(
              s.$1,
              style: context.ds.typography.disclaimerDefault.copyWith(
                color: context.ds.colors.textSecondary,
              ),
            ),
          ],
        ),
      ),).toList(),
    );
  }
}

/// Run the demo
void main() {
  runApp(const DesignSystemDemo());
}
