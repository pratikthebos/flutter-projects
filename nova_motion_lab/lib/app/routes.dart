import 'package:flutter/material.dart';

import '../screens/dashboard/dashboard_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/animation/animation_screen.dart';
import '../screens/color/nova_color_screen.dart';
import '../screens/future/future_interaction_screen.dart';
import '../screens/space/nova_space_screen.dart';
import '../screens/wave/nova_wave_screen.dart';
import '../screens/scroll/animation_scroll_screen.dart';

class Routes {
  static const splash = '/';
  static const dashboard = '/dashboard';

  static const animation = '/animation';
  static const color = '/color';
  static const future = '/future';
  static const space = '/space';
  static const wave = '/wave';
  static const scroll = '/scroll';

  static Map<String, WidgetBuilder> get routes {
    return {
      splash: (_) => const SplashScreen(),
      dashboard: (_) => const DashboardScreen(),

      animation: (_) => const AnimationScreen(),
      color: (_) => const NovaColorScreen(),
      future: (_) => const FutureInteractionScreen(),
      space: (_) => const NovaSpaceScreen(),
      wave: (_) => const NovaWaveScreen(),
      scroll: (_) => const AnimationScrollScreen(),
    };
  }
}