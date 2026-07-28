import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// Background
  static const background = Color(0xff081122);

  /// Surface Cards
  static const surface = Color(0xff13213D);

  static const surfaceLight = Color(0xff1C2F52);

  /// Primary
  static const primary = Color(0xff3B82F6);

  static const secondary = Color(0xff06B6D4);

  static const accent = Color(0xff7C3AED);

  /// Status Colors
  static const success = Color(0xff22C55E);

  static const warning = Color(0xffF59E0B);

  static const danger = Color(0xffEF4444);

  static const info = Color(0xff38BDF8);

  /// Text
  static const textPrimary = Colors.white;

  static const textSecondary = Colors.white70;

  static const textLight = Colors.white54;

  /// Divider
  static const divider = Colors.white12;

  /// Card Border
  static const border = Colors.white10;

  /// Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff3B82F6),
      Color(0xff06B6D4),
    ],
  );

  static const LinearGradient purpleGradient = LinearGradient(
    colors: [
      Color(0xff7C3AED),
      Color(0xffA855F7),
    ],
  );

  static const LinearGradient greenGradient = LinearGradient(
    colors: [
      Color(0xff22C55E),
      Color(0xff16A34A),
    ],
  );

  static const LinearGradient orangeGradient = LinearGradient(
    colors: [
      Color(0xffF59E0B),
      Color(0xffFB923C),
    ],
  );

  static const LinearGradient redGradient = LinearGradient(
    colors: [
      Color(0xffEF4444),
      Color(0xffDC2626),
    ],
  );
}