import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const background = Color(0xffFFFFFF);

  static const surface = Color(0xffF6F7FB);

  static const primary = Color(0xffE53935);

  static const secondary = Color(0xffFF6B6B);

  static const accent = Color(0xffFFB300);

  static const success = Color(0xff2ECC71);

  static const booked = Color(0xffC7CAD3);

  static const available = Color(0xffFFFFFF);

  static const selected = Color(0xffE53935);

  static const textPrimary = Color(0xff1C1C1C);

  static const textSecondary = Color(0xff757575);

  static const shadow = Color(0x15000000);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xffE53935),
      Color(0xffFF6B6B),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}