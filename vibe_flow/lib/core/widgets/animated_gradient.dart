import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AnimatedGradient extends StatefulWidget {
  final Widget child;

  const AnimatedGradient({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedGradient> createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<AnimatedGradient>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        final value = controller.value;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1 + value * 2, -1),
              end: Alignment(1 - value * 2, 1),
              colors: const [
                AppColors.purple,
                AppColors.blue,
                AppColors.cyan,
                AppColors.purple,
              ],
            ),
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}