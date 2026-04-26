import 'package:flutter/material.dart';
import 'palette.dart';

enum AppThemeType { system, light, dark, midnight, forest, sunrise }

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: LifeOsPalette.primary,
      scaffoldBackgroundColor: LifeOsPalette.background,
      colorScheme: const ColorScheme.light(
        primary: LifeOsPalette.primary,
        secondary: LifeOsPalette.secondary,
        surface: LifeOsPalette.surface,
        error: LifeOsPalette.error,
        onPrimary: LifeOsPalette.onPrimary,
        onSecondary: LifeOsPalette.onSecondary,
        onSurface: LifeOsPalette.onSurface,
        onError: LifeOsPalette.onError,
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: LifeOsPalette.darkPrimary,
      scaffoldBackgroundColor: LifeOsPalette.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: LifeOsPalette.darkPrimary,
        secondary: LifeOsPalette.darkSecondary,
        surface: LifeOsPalette.darkSurface,
        error: LifeOsPalette.darkError,
        onPrimary: LifeOsPalette.darkOnPrimary,
        onSecondary: LifeOsPalette.darkOnSecondary,
        onSurface: LifeOsPalette.darkOnSurface,
        onError: LifeOsPalette.darkOnError,
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData getTheme(AppThemeType type) {
    switch (type) {
      case AppThemeType.light:
        return lightTheme;
      case AppThemeType.dark:
      case AppThemeType.midnight:
        return darkTheme.copyWith(scaffoldBackgroundColor: Colors.black);
      case AppThemeType.forest:
        return lightTheme.copyWith(
          primaryColor: Colors.green,
          colorScheme: lightTheme.colorScheme.copyWith(primary: Colors.green),
        );
      case AppThemeType.sunrise:
        return lightTheme.copyWith(
          primaryColor: Colors.orange,
          colorScheme: lightTheme.colorScheme.copyWith(primary: Colors.orange),
        );
      case AppThemeType.system:
        return lightTheme;
    }
  }
}
