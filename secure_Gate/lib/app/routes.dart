import 'package:flutter/material.dart';

import '../views/dashboard/dashboard_screen.dart';
import '../views/history/history_screen.dart';
import '../views/splash/splash_screen.dart';
import '../views/visitor/visitor_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const splash = "/";
  static const dashboard = "/dashboard";
  static const visitor = "/visitor";
  static const history = "/history";

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    dashboard: (_) => const DashboardScreen(),
    visitor: (_) => const VisitorScreen(),
    history: (_) => const HistoryScreen(),
  };
}