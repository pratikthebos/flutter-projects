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
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {

        return Stack(
          children: [

            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffF7FBFF),
                    Color(0xffE8F7FF),
                    Color(0xffFFFFFF),
                  ],
                ),
              ),
            ),

            Positioned(
              left: -80 +
                  sin(controller.value * pi * 2) * 40,
              top: -50,
              child: _blob(
                220,
                Colors.lightBlueAccent,
              ),
            ),

            Positioned(
              right: -70,
              bottom:
              -50 +
                  cos(controller.value * pi * 2) * 30,
              child: _blob(
                200,
                Colors.greenAccent,
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
            spreadRadius: 20,
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