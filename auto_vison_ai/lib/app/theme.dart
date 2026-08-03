import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constants/app_colors.dart';

class AppTheme {

  static ThemeData get light {

    return ThemeData(

      useMaterial3: true,

      scaffoldBackgroundColor: AppColors.background,

      colorSchemeSeed: AppColors.primary,

      textTheme: GoogleFonts.poppinsTextTheme(),

      appBarTheme: const AppBarTheme(

        backgroundColor: Colors.transparent,

        elevation: 0,

        centerTitle: true,

      ),

    );

  }

}