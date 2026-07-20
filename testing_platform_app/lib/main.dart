import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'utils/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QAFlowAIApp());
}

class QAFlowAIApp extends StatelessWidget {
  const QAFlowAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Agentic QA Platform",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}