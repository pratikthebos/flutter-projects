import 'package:flutter/material.dart';

import '../views/splash/splash_screen.dart';
import '../views/login/login_screen.dart';
import '../views/flow/login_flow_screen.dart';
import '../views/dashboard/dashboard_screen.dart';

class AppRoutes {
  static const splash = "/";
  static const login = "/login";
  static const flow = "/flow";
  static const dashboard = "/dashboard";

  static Map<String, WidgetBuilder> routes = {

    splash: (_) => const SplashScreen(),

    login: (_) => const LoginScreen(),

    flow: (_) => const LoginFlowScreen(),

    dashboard: (_) => const DashboardScreen(),

  };
}