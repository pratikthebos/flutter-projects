import 'package:flutter/material.dart';

import '../screens/dashboard_screen.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (_) => const SplashScreen(),
    '/dashboard': (_) => const DashboardScreen(),
  };
}