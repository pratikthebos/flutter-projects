import 'package:flutter/material.dart';

import '../views/splash/splash_screen.dart';
import '../views/dashboard/dashboard_screen.dart';

class Routes {
  static const splash = "/";
  static const dashboard = "/dashboard";

  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    dashboard: (_) => const DashboardScreen(),
  };
}