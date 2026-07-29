import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class AppTheme {

  static ThemeData get lightTheme {

    return ThemeData(

      useMaterial3: true,

      scaffoldBackgroundColor: AppColors.background,

      colorScheme: ColorScheme.fromSeed(

        seedColor: AppColors.primary,

      ),

      appBarTheme: const AppBarTheme(

        backgroundColor: Colors.white,

        foregroundColor: Colors.black,

        elevation: 0,

      ),

      fontFamily: "Roboto",
    );
  }
}