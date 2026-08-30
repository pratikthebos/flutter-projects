import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class NovaMotionLabApp extends StatelessWidget {
  const NovaMotionLabApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'NOVA Motion Lab',

      theme: NovaTheme.theme,

      initialRoute: Routes.splash,

      routes: Routes.routes,
    );
  }
}