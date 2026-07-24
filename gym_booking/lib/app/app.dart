import 'package:flutter/material.dart';

import '../views/splash/splash_screen.dart';
import 'theme.dart';

class FitAIApp extends StatelessWidget {
  const FitAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitAI',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      home: const SplashScreen(),
    );
  }
}