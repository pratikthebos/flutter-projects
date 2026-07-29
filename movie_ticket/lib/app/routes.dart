import 'package:flutter/material.dart';

import '../views/home/home_screen.dart';
import '../views/splash/splash_screen.dart';

class AppRoutes {

  static const splash = "/";

  static const home = "/home";

  static Map<String, WidgetBuilder> routes = {

    splash: (_) => const SplashScreen(),

    home: (_) => const HomeScreen(),

  };
}