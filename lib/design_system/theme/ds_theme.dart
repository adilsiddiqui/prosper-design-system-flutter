// GENERATED FILE - DO NOT EDIT DIRECTLY
// Generated from Figma design tokens

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/ds_colors.dart';
import '../typography/ds_typography.dart';
import 'ds_theme_extension.dart';

/// Design System Theme
/// 
/// Provides complete ThemeData configurations for light and dark modes.
/// All theming derives from the design system tokens.
class DSTheme {
  DSTheme._();

  /// Light theme
  static ThemeData get light => _buildTheme(
        brightness: Brightness.light,
        colors: DSColors.light,
        extension: DSThemeExtension.light,
      );

  /// Dark theme
  static ThemeData get dark => _buildTheme(
        brightness: Brightness.dark,
        colors: DSColors.dark,
        extension: DSThemeExtension.dark,
      );

  /// Creates a light theme with specified typography variant.
  static ThemeData lightWith({
    DSTypographyData typography = DSTypography.mobile,
  }) => _buildTheme(
      brightness: Brightness.light,
      colors: DSColors.light,
      extension: DSThemeExtension.lightWith(typography: typography),
    );

  /// Creates a dark theme with specified typography variant.
  static ThemeData darkWith({
    DSTypographyData typography = DSTypography.mobile,
  }) => _buildTheme(
      brightness: Brightness.dark,
      colors: DSColors.dark,
      extension: DSThemeExtension.darkWith(typography: typography),
    );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required DSColorPalette colors,
    required DSThemeExtension extension,
  }) {
    final isDark = brightness == Brightness.dark;
    final typography = extension.typography;

    return ThemeData(
      brightness: brightness,
      useMaterial3: true,

      // Colors
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.bgActionPrimary,
        onPrimary: colors.textActionPrimary,
        secondary: colors.bgActionSecondary,
        onSecondary: colors.textActionSecondary,
        error: colors.signalTextNegative,
        onError: colors.mainAlwaysWhite,
        surface: colors.bgPrimary,
        onSurface: colors.textPrimary,
        surfaceContainerHighest: colors.bgSecondary,
        outline: colors.borderPrimary,
        outlineVariant: colors.borderSecondary,
      ),

      scaffoldBackgroundColor: colors.bgPrimary,
      canvasColor: colors.bgPrimary,
      cardColor: colors.bgPrimary,
      dividerColor: colors.borderPrimary,

      // Typography
      fontFamily: DSTypography.fontFamily,
      textTheme: TextTheme(
        displayLarge: typography.displayLarge.copyWith(color: colors.textPrimary),
        displayMedium: typography.displayDefault.copyWith(color: colors.textPrimary),
        displaySmall: typography.displaySmall.copyWith(color: colors.textPrimary),
        headlineLarge: typography.headingLarge.copyWith(color: colors.textPrimary),
        headlineMedium: typography.headingDefault.copyWith(color: colors.textPrimary),
        headlineSmall: typography.headingSmall.copyWith(color: colors.textPrimary),
        titleLarge: typography.lineLargeBold.copyWith(color: colors.textPrimary),
        titleMedium: typography.lineDefaultBold.copyWith(color: colors.textPrimary),
        titleSmall: typography.lineSmallBold.copyWith(color: colors.textPrimary),
        bodyLarge: typography.paraLargeRegular.copyWith(color: colors.textPrimary),
        bodyMedium: typography.paraDefaultRegular.copyWith(color: colors.textPrimary),
        bodySmall: typography.paraSmallRegular.copyWith(color: colors.textSecondary),
        labelLarge: typography.lineDefaultMedium.copyWith(color: colors.textPrimary),
        labelMedium: typography.lineSmallMedium.copyWith(color: colors.textSecondary),
        labelSmall: typography.disclaimerDefault.copyWith(color: colors.textTertiary),
      ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: colors.bgPrimary,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: typography.lineLargeBold.copyWith(color: colors.textPrimary),
        iconTheme: IconThemeData(color: colors.iconPrimary),
        systemOverlayStyle: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),

      // Card
      cardTheme: CardTheme(
        color: colors.bgPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: colors.borderPrimary),
        ),
      ),

      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.bgActionPrimary,
          foregroundColor: colors.textActionPrimary,
          disabledBackgroundColor: colors.bgDisabled,
          disabledForegroundColor: colors.textDisabled,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: typography.lineDefaultBold,
        ),
      ),

      // Outlined Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.textPrimary,
          disabledForegroundColor: colors.textDisabled,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          side: BorderSide(color: colors.borderActionPrimary),
          textStyle: typography.lineDefaultBold,
        ),
      ),

      // Text Button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.textPrimary,
          disabledForegroundColor: colors.textDisabled,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: typography.lineDefaultMedium,
        ),
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.bgSecondary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.borderPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.borderPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.borderFocused, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.signalBorderNegative),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.signalTextNegative, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.borderPrimary),
        ),
        labelStyle: typography.lineDefaultRegular.copyWith(color: colors.textSecondary),
        hintStyle: typography.lineDefaultRegular.copyWith(color: colors.textTertiary),
        errorStyle: typography.disclaimerDefault.copyWith(color: colors.signalTextNegative),
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color: colors.borderPrimary,
        thickness: 1,
        space: 1,
      ),

      // Bottom Navigation Bar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.bgPrimary,
        selectedItemColor: colors.iconPrimary,
        unselectedItemColor: colors.textTertiary,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      // Navigation Bar (Material 3)
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.bgPrimary,
        indicatorColor: colors.bgTertiary,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),

      // Chip
      chipTheme: ChipThemeData(
        backgroundColor: colors.bgSecondary,
        selectedColor: colors.bgActionPrimary,
        disabledColor: colors.bgDisabled,
        labelStyle: typography.lineSmallMedium,
        side: BorderSide(color: colors.borderPrimary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Switch
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.bgActionPrimary;
          }
          return colors.bgTertiary;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.bgActionSecondary;
          }
          return colors.borderSecondary;
        }),
      ),

      // Extensions
      extensions: [extension],
    );
  }
}

/// Theme mode enum for the design system.
enum DSThemeMode {
  light,
  dark,
  system,
}
