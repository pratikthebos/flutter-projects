import 'package:flutter/material.dart';

import '../views/splash/splash_screen.dart';
import 'theme.dart';

class EduFlowApp extends StatelessWidget {
  const EduFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Pilot',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}