import 'package:auto_vison_ai/views/garage/%20garage_screen.dart';
import 'package:flutter/material.dart';

import '../views/splash/splash_screen.dart';

import '../views/scanner/scanner_screen.dart';

class Routes {

  static const splash = "/";

  static const garage = "/garage";

  static const scanner = "/scanner";

  static Map<String, WidgetBuilder> routes = {

    splash: (_) => const SplashScreen(),

    garage: (_) => const GarageScreen(),

    scanner: (_) => const ScannerScreen(),

  };

}