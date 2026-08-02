import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class CanteenApp extends StatelessWidget {
  const CanteenApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Smart Canteen",

      theme: AppTheme.lightTheme,

      initialRoute: Routes.splash,

      routes: Routes.routes,

    );
  }
}