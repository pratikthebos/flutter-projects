import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import 'app_theme.dart';

class BrandBoostApp extends StatelessWidget {
  const BrandBoostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrandBoost AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const HomeScreen(),
    );
  }
}
