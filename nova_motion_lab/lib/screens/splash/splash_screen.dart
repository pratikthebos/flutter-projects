import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/routes.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/nova_background.dart';
import '../../core/widgets/nova_logo.dart';
import '../../viewmodels/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration:
      const Duration(seconds: 2),
    )..forward();

    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      context
          .read<SplashViewModel>()
          .start();

      Future.delayed(
        const Duration(seconds: 3),
            () {
          if (!mounted) return;

          Navigator.pushReplacementNamed(
            context,
            Routes.dashboard,
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const NovaBackground(),

          Center(
            child: AnimatedBuilder(
              animation: controller,
              builder: (_, child) {
                return Transform.scale(
                  scale:
                  .7 +
                      controller.value * .3,
                  child: Opacity(
                    opacity:
                    controller.value,
                    child: child,
                  ),
                );
              },

              child: Column(
                mainAxisSize:
                MainAxisSize.min,
                children: [
                  const NovaLogo(
                    size: 75,
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  const Text(
                    'NOVA',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight:
                      FontWeight.w900,
                      color:
                      AppColors.white,
                      letterSpacing: 8,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Text(
                    'MOTION LAB',
                    style: TextStyle(
                      color: AppColors.cyan
                          .withValues(
                        alpha: .8,
                      ),
                      letterSpacing: 4,
                      fontWeight:
                      FontWeight.w700,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}