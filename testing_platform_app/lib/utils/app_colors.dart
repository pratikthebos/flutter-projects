import 'package:flutter/material.dart';

class AppColors {
  // Background
  static const background = Color(0xFF09090F);
  static const surface = Color(0xFF111118);

  // Liquid Glass Colors
  static const glass = Color.fromRGBO(255, 255, 255, 0.08);
  static const glassLight = Color.fromRGBO(255, 255, 255, 0.18);
  static const glassBorder = Color.fromRGBO(255, 255, 255, 0.22);

  // Accent Colors
  static const primary = Color(0xFF6C63FF);
  static const secondary = Color(0xFF00E5FF);
  static const success = Color(0xFF22C55E);
  static const warning = Color(0xFFFFB020);
  static const danger = Color(0xFFFF4D6D);

  static const white = Colors.white;
  static const grey = Color(0xFFB8BCC8);

  // Glass Gradients
  static const LinearGradient liquidGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(255, 255, 255, .18),
      Color.fromRGBO(255, 255, 255, .05),
    ],
  );

  static const LinearGradient auroraGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff6C63FF),
      Color(0xff00E5FF),
      Color(0xff7B61FF),
    ],
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [
      Color(0xff4F46E5),
      Color(0xff06B6D4),
    ],
  );

  static const LinearGradient pinkGradient = LinearGradient(
    colors: [
      Color(0xffEC4899),
      Color(0xff8B5CF6),
    ],
  );

  static const LinearGradient greenGradient = LinearGradient(
    colors: [
      Color(0xff10B981),
      Color(0xff06B6D4),
    ],
  );
}