import 'dart:math';

import 'package:flutter/material.dart';

class OrbitLoader extends StatefulWidget {
  const OrbitLoader({super.key});

  @override
  State<OrbitLoader> createState() =>
      _OrbitLoaderState();
}

class _OrbitLoaderState extends State<OrbitLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return SizedBox(
          width: 80,
          height: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff6C63FF),
                ),
              ),
              Transform.rotate(
                angle: controller.value * pi * 2,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff00C6FF),
                    ),
                  ),
                ),
              ),
              Transform.rotate(
                angle: controller.value * pi * 2 + pi,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 11,
                    height: 11,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffff4F9A),
                    ),
                  ),
                ),
              ),
            ],
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