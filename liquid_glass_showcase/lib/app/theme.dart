import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static ThemeData get darkTheme {

    return ThemeData(

      brightness: Brightness.dark,

      scaffoldBackgroundColor: Colors.black,

      useMaterial3: true,

      textTheme: GoogleFonts.poppinsTextTheme(

        ThemeData.dark().textTheme,

      ),

      colorScheme: const ColorScheme.dark(

        primary: Color(0xff87F5FF),

        secondary: Color(0xff6FE6FF),

        surface: Color(0xff0D0D0D),

      ),

    );

  }

}