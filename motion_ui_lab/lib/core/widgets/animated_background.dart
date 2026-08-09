import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({
    super.key,
  });

  @override
  State<AnimatedBackground> createState() =>
      _AnimatedBackgroundState();
}

class _AnimatedBackgroundState
    extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final value = controller.value;

        return Stack(
          children: [
            Container(
              decoration:
              const BoxDecoration(
                gradient:
                LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffF9FAFF),
                    Color(0xffF0F4FF),
                    Color(0xffFCF8FF),
                  ],
                ),
              ),
            ),

            Positioned(
              left:
              -100 +
                  sin(value * pi * 2) *
                      50,
              top: -80,
              child: _orb(
                260,
                const Color(0xff8B5CF6),
              ),
            ),

            Positioned(
              right: -100,
              top:
              250 +
                  cos(value * pi * 2) *
                      60,
              child: _orb(
                240,
                const Color(0xff06B6D4),
              ),
            ),

            Positioned(
              left: 80,
              bottom:
              -130 +
                  sin(value * pi * 2) *
                      40,
              child: _orb(
                270,
                const Color(0xffEC4899),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _orb(
      double size,
      Color color,
      ) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(
              alpha: .14,
            ),
            blurRadius: 120,
            spreadRadius: 25,
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