import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SmartWalletApp());
}

class SmartWalletApp extends StatelessWidget {
  const SmartWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Premium Wallet",
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        scaffoldBackgroundColor: const Color(0xffEEF2F8),

        textTheme: GoogleFonts.poppinsTextTheme(),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff6A5AE0),
        ),
      ),

      home: const HomeScreen(),
    );
  }
}