import 'package:flutter/material.dart';

class AppTheme {
  static const Color background =
  Color(0xff050816);

  static const Color card =
  Color(0xff0B1024);

  static const Color primary =
  Color(0xff7C3AED);

  static const Color cyan =
  Color(0xff22D3EE);

  static const Color success =
  Color(0xff22C55E);

  static const Color pink =
  Color(0xffEC4899);

  static const Color textSecondary =
  Color(0xff8B94A8);

  static const LinearGradient primaryGradient =
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff7C3AED),
      Color(0xff4F46E5),
      Color(0xff06B6D4),
    ],
  );

  static const LinearGradient successGradient =
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff22C55E),
      Color(0xff10B981),
    ],
  );
}