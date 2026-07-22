import 'package:api_tester_pro/views/dashboard/%20dashboard_screen.dart';
import 'package:flutter/material.dart';

import '../views/response/response_screen.dart';
import '../views/splash/splash_screen.dart';

class AppRoutes {
  static const splash = "/";
  static const dashboard = "/dashboard";
  static const response = "/response";

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    dashboard: (_) => const DashboardScreen(),
    response: (_) => const ResponseScreen(),
  };
}