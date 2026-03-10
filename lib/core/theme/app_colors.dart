import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Soft Cyan (Refined)
  static const Color primary = Color(0xFF3DD9F3); // Soft cyan accent
  static const Color primaryDark = Color(0xFF1BA5D1); // Deep cyan
  static const Color primaryLight = Color(0xFF6AE7F7); // Light cyan

  // Secondary Colors - Soft Indigo (Refined)
  static const Color secondary = Color(0xFF7C5DFA); // Soft indigo
  static const Color secondaryDark = Color(0xFF5A3DB5); // Deep indigo
  static const Color secondaryLight = Color(0xFF9F7FFF); // Light indigo

  // Background Colors - Dark sophisticated
  static const Color bgDark = Color(0xFF0B0F1A); // Almost black with blue tint
  static const Color bgMedium = Color(0xFF151B2E); // Dark navy
  static const Color bgLight = Color(0xFF1E2541); // Lighter navy

  // Text Colors
  static const Color textPrimary = Color(0xFFE6EDF7); // Soft white
  static const Color textSecondary = Color(0xFF94A3B8); // Gray
  static const Color textTertiary = Color(0xFF6B7280); // Darker gray

  // Accent Colors
  static const Color accentGreen = Color(0xFF10B981); // Success green
  static const Color accentOrange = Color(0xFFF97316); // Warning orange
  static const Color accentRed = Color(0xFFEF4444); // Error red

  // Gradient
  static const LinearGradient premiumGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient bgGradient = LinearGradient(
    colors: [bgDark, bgMedium],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
