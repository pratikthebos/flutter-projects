import 'package:flutter/material.dart';

import '../views/dashboard/dashboard_screen.dart';
import '../views/glass3d/glass3d_screen.dart';
import '../views/parallax/parallax_screen.dart';
import '../views/liquid/liquid_screen.dart';
import '../views/neon/neon_screen.dart';
import '../views/holographic/holographic_screen.dart';
import '../views/depth4d/depth4d_screen.dart';

class AppRoutes {
  static const String dashboard = '/';

  static const String glass3d = '/glass3d';
  static const String parallax = '/parallax';
  static const String liquid = '/liquid';
  static const String neon = '/neon';
  static const String holographic = '/holographic';
  static const String depth4d = '/depth4d';

  static final Map<String, WidgetBuilder> routes = {
    dashboard: (_) => const DashboardScreen(),
    glass3d: (_) => const Glass3DScreen(),
    parallax: (_) => const ParallaxScreen(),
    liquid: (_) => const LiquidScreen(),
    neon: (_) => const NeonScreen(),
    holographic: (_) => const HolographicScreen(),
    depth4d: (_) => const Depth4DScreen(),
  };
}