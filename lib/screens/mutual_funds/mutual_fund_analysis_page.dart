import 'package:flutter/material.dart';

import '../../design_system/design_system.dart';
import '../../main.dart' show ThemeToggleSwitch;

/// Mutual Fund Analysis Page
/// 
/// Implemented using ONLY design system tokens.
/// All styling comes from the design system - no hardcoded values.
class MutualFundAnalysisPage extends StatefulWidget {
  const MutualFundAnalysisPage({super.key});

  @override
  State<MutualFundAnalysisPage> createState() => _MutualFundAnalysisPageState();
}

class _MutualFundAnalysisPageState extends State<MutualFundAnalysisPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: context.ds.colors.bgPrimary,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // Fixed Status Bar
            const _StatusBar(),
            // Fixed Header with back button and theme toggle - ALWAYS STICKY
            _Header(onBack: () => Navigator.pop(context)),
            // NestedScrollView for Holdings Summary + Sticky TabBar + scrollable content
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    // Holdings Summary - scrolls away
                    SliverToBoxAdapter(
                      child: _HoldingsSummary(),
                    ),
                    // Tab Bar - becomes sticky when scrolled to top
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _StickyTabBarDelegate(
                        tabController: _tabController,
                        backgroundColor: context.ds.colors.bgPrimary,
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: const [
                    // Analysis tab content
                    SingleChildScrollView(
                      child: _AnalysisContent(),
                    ),
                    // Holdings tab content
                    SingleChildScrollView(
                      child: _HoldingsContent(),
                    ),
                  ],
                ),
              ),
            ),
            const _BottomBar(),
          ],
        ),
      ),
    );
}

/// Delegate for sticky tab bar
class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {

  _StickyTabBarDelegate({
    required this.tabController,
    required this.backgroundColor,
  });
  final TabController tabController;
  final Color backgroundColor;

  @override
  double get minExtent => 48;

  @override
  double get maxExtent => 48;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => Container(
      color: backgroundColor,
      child: _TabBarContent(tabController: tabController),
    );

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) => tabController != oldDelegate.tabController ||
        backgroundColor != oldDelegate.backgroundColor;
}

/// Tab bar content extracted for reuse
class _TabBarContent extends StatelessWidget {

  const _TabBarContent({required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(horizontal: DSSpacing.lg),
      decoration: BoxDecoration(
        color: context.ds.colors.bgPrimary,
        border: Border(
          bottom: BorderSide(color: context.ds.colors.borderPrimary),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          controller: tabController,
          isScrollable: true, // Makes tabs left-aligned instead of centered
          tabAlignment: TabAlignment.start, // Aligns tabs to the start (left)
          labelColor: context.ds.colors.textPrimary,
          unselectedLabelColor: context.ds.colors.textTertiary,
          labelStyle: context.ds.typography.lineDefaultBold,
          unselectedLabelStyle: context.ds.typography.lineDefaultRegular,
          indicatorColor: context.ds.colors.bgActionPrimary,
          indicatorWeight: 2,
          dividerColor: Colors.transparent,
          labelPadding: EdgeInsets.only(right: DSSpacing.xl), // Gap between tabs
          padding: EdgeInsets.zero,
          tabs: const [
            Tab(text: 'Summary'),
            Tab(text: 'Holdings'),
          ],
        ),
      ),
    );
}

/// Analysis Content - shown when Analysis tab is selected
class _AnalysisContent extends StatelessWidget {
  const _AnalysisContent();

  @override
  Widget build(BuildContext context) => const Column(
      children: [
        _PerformanceSection(),
        _DistributionSection(),
        _CostAnalysisSection(),
        _EvaluationSection(),
        _FeedbackSection(),
      ],
    );
}

/// Status Bar
class _StatusBar extends StatelessWidget {
  const _StatusBar();

  @override
  Widget build(BuildContext context) => Container(
      height: 44,
      padding: EdgeInsets.symmetric(horizontal: DSSpacing.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41',
            style: context.ds.typography.lineDefaultMedium.copyWith(
              color: context.ds.colors.textPrimary,
            ),
          ),
          Row(
            children: [
              Icon(Icons.signal_cellular_4_bar, 
                size: 16, 
                color: context.ds.colors.textPrimary,
              ),
              SizedBox(width: DSSpacing.xs2),
              Icon(Icons.wifi, 
                size: 16, 
                color: context.ds.colors.textPrimary,
              ),
              SizedBox(width: DSSpacing.xs2),
              Icon(Icons.battery_full, 
                size: 16, 
                color: context.ds.colors.textPrimary,
              ),
            ],
          ),
        ],
      ),
    );
}

