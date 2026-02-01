import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'design_system/design_system.dart';
import 'examples/design_system_demo.dart';
import 'screens/home/portfolio_home_page.dart';
import 'screens/mutual_funds/mutual_fund_analysis_page.dart';

void main() {
  runApp(const ProsperApp());
}

/// Theme notifier for managing light/dark mode
class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}

/// Global theme notifier instance
final themeNotifier = ThemeNotifier();

/// Main application entry point
class ProsperApp extends StatefulWidget {
  const ProsperApp({super.key});

  @override
  State<ProsperApp> createState() => _ProsperAppState();
}

class _ProsperAppState extends State<ProsperApp> {
  @override
  void initState() {
    super.initState();
    themeNotifier.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    themeNotifier.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Prosper',
      
      // Apply design system themes with dynamic switching
      theme: DS.theme.light,
      darkTheme: DS.theme.dark,
      themeMode: themeNotifier.themeMode,
      
      debugShowCheckedModeBanner: false,
      
      // Routes - design system demo always accessible at /design-system
      initialRoute: '/',
      routes: {
        '/': (context) => const PortfolioHomePage(),
        '/mutual-funds': (context) => const MutualFundAnalysisPage(),
        '/design-system': (context) => const DesignSystemDemo(),
      },
    );
}

/// iOS-style theme toggle switch widget
class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) => ListenableBuilder(
      listenable: themeNotifier,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              themeNotifier.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              size: 16,
              color: context.ds.colors.textSecondary,
            ),
            SizedBox(width: DSSpacing.xs2),
            SizedBox(
              width: 42,
              height: 26,
              child: FittedBox(
                fit: BoxFit.contain,
                child: CupertinoSwitch(
                  value: themeNotifier.isDarkMode,
                  onChanged: (value) {
                    themeNotifier.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                  },
                  activeColor: context.ds.colors.bgActionPrimary,
                ),
              ),
            ),
          ],
        );
      },
    );
}
