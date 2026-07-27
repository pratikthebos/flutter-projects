import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// Background
  static const background = Color(0xff0B1020);

  /// Primary Purple
  static const primary = Color(0xff7C3AED);

  /// Secondary Purple
  static const secondary = Color(0xffA855F7);

  /// Sky Blue
  static const accent = Color(0xff62D8FF);

  /// Card Background
  static const card = Color(0xff1B1630);

  /// Glass Effect
  static const glass = Colors.white10;

  /// Text
  static const white = Colors.white;
  static const grey = Colors.white70;

  /// Weather Colors
  static const sunny = Color(0xffFFD54F);
  static const rainy = Color(0xff4FC3F7);
  static const cloudy = Color(0xff90A4AE);

  /// Status Colors
  static const success = Color(0xff00E676);
  static const warning = Color(0xffFFB300);
  static const danger = Color(0xffFF5252);

  /// Gradient
  static const gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primary,
      secondary,
    ],
  );

  /// Background Gradient
  static const backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff0B1020),
      Color(0xff151A35),
    ],
  );
}