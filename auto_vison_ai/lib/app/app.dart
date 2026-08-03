import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class AutoVisionApp extends StatelessWidget {

  const AutoVisionApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Auto Vision AI",

      theme: AppTheme.light,

      initialRoute: Routes.splash,

      routes: Routes.routes,

    );

  }

}