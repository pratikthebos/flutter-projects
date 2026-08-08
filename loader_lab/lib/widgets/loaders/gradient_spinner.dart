import 'dart:math';

import 'package:flutter/material.dart';

class GradientSpinner extends StatefulWidget {
  const GradientSpinner({super.key});

  @override
  State<GradientSpinner> createState() =>
      _GradientSpinnerState();
}

class _GradientSpinnerState
    extends State<GradientSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Transform.rotate(
          angle: controller.value * pi * 2,
          child: ShaderMask(
            shaderCallback: (bounds) {
              return const SweepGradient(
                colors: [
                  Color(0xff6C63FF),
                  Color(0xff00C6FF),
                  Color(0xffff4F9A),
                  Colors.transparent,
                ],
              ).createShader(bounds);
            },
            child: const SizedBox(
              width: 65,
              height: 65,
              child: CircularProgressIndicator(
                strokeWidth: 7,
                valueColor:
                AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}