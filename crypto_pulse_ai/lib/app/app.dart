import 'package:flutter/material.dart';

import '../views/splash/splash_screen.dart';
import 'theme.dart';

class CryptoPulseApp extends StatelessWidget {
  const CryptoPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CryptoPulse AI",
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}