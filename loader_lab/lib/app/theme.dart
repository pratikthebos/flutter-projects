import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xffF5F7FC),
      fontFamily: "Roboto",
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xff6C63FF),
        brightness: Brightness.light,
      ),
    );
  }
}