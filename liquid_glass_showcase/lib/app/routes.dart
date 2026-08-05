import 'package:flutter/material.dart';

import '../views/splash/splash_screen.dart';
import '../views/home/home_screen.dart';
import '../views/gallery/gallery_screen.dart';

class Routes {

  static const splash = "/";

  static const home = "/home";

  static const gallery = "/gallery";

  static Map<String, WidgetBuilder> routes = {

    splash: (_) => const SplashScreen(),

    home: (_) => const HomeScreen(),

    gallery: (_) => const GalleryScreen(),

  };

}