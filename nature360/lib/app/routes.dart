import 'package:flutter/material.dart';

import '../views/home/home_screen.dart';
import '../views/splash/splash_screen.dart';
import '../views/viewer/viewer_screen.dart';

class Routes {

  static const splash = "/";

  static const home = "/home";

  static const viewer = "/viewer";

  static Map<String, WidgetBuilder> routes = {

    splash: (_) => const SplashScreen(),

    home: (_) => const HomeScreen(),

    viewer: (_) => const ViewerScreen(),

  };

}