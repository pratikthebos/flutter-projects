import 'dart:math';

import 'package:flutter/material.dart';

class RotatingRingLoader extends StatefulWidget {
  const RotatingRingLoader({super.key});

  @override
  State<RotatingRingLoader> createState() =>
      _RotatingRingLoaderState();
}

class _RotatingRingLoaderState
    extends State<RotatingRingLoader>
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
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.transparent,
                width: 6,
              ),
              gradient: const SweepGradient(
                colors: [
                  Color(0xff6C63FF),
                  Color(0xff00C6FF),
                  Colors.transparent,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF4F1FF),
                ),
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