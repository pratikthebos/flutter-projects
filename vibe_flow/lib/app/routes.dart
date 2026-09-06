import 'package:flutter/material.dart';

import '../views/home/home_screen.dart';

class AppRoutes {
  static const home = '/';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
  };
}