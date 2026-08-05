import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class LiquidGlassApp extends StatelessWidget {
  const LiquidGlassApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Liquid Glass UI",

      theme: AppTheme.darkTheme,

      initialRoute: Routes.splash,

      routes: Routes.routes,

    );

  }
}