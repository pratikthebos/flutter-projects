import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xffF7F9FC);

  static const Color surface = Colors.white;

  static const Color primary = Color(0xffFF8A00);

  static const Color secondary = Color(0xff34C759);

  static const Color accent = Color(0xff4F8CFF);

  static const Color danger = Color(0xffFF5A5F);

  static const Color warning = Color(0xffFFB800);

  static const Color success = Color(0xff2ECC71);

  static const Color textPrimary = Color(0xff1B1D28);

  static const Color textSecondary = Color(0xff6B7280);

  static const Color border = Color(0xffE6E8EC);

  static const Color shadow = Color(0x14000000);

  static const LinearGradient orangeGradient = LinearGradient(
    colors: [
      Color(0xffFF9800),
      Color(0xffFF6D00),
    ],
  );

  static const LinearGradient greenGradient = LinearGradient(
    colors: [
      Color(0xff43A047),
      Color(0xff2ECC71),
    ],
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [
      Color(0xff42A5F5),
      Color(0xff1976D2),
    ],
  );

  static const LinearGradient purpleGradient = LinearGradient(
    colors: [
      Color(0xff7B61FF),
      Color(0xff5B4BDB),
    ],
  );
}