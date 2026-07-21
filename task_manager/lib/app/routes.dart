import 'package:flutter/material.dart';
import 'package:task_manager/views/splash/%20splash_screen.dart';

import '../views/details/task_details_screen.dart';
import '../views/home/home_screen.dart';


class Routes {
  static const splash = "/";
  static const home = "/home";
  static const details = "/details";

  static final routes = <String, WidgetBuilder>{
    splash: (_) => const SplashScreen(),
    home: (_) => const HomeScreen(),
    details: (_) => const TaskDetailsScreen(),
  };
}