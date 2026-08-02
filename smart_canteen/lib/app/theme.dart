import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(

    useMaterial3: true,

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),

    fontFamily: "Poppins",

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
    ),

    cardTheme: CardThemeData(

      color: Colors.white,

      elevation: 5,

      shadowColor: Colors.black12,

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(22),

      ),

    ),

    inputDecorationTheme: InputDecorationTheme(

      filled: true,

      fillColor: Colors.white,

      border: OutlineInputBorder(

        borderRadius: BorderRadius.circular(18),

        borderSide: BorderSide.none,

      ),

    ),

  );

}