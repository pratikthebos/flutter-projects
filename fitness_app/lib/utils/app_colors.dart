import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //==================================================
  // Background
  //==================================================

  static const Color background = Color(0xFFF7F8FC);

  static const Color white = Colors.white;

  static const Color black = Color(0xFF1B1E28);

  //==================================================
  // Primary Theme
  //==================================================

  static const Color primary = Color(0xFF4C5CFF);

  static const Color secondary = Color(0xFF66D9E8);

  static const Color accent = Color(0xFFFF7EB6);

  //==================================================
  // Activity Cards
  //==================================================

  static const List<Color> runningGradient = [
    Color(0xFF4C5CFF),
    Color(0xFF697BFF),
  ];

  static const List<Color> cyclingGradient = [
    Color(0xFF62D6E8),
    Color(0xFF8DEBFF),
  ];

  static const List<Color> mealGradient = [
    Color(0xFFFF7EB6),
    Color(0xFFFFA4CA),
  ];

  static const List<Color> dinnerGradient = [
    Color(0xFF67D48C),
    Color(0xFF9AE6B4),
  ];

  //==================================================
  // Progress Colors
  //==================================================

  static const Color progressBlue = Color(0xFF4C5CFF);

  static const Color progressPink = Color(0xFFFF7EB6);

  static const Color progressCyan = Color(0xFF66D9E8);

  static const Color progressGreen = Color(0xFF67D48C);

  //==================================================
  // Text
  //==================================================

  static const Color title = Color(0xFF1B1E28);

  static const Color subtitle = Color(0xFF8A8FA3);

  static const Color lightText = Colors.white70;

  //==================================================
  // Card
  //==================================================

  static const Color card = Colors.white;

  static const Color shadow = Color(0x14000000);

  //==================================================
  // Bottom Navigation
  //==================================================

  static const Color navSelected = Color(0xFF4C5CFF);

  static const Color navUnselected = Color(0xFFB0B4C5);

  //==================================================
  // Floating Button
  //==================================================

  static const Color fab = Color(0xFF4C5CFF);

  //==================================================
  // Chart Colors
  //==================================================

  static const Color chartBlue = Color(0xFF4C5CFF);

  static const Color chartCyan = Color(0xFF66D9E8);

  static const Color chartPink = Color(0xFFFF7EB6);

  static const Color chartPurple = Color(0xFF8A6CFF);

  static const Color chartBackground = Color(0xFFE9ECF8);
}