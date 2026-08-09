import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class MotionUILabApp extends StatelessWidget {
  const MotionUILabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'MotionUI Lab',

      theme: AppTheme.light,

      initialRoute: Routes.splash,

      routes: Routes.routes,
    );
  }
}