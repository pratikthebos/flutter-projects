import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class NovaTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,

      scaffoldBackgroundColor:
      AppColors.background,

      brightness: Brightness.dark,

      fontFamily: 'Arial',

      colorScheme: const ColorScheme.dark(
        primary: AppColors.purple,
        secondary: AppColors.cyan,
        surface: AppColors.surface,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}