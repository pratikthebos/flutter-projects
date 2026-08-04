import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class JarvisApp extends StatelessWidget {
  const JarvisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "JARVIS AI",

      theme: AppTheme.darkTheme,

      initialRoute: Routes.splash,

      routes: Routes.routes,

    );
  }
}