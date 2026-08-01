import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class LoginFlowApp extends StatelessWidget {
  const LoginFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Architecture",

      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      initialRoute: AppRoutes.splash,

      routes: AppRoutes.routes,
    );
  }
}