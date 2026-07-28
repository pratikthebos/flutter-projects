import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class SecureGateApp extends StatelessWidget {
  const SecureGateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SecureGate",

      theme: AppTheme.darkTheme,

      initialRoute: AppRoutes.splash,

      routes: AppRoutes.routes,
    );
  }
}