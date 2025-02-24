import 'package:flutter/material.dart';

class AppColor {
  // Primary Colors
  static const Color primaryColor = Color(0xFF1A73E8); // Example primary blue color
  static const Color primaryDarkColor = Color(0xFF0F59A7); // Darker shade for primary color
  static const Color primaryLightColor = Color(0xFF8AB8E6); // Lighter shade for primary color

  // Secondary Colors
  static const Color secondaryColor = Color(0xFFFF9800); // Orange
  static const Color secondaryDarkColor = Color(0xFFFB8C00); // Darker orange
  static const Color secondaryLightColor = Color(0xFFFFC947); // Lighter orange

  // Background Colors
  static const Color backgroundColor = Color(0xFFF5F5F5); // Light gray background
  static const Color backgroundDarkColor = Color(0xFF303030); // Dark background

  // Text Colors
  static const Color textPrimaryColor = Color(0xFF212121); // Main text color
  static const Color textSecondaryColor = Color(0xFF757575); // Secondary text color
  static const Color textWhiteColor = Color(0xFFFFFFFF); // White text color
  static const Color textHintColor = Color(0xFF9E9E9E); // Hint text color

  // Accent Colors
  static const Color accentColor = Color(0xFF8BC34A); // Green accent color
  static const Color errorColor = Color(0xFFFF1744); // Red accent for error states

  // Gradients (Example)
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1A73E8), Color(0xFF8AB8E6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadow Color
  static const Color shadowColor = Color(0x29000000); // 29% opacity black for shadow

  // Disabled States
  static const Color disabledColor = Color(0xFFBDBDBD); // Disabled button color

  // Function to generate custom color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  // Function for color scheme for dark mode or light mode
  static ThemeData getLightTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      hintColor: secondaryColor,
      scaffoldBackgroundColor: backgroundColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: textPrimaryColor),
        bodyMedium: TextStyle(color: textSecondaryColor),
        displayLarge: TextStyle(color: textPrimaryColor),
      ),
      iconTheme: const IconThemeData(color: textPrimaryColor),
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        onPrimary: textWhiteColor,
        surface: Colors.white,
        onSurface: textPrimaryColor,
        error: errorColor,
      ),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      primaryColor: primaryDarkColor,
      hintColor: secondaryDarkColor,
      scaffoldBackgroundColor: backgroundDarkColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: textWhiteColor),
        bodyMedium: TextStyle(color: textWhiteColor),
        displayLarge: TextStyle(color: textWhiteColor),
      ),
      iconTheme: const IconThemeData(color: textWhiteColor),
      colorScheme: const ColorScheme.dark(
        primary: primaryDarkColor,
        onPrimary: textWhiteColor,
        surface: Colors.black,
        onSurface: textWhiteColor,
        error: errorColor,
      ),
    );
  }
}
