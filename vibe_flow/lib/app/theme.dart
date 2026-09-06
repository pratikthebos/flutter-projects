import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    final baseTheme = ThemeData.dark();

    return baseTheme.copyWith(
      scaffoldBackgroundColor: AppColors.background,

      brightness: Brightness.dark,

      primaryColor: AppColors.purple,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.purple,
        secondary: AppColors.cyan,
        surface: AppColors.surface,
      ),

      textTheme: GoogleFonts.interTextTheme(
        baseTheme.textTheme,
      ).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),

      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 0,
        margin: EdgeInsets.zero,
      ),

      dividerTheme: DividerThemeData(
        color: Colors.white.withOpacity(0.08),
        thickness: 1,
      ),

      iconTheme: const IconThemeData(
        color: Colors.white,
      ),

      splashFactory: NoSplash.splashFactory,

      splashColor: Colors.transparent,

      highlightColor: Colors.transparent,
    );
  }
}