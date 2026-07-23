import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      scaffoldBackgroundColor: AppColors.background,

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
      ),

      textTheme: GoogleFonts.poppinsTextTheme(),

      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.text,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.text,
        ),
      ),

      cardTheme: CardThemeData(
        elevation: 8,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }
}