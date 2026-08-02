import 'package:flutter/material.dart';

import '../views/splash/splash_screen.dart';
import '../views/dashboard/dashboard_screen.dart';
import '../views/meals/meals_screen.dart';
import '../views/attendance/attendance_screen.dart';
import '../views/housekeeping/housekeeping_screen.dart';
import '../views/inventory/inventory_screen.dart';
import '../views/reports/reports_screen.dart';

class Routes {

  static const splash = "/";
  static const dashboard = "/dashboard";
  static const meals = "/meals";
  static const attendance = "/attendance";
  static const housekeeping = "/housekeeping";
  static const inventory = "/inventory";
  static const reports = "/reports";

  static Map<String, WidgetBuilder> routes = {

    splash: (_) => const SplashScreen(),

    dashboard: (_) => const DashboardScreen(),

    meals: (_) => const MealsScreen(),

    attendance: (_) => const AttendanceScreen(),

    housekeeping: (_) => const HousekeepingScreen(),

    inventory: (_) => const InventoryScreen(),

    reports: (_) => const ReportsScreen(),

  };

}