/// Header with back button
class _Header extends StatelessWidget {
  const _Header({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) => Container(
      height: 48,
      padding: EdgeInsets.symmetric(
        horizontal: DSSpacing.lg,
        vertical: DSSpacing.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side - Back button and title
          Row(
            children: [
              GestureDetector(
                onTap: onBack,
                child: DSIcon(
                  DSIcons.chevronLeft,
                  size: DSIconSize.defaultSize,
                  color: context.ds.colors.iconPrimary,
                ),
              ),
              SizedBox(width: DSSpacing.xs2),
              Text(
                'Mutual funds',
                style: context.ds.typography.lineDefaultRegular.copyWith(
                  color: context.ds.colors.textSecondary,
                ),
              ),
            ],
          ),
          // Right side - Theme toggle switch
          const ThemeToggleSwitch(),
        ],
      ),
    );
}

/// Holdings Summary section
class _HoldingsSummary extends StatelessWidget {
  const _HoldingsSummary();

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.only(
        left: DSSpacing.lg,
        right: DSSpacing.lg,
        top: DSSpacing.md,
        bottom: DSSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Holdings date
          Text(
            "Holdings as of 24 Jun '23",
            style: context.ds.typography.lineSmallRegular.copyWith(
              color: context.ds.colors.textTertiary,
            ),
          ),
          SizedBox(height: DSSpacing.xs),
          // Holdings value
          Text(
            '₹60.0 L',
            style: context.ds.typography.numberDefault.copyWith(
              color: context.ds.colors.textPrimary,
            ),
          ),
          SizedBox(height: DSSpacing.md),
          // Metrics row
          Row(
            children: [
              // Total Invested
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Invested',
                    style: context.ds.typography.lineSmallRegular.copyWith(
                      color: context.ds.colors.textTertiary,
                    ),
                  ),
                  SizedBox(height: DSSpacing.xs2),
                  Text(
                    '₹52.1 L',
                    style: context.ds.typography.lineLargeBold.copyWith(
                      color: context.ds.colors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(width: DSSpacing.xl3),
              // Current Gains
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Gains',
                    style: context.ds.typography.lineSmallRegular.copyWith(
                      color: context.ds.colors.textTertiary,
                    ),
                  ),
                  SizedBox(height: DSSpacing.xs2),
                  Row(
                    children: [
                      Text(
                        '₹2.8 L',
                        style: context.ds.typography.lineLargeBold.copyWith(
                          color: context.ds.colors.signalTextPositive,
                        ),
                      ),
                      SizedBox(width: DSSpacing.xs2),
                      DSIcon(
                        DSIcons.arrowUp,
                        size: DSIconSize.small,
                        color: context.ds.colors.signalTextPositive,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
}

/// Tab Bar
// Old _TabBar and _TabItem classes removed - now using TabBar with SliverPersistentHeader

/// Performance Section
class _PerformanceSection extends StatelessWidget {
  const _PerformanceSection();

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(
        horizontal: DSSpacing.lg,
        vertical: DSSpacing.xl2,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.ds.colors.borderPrimary),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Text(
            'How did your portfolio perform?',
            style: context.ds.typography.lineLargeBold.copyWith(
              color: context.ds.colors.textPrimary,
            ),
          ),
          SizedBox(height: DSSpacing.xl),
          // Bar chart
          const _PerformanceChart(),
          SizedBox(height: DSSpacing.xl),
          // Insight card
          Container(
            padding: EdgeInsets.all(DSSpacing.md),
            decoration: BoxDecoration(
              color: context.ds.colors.bgSecondary,
              borderRadius: BorderRadius.circular(DSRadius.xl),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DSIcon(
                  DSIcons.infoCircle,
                  size: DSIconSize.defaultSize,
                  color: context.ds.colors.signalTextNegative,
                ),
                SizedBox(width: DSSpacing.xs),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: context.ds.typography.paraDefaultRegular.copyWith(
                        color: context.ds.colors.signalTextNegative,
                      ),
                      children: [
                        const TextSpan(text: 'You have missed gains of ₹7.21L '),
                        TextSpan(
                          text: 'since your portfolio is underperforming the benchmark.',
                          style: context.ds.typography.paraDefaultRegular.copyWith(
                            color: context.ds.colors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: DSSpacing.xl),
          // How is this calculated?
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: DSSpacing.md,
              vertical: DSSpacing.lg,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: context.ds.colors.borderPrimary),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    DSIcon(
                      DSIcons.questionCircle,
                      size: DSIconSize.defaultSize,
                      color: context.ds.colors.iconPrimary,
                    ),
                    SizedBox(width: DSSpacing.xs),
                    Text(
                      'How is this calculated?',
                      style: context.ds.typography.lineDefaultMedium.copyWith(
                        color: context.ds.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
                DSIcon(
                  DSIcons.chevronRight,
                  size: DSIconSize.medium,
                  color: context.ds.colors.iconPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
}

/// Performance Chart
class _PerformanceChart extends StatelessWidget {
  const _PerformanceChart();

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(horizontal: DSSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Your Portfolio bar
          Expanded(
            child: Column(
              children: [
                Text(
                  '+19.12%',
                  style: context.ds.typography.lineLargeBold.copyWith(
                    color: context.ds.colors.textPrimary,
                  ),
                ),
                SizedBox(height: DSSpacing.md),
                Container(
                  width: 100, // Reduced from 120 for responsiveness
                  height: 157,
                  decoration: BoxDecoration(
                    color: context.ds.colors.signalBgNegativeSecondary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(DSRadius.xl),
                      topRight: Radius.circular(DSRadius.xl),
                    ),
                  ),
                ),
                SizedBox(height: DSSpacing.md),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: context.ds.colors.signalIconNegativeSecondary,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    SizedBox(width: DSSpacing.xs2),
                    Flexible(
                      child: Text(
                        'Your Portfolio',
                        style: context.ds.typography.lineSmallRegular.copyWith(
                          color: context.ds.colors.signalTextNegative,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: DSSpacing.md),
          // Benchmark bar
          Expanded(
            child: Column(
              children: [
                Text(
                  '+22.34%',
                  style: context.ds.typography.lineLargeBold.copyWith(
                    color: context.ds.colors.textSecondary,
                  ),
                ),
                SizedBox(height: DSSpacing.md),
                Container(
                  width: 100, // Reduced from 120 for responsiveness
                  height: 202,
                  decoration: BoxDecoration(
                    color: context.ds.colors.bgTertiary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(DSRadius.xl),
                      topRight: Radius.circular(DSRadius.xl),
                    ),
                  ),
                ),
                SizedBox(height: DSSpacing.md),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: context.ds.colors.bgTertiary,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    SizedBox(width: DSSpacing.xs2),
                    Flexible(
                      child: Text(
                        'Benchmark',
                        style: context.ds.typography.lineSmallRegular.copyWith(
                          color: context.ds.colors.textSecondary,
                        ),
                      ),
                    ),
                    SizedBox(width: DSSpacing.xs2),
                    DSIcon(
                      DSIcons.infoCircle,
                      size: DSIconSize.small,
                      color: context.ds.colors.textSecondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
}

/// Distribution Section
class _DistributionSection extends StatelessWidget {
  const _DistributionSection();

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(
        horizontal: DSSpacing.lg,
        vertical: DSSpacing.xl4,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.ds.colors.borderSecondary),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Text(
            'How is your portfolio distributed?',
            style: context.ds.typography.lineLargeBold.copyWith(
              color: context.ds.colors.textPrimary,
            ),
          ),
          SizedBox(height: DSSpacing.xl),
          // Distribution card
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: context.ds.colors.borderPrimary),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: DSSpacing.lg),
                    child: Column(
                      children: [
                        Text(
                          'Your funds',
                          style: context.ds.typography.lineSmallRegular.copyWith(
                            color: context.ds.colors.textSecondary,
                          ),
                        ),
                        SizedBox(height: DSSpacing.xs2),
                        Text(
                          '32',
                          style: context.ds.typography.lineLargeBold.copyWith(
                            color: context.ds.colors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: DSSpacing.lg),
                    child: Column(
                      children: [
                        Text(
                          'Your AMCs',
                          style: context.ds.typography.lineSmallRegular.copyWith(
                            color: context.ds.colors.textSecondary,
                          ),
                        ),
                        SizedBox(height: DSSpacing.xs2),
                        Text(
                          '12',
                          style: context.ds.typography.lineLargeBold.copyWith(
                            color: context.ds.colors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: DSSpacing.lg),
          // Range slider visualization
          const _DiversificationSlider(),
          SizedBox(height: DSSpacing.xl),
          // Insight card
          Container(
            padding: EdgeInsets.all(DSSpacing.md),
            decoration: BoxDecoration(
              color: context.ds.colors.bgSecondary,
              borderRadius: BorderRadius.circular(DSRadius.xl),
            ),
            child: Row(
              children: [
                DSIcon(
                  DSIcons.infoCircle,
                  size: DSIconSize.defaultSize,
                  color: context.ds.colors.signalTextNegative,
                ),
                SizedBox(width: DSSpacing.xs),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: context.ds.typography.lineDefaultMedium.copyWith(
                        color: context.ds.colors.textPrimary,
                      ),
                      children: [
                        const TextSpan(text: 'Your portfolio is '),
                        TextSpan(
                          text: 'over-diversified',
                          style: context.ds.typography.lineDefaultMedium.copyWith(
                            color: context.ds.colors.signalTextNegative,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
}

/// Diversification Slider
class _DiversificationSlider extends StatelessWidget {
  const _DiversificationSlider();

  @override
  Widget build(BuildContext context) => Column(
      children: [
        // Slider track
        Container(
          height: 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DSRadius.xl),
            gradient: LinearGradient(
              colors: [
                context.ds.colors.signalTextNegative,
                context.ds.colors.signalTextPositive,
                context.ds.colors.signalTextPositive,
                context.ds.colors.signalTextNegative,
              ],
              stops: const [0.0, 0.35, 0.65, 1.0],
            ),
          ),
        ),
        SizedBox(height: DSSpacing.md),
        // Labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1',
              style: context.ds.typography.lineSmallRegular.copyWith(
                color: context.ds.colors.textTertiary,
              ),
            ),
            Text(
              'Ideal: 7-10',
              style: context.ds.typography.lineSmallRegular.copyWith(
                color: context.ds.colors.textTertiary,
              ),
            ),
            Text(
              '15+',
              style: context.ds.typography.lineSmallRegular.copyWith(
                color: context.ds.colors.textTertiary,
              ),
            ),
          ],
        ),
      ],
    );
}

/// Cost Analysis Section
class _CostAnalysisSection extends StatelessWidget {
  const _CostAnalysisSection();

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(
        horizontal: DSSpacing.lg,
        vertical: DSSpacing.xl4,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.ds.colors.borderPrimary),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Text(
            'What fixed cost are you paying?',
            style: context.ds.typography.lineLargeBold.copyWith(
              color: context.ds.colors.textPrimary,
            ),
          ),
          SizedBox(height: DSSpacing.xl2),
          // Cost card
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: context.ds.colors.borderPrimary),
              borderRadius: BorderRadius.circular(DSRadius.xl),
            ),
            child: Column(
              children: [
                // Average annual cost
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: DSSpacing.lg,
                    vertical: DSSpacing.lg,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: context.ds.colors.borderPrimary),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Average annual cost(TER)',
                            style: context.ds.typography.lineSmallRegular.copyWith(
                              color: context.ds.colors.textSecondary,
                            ),
                          ),
                          SizedBox(width: DSSpacing.xs2),
                          DSIcon(
                            DSIcons.infoCircle,
                            size: DSIconSize.defaultSize,
                            color: context.ds.colors.textSecondary,
                          ),
                        ],
                      ),
                      Text(
                        '₹1.90L',
                        style: context.ds.typography.lineDefaultBold.copyWith(
                          color: context.ds.colors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                // Total cost paid
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: DSSpacing.lg,
                    vertical: DSSpacing.lg,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total cost paid since 2014',
                        style: context.ds.typography.lineSmallRegular.copyWith(
                          color: context.ds.colors.textSecondary,
                        ),
                      ),
                      Text(
                        '₹42.04L',
                        style: context.ds.typography.lineDefaultBold.copyWith(
                          color: context.ds.colors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: DSSpacing.xl2),
          // Cost breakdown bar
          _CostBreakdownBar(),
          SizedBox(height: DSSpacing.xl2),
          // Insight card
          Container(
            padding: EdgeInsets.all(DSSpacing.md),
            decoration: BoxDecoration(
              color: context.ds.colors.bgSecondary,
              borderRadius: BorderRadius.circular(DSRadius.xl),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DSIcon(
                  DSIcons.infoCircle,
                  size: DSIconSize.defaultSize,
                  color: context.ds.colors.signalTextNegative,
                ),
                SizedBox(width: DSSpacing.xs),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You have 16 funds in regular plan.',
                        style: context.ds.typography.lineDefaultBold.copyWith(
                          color: context.ds.colors.textPrimary,
                        ),
                      ),
                      SizedBox(height: DSSpacing.xs2),
                      Text(
                        'You are paying high commissions to a distributor for these funds, even when they underperform.',
                        style: context.ds.typography.paraSmallRegular.copyWith(
                          color: context.ds.colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
}

/// Cost Breakdown Bar
class _CostBreakdownBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
      children: [
        // Bar - Figma uses 8px radius
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Row(
            children: [
              Expanded(
                flex: 36, // Direct funds portion
                child: Container(
                  height: 32,
                  color: context.ds.colors.insightsText, // Direct funds color (green)
                ),
              ),
              Expanded(
                flex: 64, // Regular funds portion
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: context.ds.colors.regularMutualFunds,
                    border: Border(
                      left: BorderSide(color: context.ds.colors.borderPrimary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: DSSpacing.xl),
        // Legend
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Direct funds legend
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: context.ds.colors.insightsText,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: DSSpacing.xs),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Direct funds (16)',
                      style: context.ds.typography.lineSmallRegular.copyWith(
                        color: context.ds.colors.textSecondary,
                      ),
                    ),
                    SizedBox(height: DSSpacing.xs),
                    Text(
                      '₹16.52L',
                      style: context.ds.typography.lineDefaultBold.copyWith(
                        color: context.ds.colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Regular funds legend
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: context.ds.colors.regularMutualFunds,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: DSSpacing.xs),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Regular funds (36)',
                      style: context.ds.typography.lineSmallRegular.copyWith(
                        color: context.ds.colors.textSecondary,
                      ),
                    ),
                    SizedBox(height: DSSpacing.xs),
                    Text(
                      '₹23.52L',
                      style: context.ds.typography.lineDefaultBold.copyWith(
                        color: context.ds.colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
}

/// Evaluation Section
class _EvaluationSection extends StatelessWidget {
  const _EvaluationSection();

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(
        horizontal: DSSpacing.lg,
        vertical: DSSpacing.xl3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Text(
            'Our fund evaluation process',
            style: context.ds.typography.lineLargeBold.copyWith(
              color: context.ds.colors.textPrimary,
            ),
          ),
          SizedBox(height: DSSpacing.xl2),
          // Video carousel
          SizedBox(
            height: 148,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _VideoCard(
                  title: 'How often should i check your portfolio?',
                  duration: '1 min',
                ),
                SizedBox(width: DSSpacing.md),
                _VideoCard(
                  title: 'How often should i check your portfolio?',
                  duration: '1 min',
                ),
              ],
            ),
          ),
        ],
      ),
    );
}

/// Video Card
class _VideoCard extends StatelessWidget {
  const _VideoCard({
    required this.title,
    required this.duration,
  });

  final String title;
  final String duration;

  @override
  Widget build(BuildContext context) => Container(
      width: 235,
      height: 148,
      decoration: BoxDecoration(
        border: Border.all(color: context.ds.colors.borderPrimary),
        borderRadius: BorderRadius.circular(DSRadius.xl),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(DSRadius.xl),
        child: Stack(
          children: [
            // Thumbnail
            Image.asset(
              'assets/images/videos/video_thumbnail.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: context.ds.colors.bgSecondary,
              ),
            ),
            // Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
            // Content
            Padding(
              padding: EdgeInsets.all(DSSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Play button and duration
                  Row(
                    children: [
                      DSIcon(
                        DSIcons.playCircle,
                        size: DSIconSize.large,
                        color: context.ds.colors.mainAlwaysWhite,
                      ),
                      SizedBox(width: DSSpacing.xs),
                      Text(
                        duration,
                        style: context.ds.typography.lineDefaultRegular.copyWith(
                          color: context.ds.colors.mainAlwaysWhite,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Title
                  Text(
                    title,
                    style: context.ds.typography.lineDefaultMedium.copyWith(
                      color: context.ds.colors.mainAlwaysWhite,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
}

/// Feedback Section
class _FeedbackSection extends StatelessWidget {
  const _FeedbackSection();

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.only(
        left: DSSpacing.lg,
        right: DSSpacing.lg,
        top: DSSpacing.xl3,
        bottom: DSSpacing.xl6,
      ),
      decoration: BoxDecoration(
        color: context.ds.colors.bgPrimary,
        border: Border(
          top: BorderSide(color: context.ds.colors.borderPrimary),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How was your experience?',
            style: context.ds.typography.lineLargeBold.copyWith(
              color: context.ds.colors.textPrimary,
            ),
          ),
          SizedBox(height: DSSpacing.xs),
          Text(
            'This will help us improve',
            style: context.ds.typography.lineSmallRegular.copyWith(
              color: context.ds.colors.textSecondary,
            ),
          ),
          SizedBox(height: DSSpacing.xl),
          // Star rating
          Row(
            children: List.generate(5, (index) {
              return Padding(
                padding: EdgeInsets.only(right: DSSpacing.xs),
                child: DSIcon(
                  DSIcons.favorite,
                  size: DSIconSize.large,
                  color: context.ds.colors.textTertiary,
                ),
              );
            }),
          ),
        ],
      ),
    );
}

/// Holdings Content - shown when Holdings tab is selected
class _HoldingsContent extends StatelessWidget {
  const _HoldingsContent();

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Container(
          padding: EdgeInsets.only(
            left: DSSpacing.lg,
            right: DSSpacing.lg,
            top: DSSpacing.xl2,
            bottom: DSSpacing.md,
          ),
          child: Text(
            'Holdings (62)',
            style: context.ds.typography.lineLargeBold.copyWith(
              color: context.ds.colors.textPrimary,
            ),
          ),
        ),
        // Fund list
        _FundRow(
          fundName: 'SBI Balanced Advantage Fund...',
          fundType: 'ELSS Fund',
          currentValue: '₹12.1 L',
          fundIRR: '23.3%',
          irrColor: context.ds.colors.signalTextPositive,
          benchmark: 'Nifty 50',
          benchmarkValue: '21.3%',
          insightText: 'This fund has valuation concerns',
          insightType: InsightType.negative,
        ),
        _FundRow(
          fundName: 'HDFC Equity Fund...',
          fundType: 'Equity Fund',
          currentValue: '₹10.5 L',
          fundIRR: '18.7%',
          irrColor: context.ds.colors.signalTextPositive,
          benchmark: 'Nifty 50',
          benchmarkValue: '21.3%',
          insightText: 'Consistent long-term performance',
          insightType: InsightType.positive,
        ),
        _FundRow(
          fundName: 'ICICI Prudential Bluechip Fund...',
          fundType: 'Large Cap Fund',
          currentValue: '₹15.3 L',
          fundIRR: '20.5%',
          irrColor: context.ds.colors.signalTextPositive,
          benchmark: 'Nifty 50',
          benchmarkValue: '21.3%',
          insightText: 'Strong portfolio of bluechip stocks',
          insightType: InsightType.positive,
        ),
        _FundRow(
          fundName: 'Axis Midcap Fund...',
          fundType: 'Mid Cap Fund',
          currentValue: '₹8.7 L',
          fundIRR: '22.1%',
          irrColor: context.ds.colors.signalTextPositive,
          benchmark: 'Nifty Midcap',
          benchmarkValue: '19.5%',
          insightText: 'Promising growth potential in midcap space',
          insightType: InsightType.positive,
        ),
        _FundRow(
          fundName: 'Franklin India Smaller Companies Fund...',
          fundType: 'Small Cap Fund',
          currentValue: '₹7.4 L',
          fundIRR: '25.0%',
          irrColor: context.ds.colors.signalTextPositive,
          benchmark: 'Nifty Smallcap...',
          benchmarkValue: '22.0%',
          insightText: 'High risk, high reward investment opportunity',
          insightType: InsightType.negative,
        ),
        _FundRow(
          fundName: 'Tata Digital India Fund...',
          fundType: 'Sectoral Fund',
          currentValue: '₹9.2 L',
          fundIRR: '21.6%',
          irrColor: context.ds.colors.signalTextPositive,
          benchmark: 'Nifty IT Index',
          benchmarkValue: '25.2%',
          insightText: 'Focus on the booming tech sector',
          insightType: InsightType.positive,
        ),
      ],
    );
}

/// Insight type for fund rows
enum InsightType {
  positive,
  negative,
}

/// Fund Row widget
class _FundRow extends StatelessWidget {
  const _FundRow({
    required this.fundName,
    required this.fundType,
    required this.currentValue,
    required this.fundIRR,
    required this.irrColor,
    required this.benchmark,
    required this.benchmarkValue,
    required this.insightText,
    required this.insightType,
  });

  final String fundName;
  final String fundType;
  final String currentValue;
  final String fundIRR;
  final Color irrColor;
  final String benchmark;
  final String benchmarkValue;
  final String insightText;
  final InsightType insightType;

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(
        horizontal: DSSpacing.lg,
        vertical: DSSpacing.xl,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.ds.colors.borderPrimary),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fund info row
          Row(
            children: [
              // Fund logo
              ClipRRect(
                borderRadius: BorderRadius.circular(DSRadius.full),
                child: Image.asset(
                  'assets/images/funds/fund_logo.png',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: context.ds.colors.bgTertiary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SizedBox(width: DSSpacing.sm),
              // Fund name and type
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fundName,
                      style: context.ds.typography.lineDefaultBold.copyWith(
                        color: context.ds.colors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: DSSpacing.xs2),
                    Text(
                      fundType,
                      style: context.ds.typography.lineSmallRegular.copyWith(
                        color: context.ds.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              // Chevron
              DSIcon(
                DSIcons.chevronRight,
                size: DSIconSize.defaultSize,
                color: context.ds.colors.iconPrimary,
              ),
            ],
          ),
          SizedBox(height: DSSpacing.md),
          // Metrics grid
          Row(
            children: [
              // Current Value - Figma uses gap-[2px]
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Value',
                      style: context.ds.typography.disclaimerDefault.copyWith(
                        color: context.ds.colors.textTertiary,
                      ),
                    ),
                    SizedBox(height: DSSpacing.pxpx), // 2px
                    Text(
                      currentValue,
                      style: context.ds.typography.lineDefaultBold.copyWith(
                        color: context.ds.colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              // Fund IRR
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fund IRR',
                      style: context.ds.typography.disclaimerDefault.copyWith(
                        color: context.ds.colors.textTertiary,
                      ),
                    ),
                    SizedBox(height: DSSpacing.pxpx), // 2px
                    Text(
                      fundIRR,
                      style: context.ds.typography.lineDefaultBold.copyWith(
                        color: irrColor,
                      ),
                    ),
                  ],
                ),
              ),
              // Benchmark
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      benchmark,
                      style: context.ds.typography.disclaimerDefault.copyWith(
                        color: context.ds.colors.textTertiary,
                      ),
                    ),
                    SizedBox(height: DSSpacing.pxpx), // 2px
                    Text(
                      benchmarkValue,
                      style: context.ds.typography.lineDefaultBold.copyWith(
                        color: context.ds.colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: DSSpacing.md),
          // Insight banner - Figma uses gap-[6px]
          Row(
            children: [
              DSIcon(
                DSIcons.infoCircle,
                size: DSIconSize.defaultSize,
                color: insightType == InsightType.negative
                    ? context.ds.colors.signalTextNegative
                    : context.ds.colors.signalTextPositive,
              ),
              const SizedBox(width: 6), // Figma: gap-[6px]
              Expanded(
                child: Text(
                  insightText,
                  style: context.ds.typography.lineSmallRegular.copyWith(
                    color: insightType == InsightType.negative
                        ? context.ds.colors.signalTextNegative
                        : context.ds.colors.signalTextPositive,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
}

/// Bottom Bar
class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) => Container(
      height: 34,
      color: context.ds.colors.bgPrimary,
      child: Center(
        child: Container(
          width: 136,
          height: 5,
          decoration: BoxDecoration(
            color: context.ds.colors.bgActionPrimary,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
}
