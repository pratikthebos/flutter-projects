import 'package:flutter/material.dart';

import '../views/dashboard/dashboard_screen.dart';
import '../views/splash/splash_screen.dart';

class AppRoutes {
  static const splash = "/";

  static const dashboard = "/dashboard";

  static Map<String, WidgetBuilder> routes = {

    splash: (_) => const SplashScreen(),

    dashboard: (_) => const DashboardScreen(),

  };
}