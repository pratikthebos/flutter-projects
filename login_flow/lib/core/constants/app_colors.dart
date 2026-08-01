import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// Background

  static const background = Color(0xffF8FAFC);

  static const surface = Colors.white;

  static const border = Color(0xffE2E8F0);

  /// Brand

  static const primary = Color(0xff2563EB);

  static const secondary = Color(0xff7C3AED);

  static const success = Color(0xff10B981);

  static const warning = Color(0xffF59E0B);

  static const danger = Color(0xffEF4444);

  static const api = Color(0xff2563EB);

  static const backend = Color(0xff7C3AED);

  static const database = Color(0xff14B8A6);

  static const jwt = Color(0xffF97316);

  static const storage = Color(0xffEC4899);

  static const text = Color(0xff0F172A);

  static const subtitle = Color(0xff64748B);

  static const shadow = Color(0x15000000);

  static const Gradient primaryGradient = LinearGradient(
    colors: [
      Color(0xff2563EB),
      Color(0xff7C3AED),
    ],
  );

  static const Gradient successGradient = LinearGradient(
    colors: [
      Color(0xff10B981),
      Color(0xff22C55E),
    ],
  );

  static const Gradient apiGradient = LinearGradient(
    colors: [
      Color(0xff3B82F6),
      Color(0xff60A5FA),
    ],
  );
}