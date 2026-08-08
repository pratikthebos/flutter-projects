import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class LoaderLabApp extends StatelessWidget {
  const LoaderLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LoaderLab",
      theme: AppTheme.light,
      initialRoute: Routes.splash,
      routes: Routes.routes,
    );
  }
}