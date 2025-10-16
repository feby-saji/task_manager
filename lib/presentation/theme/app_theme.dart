import 'package:flutter/material.dart';

/// App color system
class AppColors {
  // Light theme
  static const Color lightBackground = Colors.white;
  static const Color lightTextPrimary = Color(0xFF333333);
  static const Color lightTextSecondary = Color(0xFF666666);
  static const Color lightDivider = Color(0xFFE0E0E0);
  static const Color lightPrimary = Color(0xFF3B82F6);
  static const Color lightSuccess = Color(0xFF10B981);
  static const Color lightError = Color(0xFFEF4444);

  // Dark theme
  static const Color darkBackground = Color(0xFF1F2937);
  static const Color darkTextPrimary = Color(0xFFE5E7EB);
  static const Color darkTextSecondary = Color(0xFFA0AEC0);
  static const Color darkDivider = Color(0xFF374151);
  static const Color darkPrimary = Color(0xFF60A5FA);
  static const Color darkSuccess = Color(0xFF34D399);
  static const Color darkError = Color(0xFFF87171);
}

class AppTheme {
  /// Light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.lightPrimary,
    dividerColor: AppColors.lightDivider,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.lightTextPrimary,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: AppColors.lightTextPrimary,
      ),
      displayMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.lightTextPrimary,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.lightTextPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.lightTextPrimary,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.lightTextPrimary,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.lightTextPrimary),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.lightTextSecondary),
      bodySmall: TextStyle(fontSize: 12, color: AppColors.lightTextSecondary),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white, // e.g. buttons
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightPrimary,
      error: AppColors.lightError,
      surface: AppColors.lightBackground,
    ),
  );

  /// Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.darkPrimary,
    dividerColor: AppColors.darkDivider,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkTextPrimary,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: AppColors.darkTextPrimary,
      ),
      displayMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.darkTextPrimary,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.darkTextPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextPrimary,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextPrimary,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.darkTextPrimary),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.darkTextSecondary),
      bodySmall: TextStyle(fontSize: 12, color: AppColors.darkTextSecondary),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white, // e.g. buttons
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkPrimary,
      error: AppColors.darkError,
      surface: AppColors.darkBackground,
    ),
  );
}
