import 'package:flutter/material.dart';

import '../views/demo/demo_screen.dart';
import '../views/home/home_screen.dart';
import '../views/splash/splash_screen.dart';

class Routes {
  static const splash = '/';
  static const home = '/home';
  static const demo = '/demo';

  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    home: (_) => const HomeScreen(),
    demo: (_) => const DemoScreen(),
  };
}