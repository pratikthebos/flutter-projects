import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class NovaBackground extends StatefulWidget {
  const NovaBackground({
    super.key,
  });

  @override
  State<NovaBackground> createState() =>
      _NovaBackgroundState();
}

class _NovaBackgroundState
    extends State<NovaBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 8,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final t = controller.value * pi * 2;

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.background,
                AppColors.background2,
                Color(0xff0B0A1C),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: -100 + sin(t) * 30,
                top: -100 + cos(t) * 25,
                child: _glow(
                  AppColors.purple,
                ),
              ),

              Positioned(
                right: -120 + cos(t) * 35,
                top: 180 + sin(t) * 40,
                child: _glow(
                  AppColors.cyan,
                ),
              ),

              Positioned(
                left: 80 + sin(t * .7) * 50,
                bottom: -140,
                child: _glow(
                  AppColors.pink,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _glow(Color color) {
    return Container(
      width: 260,
      height: 260,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withValues(alpha: .13),
            color.withValues(alpha: .04),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}