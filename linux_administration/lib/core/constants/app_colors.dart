import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// Background
  static const Color background = Color(0xffF7F8FC);

  static const Color card = Colors.white;

  static const Color terminal = Color(0xff111827);

  static const Color terminalLight = Color(0xff1F2937);

  /// Primary
  static const Color primary = Color(0xffE95420);

  static const Color secondary = Color(0xff0EA5E9);

  static const Color accent = Color(0xff7C3AED);

  /// Status
  static const Color success = Color(0xff22C55E);

  static const Color warning = Color(0xffF59E0B);

  static const Color danger = Color(0xffEF4444);

  static const Color info = Color(0xff3B82F6);

  /// Text
  static const Color textPrimary = Color(0xff111827);

  static const Color textSecondary = Color(0xff6B7280);

  static const Color white = Colors.white;

  /// Terminal Text

  static const Color terminalGreen = Color(0xff4ADE80);

  static const Color terminalBlue = Color(0xff60A5FA);

  static const Color terminalOrange = Color(0xffFB923C);

  static const Color terminalRed = Color(0xffF87171);

  static const Color terminalGray = Color(0xffD1D5DB);

  /// Cards

  static const Color shadow = Color(0x15000000);

  static const Color border = Color(0xffE5E7EB);

  /// Progress

  static const Color cpu = Color(0xff2563EB);

  static const Color memory = Color(0xff8B5CF6);

  static const Color disk = Color(0xff10B981);

  static const Color network = Color(0xffF97316);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xffE95420),
      Color(0xffFF7A45),
    ],
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [
      Color(0xff3B82F6),
      Color(0xff0EA5E9),
    ],
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [
      Color(0xff22C55E),
      Color(0xff16A34A),
    ],
  );

  static const LinearGradient purpleGradient = LinearGradient(
    colors: [
      Color(0xff7C3AED),
      Color(0xff9333EA),
    ],
  );
}