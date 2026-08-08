import 'dart:async';

import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/animated_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    Timer(
      const Duration(seconds: 3),
          () {
        if (!mounted) return;

        Navigator.pushReplacementNamed(
          context,
          Routes.dashboard,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(),

          Center(
            child: AnimatedBuilder(
              animation: controller,
              builder: (_, __) {
                final scale =
                    .92 + controller.value * .08;

                return Transform.scale(
                  scale: scale,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 145,
                        height: 145,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff6C63FF),
                              Color(0xff00C6FF),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff6C63FF)
                                  .withOpacity(.30),
                              blurRadius: 45,
                              spreadRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.hourglass_top_rounded,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),

                      const SizedBox(height: 35),

                      const Text(
                        AppStrings.appName,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff172033),
                          letterSpacing: 2,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        AppStrings.tagline,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff687386),
                        ),
                      ),

                      const SizedBox(height: 40),

                      const SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor:
                          AlwaysStoppedAnimation(
                            Color(0xff6C63FF),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const Positioned(
            bottom: 35,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                AppStrings.splashBottom,
                style: TextStyle(
                  color: Color(0xff8A94A6),
                  fontSize: 13,
                ),
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