import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData darkTheme = ThemeData(

    brightness: Brightness.dark,

    scaffoldBackgroundColor: const Color(0xff050816),

    primaryColor: const Color(0xff00D9FF),

    colorScheme: const ColorScheme.dark(

      primary: Color(0xff00D9FF),

      secondary: Color(0xff7A5CFF),

    ),

    appBarTheme: const AppBarTheme(

      elevation: 0,

      backgroundColor: Colors.transparent,

      centerTitle: true,

    ),

    cardColor: Colors.white10,

    useMaterial3: true,

    fontFamily: "Roboto",

  );

}