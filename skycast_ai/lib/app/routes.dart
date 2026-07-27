import 'package:flutter/material.dart';

import '../views/splash/splash_screen.dart';
import '../views/home/home_screen.dart';
import '../views/forecast/forecast_screen.dart';
import '../views/analytics/analytics_screen.dart';

class AppRoutes {
  static const splash = "/";
  static const home = "/home";
  static const forecast = "/forecast";
  static const analytics = "/analytics";

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    home: (_) => const HomeScreen(),
    forecast: (_) => const ForecastScreen(),
    analytics: (_) => const AnalyticsScreen(),
  };
}