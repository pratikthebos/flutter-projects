import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData get light {

    return ThemeData(

      useMaterial3: true,

      scaffoldBackgroundColor: const Color(0xffF7FAFD),

      colorScheme: ColorScheme.fromSeed(

        seedColor: Colors.lightBlue,

      ),

      appBarTheme: const AppBarTheme(

        centerTitle: true,

        elevation: 0,

        backgroundColor: Colors.white,

        foregroundColor: Colors.black,

      ),

      cardTheme: CardThemeData(

        elevation: 4,

        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(22),

        ),

      ),

      fontFamily: "Roboto",

    );

  }

}