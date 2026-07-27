import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/constants/app_colors.dart';
import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff0B1020),
              Color(0xff4F46E5),
              Color(0xff7C3AED),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -80,
              left: -60,
              child: _glowCircle(220),
            ),
            Positioned(
              bottom: -100,
              right: -60,
              child: _glowCircle(260),
            ),
            Positioned(
              top: 120,
              left: 40,
              child: Icon(
                Icons.cloud,
                color: Colors.white24,
                size: 80,
              )
                  .animate(onPlay: (c) => c.repeat())
                  .moveX(
                begin: -20,
                end: 20,
                duration: 4.seconds,
              ),
            ),
            Positioned(
              top: 220,
              right: 30,
              child: Icon(
                Icons.cloud,
                color: Colors.white30,
                size: 60,
              )
                  .animate(onPlay: (c) => c.repeat())
                  .moveX(
                begin: 20,
                end: -20,
                duration: 5.seconds,
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RotationTransition(
                    turns: controller,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppColors.gradient,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(.35),
                            blurRadius: 40,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.wb_sunny_rounded,
                        color: Colors.amber,
                        size: 80,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    "SkyCast AI",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "AI Powered Weather Forecast",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _glowCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(.05),
      ),
    );
  }
}