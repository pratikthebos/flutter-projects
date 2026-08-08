import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

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
      duration: const Duration(seconds: 12),
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffF8FAFF),
                    Color(0xffEEF2FF),
                    Color(0xffF9F5FF),
                  ],
                ),
              ),
            ),

            Positioned(
              left: -100 + sin(value * pi * 2) * 60,
              top: -80,
              child: _blob(
                260,
                const Color(0xff7C6CFF),
              ),
            ),

            Positioned(
              right: -100,
              top: 260 + cos(value * pi * 2) * 60,
              child: _blob(
                230,
                const Color(0xff00C6FF),
              ),
            ),

            Positioned(
              left: 100,
              bottom: -120 + sin(value * pi * 2) * 50,
              child: _blob(
                280,
                const Color(0xffff70B8),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _blob(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.18),
            blurRadius: 120,
            spreadRadius: 30,
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