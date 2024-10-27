// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

const customColorScheme = ColorScheme(
  primary: AppColors.primaryColor,
  secondary: AppColors.secondaryColor,
  surface: AppColors.backgroundColor,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.black,
  onSurface: Colors.black,
  onError: Colors.white,
  brightness: Brightness.light,
);

ThemeData appTheme() {
  return ThemeData.from(colorScheme: customColorScheme).copyWith(
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black87),
        bodyMedium: TextStyle(color: Colors.black87),
        bodySmall: TextStyle(color: Colors.black87),
      ),
      useMaterial3: true);
}
