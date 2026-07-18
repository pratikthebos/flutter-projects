import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //==========================
  // Background Colors
  //==========================

  static const Color background = Color(0xff050816);
  static const Color surface = Color(0xff111827);
  static const Color surface2 = Color(0xff1F2937);

  //==========================
  // Primary Colors
  //==========================

  static const Color primary = Color(0xff6366F1);
  static const Color secondary = Color(0xff8B5CF6);

  static const Color cyan = Color(0xff06B6D4);
  static const Color blue = Color(0xff3B82F6);

  static const Color pink = Color(0xffEC4899);
  static const Color red = Color(0xffF43F5E);

  static const Color orange = Color(0xffF97316);
  static const Color yellow = Color(0xffFACC15);

  static const Color green = Color(0xff22C55E);
  static const Color teal = Color(0xff14B8A6);

  //==========================
  // Text Colors
  //==========================

  static const Color white = Colors.white;
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xffB6BCC8);
  static const Color hint = Color(0xff8A93A5);

  //==========================
  // Glass Colors
  //==========================

  static const Color glassWhite = Color.fromARGB(40, 255, 255, 255);
  static const Color glassBorder = Color.fromARGB(70, 255, 255, 255);

  //==========================
  // Shadows
  //==========================

  static const Color shadow = Color.fromARGB(45, 0, 0, 0);

  //==========================
  // Aurora Gradients
  //==========================

  static const List<Color> aurora = [
    Color(0xff6366F1),
    Color(0xff8B5CF6),
    Color(0xff06B6D4),
  ];

  static const List<Color> ocean = [
    Color(0xff06B6D4),
    Color(0xff3B82F6),
  ];

  static const List<Color> sunset = [
    Color(0xffF97316),
    Color(0xffF43F5E),
  ];

  static const List<Color> forest = [
    Color(0xff22C55E),
    Color(0xff14B8A6),
  ];

  static const List<Color> candy = [
    Color(0xffEC4899),
    Color(0xff8B5CF6),
  ];

  static const List<Color> royal = [
    Color(0xff4338CA),
    Color(0xff7C3AED),
  ];

  //==========================
  // Card Gradients
  //==========================

  static const List<List<Color>> cardGradients = [
    aurora,
    ocean,
    sunset,
    forest,
    candy,
    royal,
  ];
}