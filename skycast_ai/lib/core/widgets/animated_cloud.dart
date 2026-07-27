import 'package:flutter/material.dart';

class AnimatedCloud extends StatefulWidget {
  const AnimatedCloud({super.key});

  @override
  State<AnimatedCloud> createState() => _AnimatedCloudState();
}

class _AnimatedCloudState extends State<AnimatedCloud>
    with SingleTickerProviderStateMixin {

  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(
            controller.value * 12,
            0,
          ),
          child: child,
        );
      },
      child: const Icon(
        Icons.cloud_rounded,
        size: 85,
        color: Colors.white70,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}