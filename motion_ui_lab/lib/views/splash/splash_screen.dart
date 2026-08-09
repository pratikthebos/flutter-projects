import 'dart:async';

import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/animated_background.dart';
import '../../core/widgets/gradient_text.dart';

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
    )..repeat(
      reverse: true,
    );

    Timer(
      const Duration(seconds: 3),
          () {
        if (!mounted) return;

        Navigator.pushReplacementNamed(
          context,
          Routes.home,
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
                    .94 +
                        controller.value * .06;

                return Transform.scale(
                  scale: scale,
                  child: Column(
                    mainAxisSize:
                    MainAxisSize.min,
                    children: [
                      Container(
                        width: 145,
                        height: 145,
                        decoration:
                        BoxDecoration(
                          shape:
                          BoxShape.circle,
                          gradient:
                          const LinearGradient(
                            begin:
                            Alignment.topLeft,
                            end: Alignment
                                .bottomRight,
                            colors: [
                              Color(
                                0xff6C63FF,
                              ),
                              Color(
                                0xff00C6FF,
                              ),
                              Color(
                                0xffEC4899,
                              ),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                              const Color(
                                0xff6C63FF,
                              ).withValues(
                                alpha: .28,
                              ),
                              blurRadius: 45,
                              spreadRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons
                              .auto_awesome_rounded,
                          color: Colors.white,
                          size: 68,
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      const GradientText(
                        text:
                        AppStrings.appName,
                        fontSize: 42,
                      ),

                      const SizedBox(
                        height: 3,
                      ),

                      const Text(
                        AppStrings.appSuffix,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight:
                          FontWeight.w800,
                          letterSpacing: 6,
                          color:
                          Color(0xff687386),
                        ),
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      const Text(
                        AppStrings.tagline,
                        textAlign:
                        TextAlign.center,
                        style: TextStyle(
                          color:
                          Color(0xff687386),
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(
                        height: 35,
                      ),

                      const SizedBox(
                        width: 28,
                        height: 28,
                        child:
                        CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor:
                          AlwaysStoppedAnimation(
                            Color(
                              0xff6C63FF,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
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