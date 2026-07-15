import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //==================================================
  // Background
  //==================================================

  static const Color background = Color(0xFFF3F5FA);

  static const Color cardShadow = Color(0x22000000);

  static const Color white = Colors.white;

  static const Color black = Color(0xFF1A1D29);

  //==================================================
  // Premium Purple
  //==================================================

  static const List<Color> purpleGradient = [
    Color(0xFF7B61FF),
    Color(0xFF9C8CFF),
  ];

  static const Color purpleGlow = Color(0x557B61FF);

  static const Color purpleIcon = Color(0xFFD9D2FF);

  //==================================================
  // Ocean Blue
  //==================================================

  static const List<Color> blueGradient = [
    Color(0xFF00B4DB),
    Color(0xFF0083B0),
  ];

  static const Color blueGlow = Color(0x5500B4DB);

  static const Color blueIcon = Color(0xFFCFF6FF);

  //==================================================
  // Emerald
  //==================================================

  static const List<Color> greenGradient = [
    Color(0xFF00C853),
    Color(0xFF43A047),
  ];

  static const Color greenGlow = Color(0x5500C853);

  static const Color greenIcon = Color(0xFFD7FFE8);

  //==================================================
  // Sunset Orange
  //==================================================

  static const List<Color> orangeGradient = [
    Color(0xFFFF9800),
    Color(0xFFFF7043),
  ];

  static const Color orangeGlow = Color(0x55FF9800);

  static const Color orangeIcon = Color(0xFFFFE5CC);

  //==================================================
  // Pink
  //==================================================

  static const List<Color> pinkGradient = [
    Color(0xFFFF4D94),
    Color(0xFFFF80AB),
  ];

  static const Color pinkGlow = Color(0x55FF4D94);

  static const Color pinkIcon = Color(0xFFFFD6E7);

  //==================================================
  // Cyan
  //==================================================

  static const List<Color> cyanGradient = [
    Color(0xFF00C9FF),
    Color(0xFF92FE9D),
  ];

  static const Color cyanGlow = Color(0x5500C9FF);

  static const Color cyanIcon = Color(0xFFD7FFFF);

  //==================================================
  // Text
  //==================================================

  static const Color title = Colors.white;

  static const Color subtitle = Colors.white70;

  static const Color value = Colors.white;

  static const Color progressBackground = Colors.white24;

  //==================================================
  // Glass Effect
  //==================================================

  static Color glass = Colors.white.withOpacity(.12);

  static Color glassBorder = Colors.white.withOpacity(.20);
}