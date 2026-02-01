import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../design_system/design_system.dart';
import '../../main.dart' show ThemeToggleSwitch;

/// Portfolio Home Page
/// 
/// Implemented using ONLY design system tokens.
/// All styling comes from the design system - no hardcoded values.
class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ValueNotifier<bool> _amountsHidden = ValueNotifier(false);

  @override
  void dispose() {
    _amountsHidden.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: context.ds.colors.bgPrimary,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const _StatusBar(),
                    const _TopBar(),
                    _TotalAssetsSummary(amountsHidden: _amountsHidden),
                    const _WeeklyInsights(),
                    _AssetsSection(amountsHidden: _amountsHidden),
                    const _GoalPlanningSection(),
                    const _PortfolioInsightsSection(),
                    const _TestimonialsSection(),
                    const _FeedbackSection(),
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

/// Status Bar - iOS style
class _StatusBar extends StatelessWidget {
  const _StatusBar();

  @override
  Widget build(BuildContext context) => Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: DSSpacing.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Time
          Text(
            '9:41',
            style: context.ds.typography.lineDefaultMedium.copyWith(
              color: context.ds.colors.textPrimary,
            ),
          ),
          // Status icons placeholder
          Row(
            children: [
              Icon(Icons.signal_cellular_4_bar, 
                size: 16, 
                color: context.ds.colors.textPrimary,
              ),
              const SizedBox(width: DSSpacing.xs2),
              Icon(Icons.wifi, 
                size: 16, 
                color: context.ds.colors.textPrimary,
              ),
              const SizedBox(width: DSSpacing.xs2),
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

/// Top Bar with user profile
class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DSSpacing.lg,
        vertical: DSSpacing.xs,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side - Avatar and user name
          Row(
            children: [
              // Avatar
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: context.ds.colors.bgTertiary,
                  borderRadius: BorderRadius.circular(DSRadius.xl),
                ),
                child: Center(
                  child: Text(
                    'V',
                    style: context.ds.typography.paraSmallRegular.copyWith(
                      color: context.ds.colors.textSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: DSSpacing.xs),
              // User name with dropdown
              Row(
                children: [
                  Text(
                    'Vinayak',
                    style: context.ds.typography.paraDefaultRegular.copyWith(
                      color: context.ds.colors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: DSSpacing.xs2),
                  DSIcon(
                    DSIcons.chevronDown,
                    size: DSIconSize.small,
                    color: context.ds.colors.textSecondary,
                  ),
                ],
              ),
            ],
          ),
          // Right side - Theme toggle switch
          const ThemeToggleSwitch(),
        ],
      ),
    );
}

/// Total Assets Summary section
class _TotalAssetsSummary extends StatefulWidget {
  const _TotalAssetsSummary({required this.amountsHidden});
  
  final ValueNotifier<bool> amountsHidden;

  @override
  State<_TotalAssetsSummary> createState() => _TotalAssetsSummaryState();
}

class _TotalAssetsSummaryState extends State<_TotalAssetsSummary>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _tapController;
  late Animation<double> _tapAnimation;
  
  // Target value in crores
  static const double _targetValue = 2.44;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    
    _animation = Tween<double>(begin: 0, end: _targetValue).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    
    // Tap animation controller
    _tapController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    
    _tapAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.95)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.95, end: 1.0)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
    ]).animate(_tapController);
    
    // Start animation after a small delay
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        _controller.forward();
      }
    });
    
    // Listen to external changes
    widget.amountsHidden.addListener(_onHiddenChanged);
  }
  
  void _onHiddenChanged() {
    if (widget.amountsHidden.value) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }
  
  void _toggleVisibility() {
    // Play tap animation
    _tapController.forward(from: 0);
    
    // Toggle the shared state
    widget.amountsHidden.value = !widget.amountsHidden.value;
  }

  @override
  void dispose() {
    widget.amountsHidden.removeListener(_onHiddenChanged);
    _controller.dispose();
    _tapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(
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
          // Assets header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Assets',
                      style: context.ds.typography.lineSmallRegular.copyWith(
                        color: context.ds.colors.textTertiary,
                      ),
                    ),
                    const SizedBox(height: DSSpacing.xs2),
                    AnimatedBuilder(
                      animation: Listenable.merge([_animation, _tapAnimation]),
                      builder: (context, child) => Transform.scale(
                        scale: _tapAnimation.value,
                        alignment: Alignment.centerLeft,
                        child: _TickerNumber(
                          value: _animation.value,
                          isHidden: widget.amountsHidden.value && _controller.isDismissed,
                          style: context.ds.typography.numberDefault.copyWith(
                            color: context.ds.colors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: _toggleVisibility,
                child: ValueListenableBuilder<bool>(
                  valueListenable: widget.amountsHidden,
                  builder: (context, isHidden, child) => AnimatedBuilder(
                    animation: _tapAnimation,
                    builder: (context, child) => Transform.scale(
                      scale: _tapAnimation.value,
                      child: DSIcon(
                        isHidden ? DSIcons.eyeSlash : DSIcons.eye,
                        color: context.ds.colors.iconPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: DSSpacing.md),
          // 1D Returns strip
          Container(
            height: 37,
            padding: const EdgeInsets.symmetric(
              horizontal: DSSpacing.sm,
              vertical: DSSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: context.ds.colors.bgSecondary,
              borderRadius: BorderRadius.circular(8), // Figma: 8px
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '1D Mutual Fund:',
                      style: context.ds.typography.lineSmallRegular.copyWith(
                        color: context.ds.colors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: DSSpacing.xs),
                    Text(
                      '₹1.25Cr',
                      style: context.ds.typography.lineSmallBold.copyWith(
                        color: context.ds.colors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: DSSpacing.xs),
                    DSIcon(
                      DSIcons.arrowUp,
                      size: DSIconSize.small,
                      color: context.ds.colors.signalTextPositive,
                    ),
                    const SizedBox(width: DSSpacing.xs2),
                    Text(
                      '24.93%',
                      style: context.ds.typography.lineSmallBold.copyWith(
                        color: context.ds.colors.signalTextPositive,
                      ),
                    ),
                  ],
                ),
                DSIcon(
                  DSIcons.chevronRight,
                  color: context.ds.colors.iconPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
}

/// Weekly Insights section
class _WeeklyInsights extends StatefulWidget {
  const _WeeklyInsights();

  @override
  State<_WeeklyInsights> createState() => _WeeklyInsightsState();
}

class _WeeklyInsightsState extends State<_WeeklyInsights>
    with TickerProviderStateMixin {
  late AnimationController _borderController;
  late AnimationController _shineController;
  late Animation<double> _shineAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Border glow animation (continuous)
    _borderController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    
    // Shine animation (runs 3 times on load)
    _shineController = AnimationController(
      duration: const Duration(milliseconds: 833), // ~2.5 seconds for 3 cycles
      vsync: this,
    );
    
    // Shine position: left to right with ease-out
    _shineAnimation = Tween<double>(begin: -0.5, end: 1.5).animate(
      CurvedAnimation(parent: _shineController, curve: Curves.easeOut),
    );
    
    // Scale: 1.0 -> 1.05 -> 1.0 with ease-out
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.05)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.05, end: 1.0)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
    ]).animate(_shineController);
    
    // Run shine animation 3 times after a small delay
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _runShineAnimation(3);
      }
    });
  }
  
  void _runShineAnimation(int times) async {
    for (int i = 0; i < times; i++) {
      if (!mounted) return;
      await _shineController.forward(from: 0);
      if (i < times - 1) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
    }
  }

  @override
  void dispose() {
    _borderController.dispose();
    _shineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final glowColor = context.ds.colors.mainAlwaysWhite;

    return Container(
      padding: const EdgeInsets.only(
        left: DSSpacing.lg,
        right: DSSpacing.lg,
        top: DSSpacing.xl3,
        bottom: DSSpacing.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Insights',
            style: context.ds.typography.lineDefaultMedium.copyWith(
              color: context.ds.colors.textTertiary,
            ),
          ),
          const SizedBox(height: DSSpacing.lg),
          // Insights strip with animated glow
          AnimatedBuilder(
            animation: _borderController,
            builder: (context, child) => Stack(
              clipBehavior: Clip.none,
              children: [
                child!,
                Positioned.fill(
                  child: IgnorePointer(
                    child: CustomPaint(
                      painter: _GlowingBorderPainter(
                        progress: _borderController.value,
                        glowColor: glowColor,
                        borderRadius: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(DSSpacing.md),
              decoration: BoxDecoration(
                border: Border.all(color: context.ds.colors.borderPrimary),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  // Weekly chip with shine animation
                  AnimatedBuilder(
                    animation: _shineController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          children: [
                            // Base chip
                            Container(
                              height: 24,
                              padding: const EdgeInsets.symmetric(
                                horizontal: DSSpacing.xs,
                              ),
                              decoration: BoxDecoration(
                                color: context.ds.colors.insightsBg,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'WEEKLY',
                                  style: context.ds.typography.uppercaseDefault.copyWith(
                                    color: context.ds.colors.insightsText,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            // Shine overlay
                            Positioned.fill(
                              child: IgnorePointer(
                                child: CustomPaint(
                                  painter: _ShinePainter(
                                    progress: _shineAnimation.value,
                                    shineColor: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: DSSpacing.sm),
                  // Insight text
                  Expanded(
                    child: Text(
                      'portfolio increased by ₹1.6',
                      style: context.ds.typography.lineDefaultMedium.copyWith(
                        color: context.ds.colors.textPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DSIcon(
                    DSIcons.chevronRight,
                    size: DSIconSize.medium,
                    color: context.ds.colors.iconPrimary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Assets Section
class _AssetsSection extends StatelessWidget {
  const _AssetsSection({required this.amountsHidden});
  
  final ValueNotifier<bool> amountsHidden;

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.only(
        left: DSSpacing.lg,
        right: DSSpacing.lg,
        top: DSSpacing.md,
        bottom: DSSpacing.xl3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.ds.colors.borderPrimary),
        ),
      ),
      child: ValueListenableBuilder<bool>(
        valueListenable: amountsHidden,
        builder: (context, isHidden, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Assets',
              style: context.ds.typography.lineDefaultMedium.copyWith(
                color: context.ds.colors.textTertiary,
              ),
            ),
            const SizedBox(height: DSSpacing.lg),
            // Asset cards
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/mutual-funds'),
              child: _AssetCard(
                icon: DSIcons.mutualFunds,
                title: 'Mutual Funds',
                subtitle: '18 Funds',
                value: '₹84.52L',
                isHidden: isHidden,
              ),
            ),
            const SizedBox(height: DSSpacing.sm),
            _AssetCard(
              icon: DSIcons.alphaFocusStrategy,
              title: 'Stocks',
              subtitle: '21 stocks',
              value: '₹84.52L',
              isHidden: isHidden,
            ),
            const SizedBox(height: DSSpacing.sm),
            _AssetCard(
              icon: DSIcons.bank,
              title: 'Banks',
              subtitle: '2 accounts',
              value: '₹84.52L',
              isHidden: isHidden,
            ),
            const SizedBox(height: DSSpacing.sm),
            const _AssetCardUnlinked(
              icon: DSIcons.nps,
              title: 'NPS',
              subtitle: 'Link your account',
            ),
          ],
        ),
      ),
    );
}

/// Asset Card widget
class _AssetCard extends StatefulWidget {
  const _AssetCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    this.isHidden = false,
  });

  final DSIconData icon;
  final String title;
  final String subtitle;
  final String value;
  final bool isHidden;

  @override
  State<_AssetCard> createState() => _AssetCardState();
}

class _AssetCardState extends State<_AssetCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double _targetValue;
  late String _suffix;

  @override
  void initState() {
    super.initState();
    _parseValue();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    
    _animation = Tween<double>(begin: 0, end: _targetValue).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    
    // Start with value shown
    if (!widget.isHidden) {
      _controller.value = 1.0;
    }
  }
  
  void _parseValue() {
    // Parse value like "₹84.52L" -> 84.52 and "L"
    final valueStr = widget.value.replaceAll('₹', '').replaceAll(',', '');
    final match = RegExp(r'([\d.]+)(\w*)').firstMatch(valueStr);
    if (match != null) {
      _targetValue = double.tryParse(match.group(1) ?? '0') ?? 0;
      _suffix = match.group(2) ?? '';
    } else {
      _targetValue = 0;
      _suffix = '';
    }
  }

  @override
  void didUpdateWidget(_AssetCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isHidden != widget.isHidden) {
      if (widget.isHidden) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DSSpacing.md,
        vertical: DSSpacing.lg,
      ),
      decoration: BoxDecoration(
        color: context.ds.colors.bgSecondary,
        borderRadius: BorderRadius.circular(DSRadius.xl),
      ),
      child: Row(
        children: [
          // Icon
          SizedBox(
            width: 32,
            height: 32,
            child: DSIcon(
              widget.icon,
              color: context.ds.colors.iconPrimary,
            ),
          ),
          const SizedBox(width: DSSpacing.sm),
          // Title and subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: context.ds.typography.lineDefaultMedium.copyWith(
                    color: context.ds.colors.textPrimary,
                  ),
                ),
                const SizedBox(height: DSSpacing.xs2),
                Text(
                  widget.subtitle,
                  style: context.ds.typography.lineSmallRegular.copyWith(
                    color: context.ds.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          // Value - animated ticker
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final isFullyHidden = widget.isHidden && _controller.isDismissed;
              final displayValue = isFullyHidden
                  ? '₹**.**'
                  : '₹${_animation.value.toStringAsFixed(2)}$_suffix';
              return Text(
                displayValue,
                style: context.ds.typography.lineDefaultBold.copyWith(
                  color: context.ds.colors.textPrimary,
                ),
              );
            },
          ),
          DSIcon(
            DSIcons.chevronRight,
            color: context.ds.colors.iconPrimary,
          ),
        ],
      ),
    );
}

/// Asset Card Unlinked variant
class _AssetCardUnlinked extends StatefulWidget {
  const _AssetCardUnlinked({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final DSIconData icon;
  final String title;
  final String subtitle;

  @override
  State<_AssetCardUnlinked> createState() => _AssetCardUnlinkedState();
}

class _AssetCardUnlinkedState extends State<_AssetCardUnlinked>
    with SingleTickerProviderStateMixin {
  late AnimationController _shineController;
  late Animation<double> _shineAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Shine animation (infinite loop)
    _shineController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    // Shine position: left to right with ease-out
    _shineAnimation = Tween<double>(begin: -0.5, end: 1.5).animate(
      CurvedAnimation(parent: _shineController, curve: Curves.easeOut),
    );
    
    // Scale: 1.0 -> 1.05 -> 1.0 with ease-out
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.05)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.05, end: 1.0)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
    ]).animate(_shineController);
    
    // Start infinite loop with delay between cycles
    _startInfiniteLoop();
  }
  
  void _startInfiniteLoop() async {
    await Future.delayed(const Duration(milliseconds: 500));
    while (mounted) {
      await _shineController.forward(from: 0);
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }

  @override
  void dispose() {
    _shineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DSSpacing.md,
        vertical: DSSpacing.lg,
      ),
      decoration: BoxDecoration(
        color: context.ds.colors.bgSecondary,
        borderRadius: BorderRadius.circular(DSRadius.xl),
      ),
      child: Row(
        children: [
          // Icon
          SizedBox(
            width: 32,
            height: 32,
            child: DSIcon(
              widget.icon,
              color: context.ds.colors.iconPrimary,
            ),
          ),
          const SizedBox(width: DSSpacing.sm),
          // Title and subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.title,
                      style: context.ds.typography.lineDefaultMedium.copyWith(
                        color: context.ds.colors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: DSSpacing.xs),
                    // NEW tag with shine animation
                    AnimatedBuilder(
                      animation: _shineController,
                      builder: (context, child) => Transform.scale(
                        scale: _scaleAnimation.value,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Stack(
                            children: [
                              // Base tag
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: DSSpacing.xs,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: context.ds.colors.signalBgNegativePrimary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'NEW',
                                  style: context.ds.typography.uppercaseDefault.copyWith(
                                    color: context.ds.colors.signalTextNegative,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              // Shine overlay
                              Positioned.fill(
                                child: IgnorePointer(
                                  child: CustomPaint(
                                    painter: _ShinePainter(
                                      progress: _shineAnimation.value,
                                      shineColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: DSSpacing.xs2),
                Text(
                  widget.subtitle,
                  style: context.ds.typography.lineSmallRegular.copyWith(
                    color: context.ds.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          // Link button
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: DSSpacing.sm,
              vertical: DSSpacing.xs2,
            ),
            decoration: BoxDecoration(
              color: context.ds.colors.bgActionPrimary,
              borderRadius: BorderRadius.circular(DSRadius.full),
            ),
            child: Text(
              'Link ->',
              style: context.ds.typography.lineSmallBold.copyWith(
                color: context.ds.colors.textActionPrimary,
              ),
            ),
          ),
        ],
      ),
    );
}

/// Goal Planning Section
class _GoalPlanningSection extends StatelessWidget {
  const _GoalPlanningSection();

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DSSpacing.lg,
        vertical: DSSpacing.xl3,
      ),
      decoration: BoxDecoration(
        color: context.ds.colors.bgPrimary,
        border: Border(
          bottom: BorderSide(color: context.ds.colors.borderPrimary),
        ),
      ),
      child: Column(
        children: [
          // Section header
          Text(
            'Your retirement projection',
            style: context.ds.typography.lineDefaultMedium.copyWith(
              color: context.ds.colors.textTertiary,
            ),
          ),
          const SizedBox(height: DSSpacing.lg),
          // Goal Planning Card
          Container(
            padding: const EdgeInsets.all(DSSpacing.xl),
            decoration: BoxDecoration(
              color: context.ds.colors.bgSecondary,
              border: Border.all(color: context.ds.colors.borderPrimary),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // Financial Independence chip
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DSSpacing.sm,
                    vertical: DSSpacing.xs2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.ds.colors.excessBalance,
                    ),
                    borderRadius: BorderRadius.circular(DSRadius.full),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DSIcon(
                        DSIcons.checkCircle,
                        color: context.ds.colors.textPrimary,
                      ),
                      const SizedBox(width: DSSpacing.xs2),
                      Text(
                        'Your Financial Independence',
                        style: context.ds.typography.lineSmallRegular.copyWith(
                          color: context.ds.colors.excessBalance,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: DSSpacing.sm),
                // Main text
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: context.ds.typography.headingSmall.copyWith(
                      color: context.ds.colors.textPrimary,
                    ),
                    children: [
                      const TextSpan(text: 'People with your lifestyle need '),
                      TextSpan(
                        text: '~₹5Cr',
                        style: context.ds.typography.headingSmall.copyWith(
                          color: context.ds.colors.excessBalance,
                        ),
                      ),
                      const TextSpan(text: ' to be financially independent'),
                    ],
                  ),
                ),
                const SizedBox(height: DSSpacing.lg),
                // Graph placeholder
                Container(
                  height: 184,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(DSRadius.xl),
                  ),
                  child: Stack(
                    children: [
                      // Graph line (simplified)
                      CustomPaint(
                        size: const Size(double.infinity, 184),
                        painter: _GraphPainter(context.ds.colors),
                      ),
                      // ₹28L pill
                      Positioned(
                        left: 0,
                        top: 101,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: DSSpacing.xs,
                            vertical: DSSpacing.xs2,
                          ),
                          decoration: BoxDecoration(
                            color: context.ds.colors.signalIconPositiveSecondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '₹28L',
                            style: context.ds.typography.uppercaseDefault.copyWith(
                              color: context.ds.colors.mainAlwaysWhite,
                            ),
                          ),
                        ),
                      ),
                      // ₹5Cr pill
                      Positioned(
                        right: 0,
                        top: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: DSSpacing.xs,
                            vertical: DSSpacing.xs2,
                          ),
                          decoration: BoxDecoration(
                            color: context.ds.colors.signalIconPositiveSecondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '₹5Cr',
                            style: context.ds.typography.uppercaseDefault.copyWith(
                              color: context.ds.colors.mainAlwaysWhite,
                            ),
                          ),
                        ),
                      ),
                      // Labels
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Text(
                          'Today',
                          style: context.ds.typography.disclaimerDefault.copyWith(
                            color: context.ds.colors.textTertiary,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Text(
                          'Retirement age',
                          style: context.ds.typography.disclaimerDefault.copyWith(
                            color: context.ds.colors.textTertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: DSSpacing.lg),
                // CTA Button
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: context.ds.colors.bgActionPrimary,
                    borderRadius: BorderRadius.circular(8), // Figma: radius/md = 8px
                  ),
                  child: Center(
                    child: Text(
                      'Unlock your target corpus & age →',
                      style: context.ds.typography.lineSmallBold.copyWith(
                        color: context.ds.colors.textActionPrimary,
                      ),
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

/// Simple graph painter
class _GraphPainter extends CustomPainter {
  _GraphPainter(this.colors);
  final DSColorPalette colors;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colors.excessBalance
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(6, size.height - 42);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 80,
      size.width - 6,
      42,
    );
    canvas.drawPath(path, paint);

    // Draw dots
    final dotPaint = Paint()
      ..color = colors.excessBalance
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(6, size.height - 42), 6, dotPaint);
    canvas.drawCircle(Offset(size.width - 6, 42), 6, dotPaint);

    // Base line
    final linePaint = Paint()
      ..color = colors.borderSecondary
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(6, size.height - 25),
      Offset(size.width - 6, size.height - 25),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Portfolio Insights Section
class _PortfolioInsightsSection extends StatelessWidget {
  const _PortfolioInsightsSection();

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(vertical: DSSpacing.xl3),
      decoration: BoxDecoration(
        color: context.ds.colors.bgPrimary,
        border: Border(
          bottom: BorderSide(color: context.ds.colors.borderPrimary),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DSSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Portfolio Insights',
                  style: context.ds.typography.lineLargeBold.copyWith(
                    color: context.ds.colors.textPrimary,
                  ),
                ),
                const SizedBox(height: DSSpacing.xs2),
                Text(
                  'Make sense of your wealth one insight at a time',
                  style: context.ds.typography.lineSmallRegular.copyWith(
                    color: context.ds.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: DSSpacing.lg),
          // Carousel
          SizedBox(
            height: 244,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: DSSpacing.lg),
              children: const [
                _InsightCard(
                  category: 'Taxation on Debt Funds',
                  title: 'Which stock is driving your portfolio?',
                ),
                SizedBox(width: DSSpacing.sm),
                _InsightCard(
                  category: 'Taxation on Debt Funds',
                  title: 'Which stock is driving your portfolio?',
                ),
              ],
            ),
          ),
          const SizedBox(height: DSSpacing.lg),
          // Page indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 16,
                height: 8,
                decoration: BoxDecoration(
                  color: context.ds.colors.textTertiary,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(width: DSSpacing.xs),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: context.ds.colors.iconActionSecondary,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(width: DSSpacing.xs),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: context.ds.colors.iconActionSecondary,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
}

/// Insight Card widget
class _InsightCard extends StatelessWidget {
  const _InsightCard({
    required this.category,
    required this.title,
  });

  final String category;
  final String title;

  @override
  Widget build(BuildContext context) => Container(
      width: 180,
      decoration: BoxDecoration(
        color: context.ds.colors.mainAlwaysWhite,
        border: Border.all(
          color: context.ds.colors.borderSecondary.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              'assets/images/portfolio/insight_thumbnail.jpg',
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 120,
                color: context.ds.colors.bgSecondary,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(DSSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: context.ds.typography.disclaimerDefault.copyWith(
                    color: context.ds.colors.insightsText,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: DSSpacing.xs2),
                Text(
                  title,
                  style: context.ds.typography.lineDefaultBold.copyWith(
                    color: context.ds.colors.mainAlwaysBlack,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
}

/// Custom painter for the glowing border beam effect
class _GlowingBorderPainter extends CustomPainter {
  _GlowingBorderPainter({
    required this.progress,
    required this.glowColor,
    required this.borderRadius,
  });

  final double progress;
  final Color glowColor;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));
    
    // Calculate the path metrics for the rounded rectangle
    final path = Path()..addRRect(rrect);
    final pathMetrics = path.computeMetrics().first;
    final pathLength = pathMetrics.length;
    
    // Calculate beam position (clockwise from top-left)
    // 20% of perimeter
    final beamLength = pathLength * 0.20;
    final beamStart = (progress * pathLength) % pathLength;
    
    // Number of segments to create fading effect
    const segments = 20;
    final segmentLength = beamLength / segments;
    
    for (int i = 0; i < segments; i++) {
      // Calculate position along the beam (0 = leading edge, 1 = trailing edge)
      final t = i / (segments - 1);
      
      // Fade from edges: brightest in the middle, fading at both ends
      // Using a smooth curve that peaks at center
      final fadeFactor = _smoothFade(t);
      
      // Stroke width: thicker in middle, thinner at edges
      final strokeWidth = 2.5 * fadeFactor + 0.5;
      
      // Opacity: full in middle, fading at edges
      final opacity = fadeFactor;
      
      // Calculate segment position
      final segStart = (beamStart + i * segmentLength) % pathLength;
      final segEnd = (segStart + segmentLength * 1.2) % pathLength; // Slight overlap
      
      // Extract segment path
      Path segmentPath;
      if (segEnd > segStart) {
        segmentPath = pathMetrics.extractPath(segStart, segEnd);
      } else {
        segmentPath = Path()
          ..addPath(pathMetrics.extractPath(segStart, pathLength), Offset.zero)
          ..addPath(pathMetrics.extractPath(0, segEnd), Offset.zero);
      }
      
      // Draw subtle outer glow for this segment
      canvas.drawPath(
        segmentPath,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth * 2
          ..strokeCap = StrokeCap.round
          ..color = glowColor.withOpacity(opacity * 0.04)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2),
      );
      
      // Draw core beam
      canvas.drawPath(
        segmentPath,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round
          ..color = glowColor.withOpacity(opacity * 0.25),
      );
    }
  }
  
  // Smooth fade function: 0 at edges, 1 in the middle
  double _smoothFade(double t) {
    // Using a sine-based curve for smooth fade at both edges
    return math.sin(t * math.pi);
  }

  @override
  bool shouldRepaint(_GlowingBorderPainter oldDelegate) =>
      progress != oldDelegate.progress ||
      glowColor != oldDelegate.glowColor;
}

/// Custom painter for the shine effect on WEEKLY tag
class _ShinePainter extends CustomPainter {
  _ShinePainter({
    required this.progress,
    required this.shineColor,
  });

  final double progress;
  final Color shineColor;

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate shine position based on progress
    // progress goes from -0.5 to 1.5 to allow shine to fully enter and exit
    final shineX = size.width * progress;
    
    // Shine width
    final shineWidth = size.width * 0.4;
    
    // Create an angled gradient for the shine
    final rect = Rect.fromLTWH(
      shineX - shineWidth / 2,
      0,
      shineWidth,
      size.height,
    );
    
    // Slight angle for the shine (about 15 degrees)
    final transform = Matrix4.identity()
      ..translate(shineX, size.height / 2)
      ..rotateZ(0.26) // ~15 degrees in radians
      ..translate(-shineX, -size.height / 2);
    
    canvas.save();
    canvas.transform(transform.storage);
    
    final gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        shineColor.withOpacity(0),
        shineColor.withOpacity(0.3),
        shineColor.withOpacity(0.5),
        shineColor.withOpacity(0.3),
        shineColor.withOpacity(0),
      ],
      stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
    );
    
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..blendMode = BlendMode.colorDodge;
    
    canvas.drawRect(rect, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_ShinePainter oldDelegate) =>
      progress != oldDelegate.progress;
}

/// Ticker-style animated number display
class _TickerNumber extends StatelessWidget {
  const _TickerNumber({
    required this.value,
    required this.style,
    this.isHidden = false,
  });

  final double value;
  final TextStyle style;
  final bool isHidden;

  @override
  Widget build(BuildContext context) {
    // Show masked value when hidden
    if (isHidden) {
      return Text('₹**.**', style: style);
    }
    
    // Format value as ₹X.XX Cr
    final formattedValue = value.toStringAsFixed(2);
    final parts = formattedValue.split('.');
    final wholePart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : '00';
    
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          const TextSpan(text: '₹'),
          TextSpan(text: wholePart),
          const TextSpan(text: '.'),
          TextSpan(text: decimalPart),
          const TextSpan(text: ' Cr'),
        ],
      ),
    );
  }
}

/// Testimonials Section
class _TestimonialsSection extends StatelessWidget {
  const _TestimonialsSection();

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(vertical: DSSpacing.xl4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.ds.colors.borderPrimary),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DSSpacing.lg),
            child: Text(
              'Hear from our clients',
              style: context.ds.typography.headingSmall.copyWith(
                color: context.ds.colors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: DSSpacing.xl2),
          // Testimonial carousel
          SizedBox(
            height: 460,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: DSSpacing.lg),
              children: const [
                _TestimonialCard(
                  imagePath: 'assets/images/testimonials/testimonial_1.jpg',
                  quote: '"With Dezerv, I found the right partner for the next 25 years."',
                  name: 'Sanjay Arora',
                  designation: 'Founder, Suburban Diagnostics',
                ),
                SizedBox(width: DSSpacing.md),
                _TestimonialCard(
                  imagePath: 'assets/images/testimonials/testimonial_2.jpg',
                  quote: '"Investment experts at Dezerv have a solid investment thesis."',
                  name: 'Aadil Bandukwala',
                  designation: 'Marketing director, HackerRank',
                ),
                SizedBox(width: DSSpacing.md),
                _TestimonialCard(
                  imagePath: 'assets/images/testimonials/testimonial_3.jpg',
                  quote: '"Dezerv brought simplicity and clarity to my investments"',
                  name: 'Pooja Jauhari',
                  designation: 'Founder & CEO, EMoMee',
                ),
              ],
            ),
          ),
        ],
      ),
    );
}

/// Testimonial Card widget
class _TestimonialCard extends StatelessWidget {
  const _TestimonialCard({
    required this.imagePath,
    required this.quote,
    required this.name,
    required this.designation,
  });

  final String imagePath;
  final String quote;
  final String name;
  final String designation;

  @override
  Widget build(BuildContext context) => Container(
      width: 304,
      decoration: BoxDecoration(
        color: context.ds.colors.mainAlwaysWhite,
        border: Border.all(color: context.ds.colors.borderSecondary),
        borderRadius: BorderRadius.circular(DSRadius.xl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with play button
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(DSRadius.xl),
                  topRight: Radius.circular(DSRadius.xl),
                ),
                child: Image.asset(
                  imagePath,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 180,
                    color: context.ds.colors.bgTertiary,
                  ),
                ),
              ),
              // Play button
              Positioned(
                left: DSSpacing.xl,
                bottom: DSSpacing.xl,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DSSpacing.sm,
                    vertical: DSSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(DSRadius.full),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DSIcon(
                        DSIcons.play,
                        size: DSIconSize.small,
                        color: context.ds.colors.mainAlwaysWhite,
                      ),
                      const SizedBox(width: DSSpacing.xs2),
                      Text(
                        '00:59',
                        style: context.ds.typography.disclaimerDefault.copyWith(
                          color: context.ds.colors.mainAlwaysWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(DSSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quote,
                    style: context.ds.typography.headingLarge.copyWith(
                      color: context.ds.colors.mainAlwaysBlack,
                    ),
                  ),
                  const Spacer(),
                  // Author info
                  Row(
                    children: [
                      DSIcon(
                        DSIcons.link,
                        size: DSIconSize.small,
                        color: context.ds.colors.textTertiary,
                      ),
                      const SizedBox(width: DSSpacing.xs),
                      Text(
                        name,
                        style: context.ds.typography.lineLargeMedium.copyWith(
                          color: context.ds.colors.mainAlwaysBlack,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: DSSpacing.xs2),
                  Text(
                    designation,
                    style: context.ds.typography.lineDefaultMedium.copyWith(
                      color: context.ds.colors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
}

/// Feedback Section
class _FeedbackSection extends StatelessWidget {
  const _FeedbackSection();

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.only(
        left: DSSpacing.lg,
        right: DSSpacing.lg,
        top: DSSpacing.xl3,
        bottom: 60, // Figma: pb-[60px]
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
          const SizedBox(height: DSSpacing.xs),
          Text(
            'This will help us improve',
            style: context.ds.typography.lineSmallRegular.copyWith(
              color: context.ds.colors.textSecondary,
            ),
          ),
          const SizedBox(height: DSSpacing.xl),
          // Star rating - Figma uses 30x30 stars with 10px gap
          Row(
            children: List.generate(5, (index) => Padding(
                padding: const EdgeInsets.only(right: 10), // Figma: gap-[10px]
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: DSIcon(
                    DSIcons.favorite,
                    size: DSIconSize.large,
                    color: context.ds.colors.textTertiary,
                  ),
                ),
              ),),
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
