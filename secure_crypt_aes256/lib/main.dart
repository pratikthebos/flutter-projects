import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const SecureCryptApp(),
  );
}

class SecureCryptApp extends StatelessWidget {
  const SecureCryptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CryptoShield",
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}