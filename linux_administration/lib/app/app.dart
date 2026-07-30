import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class SysOpsApp extends StatelessWidget {
  const SysOpsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      routes: AppRoutes.routes,

      initialRoute: AppRoutes.splash,
    );
  }
}