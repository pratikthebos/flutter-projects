import 'package:flutter/material.dart';

class ParallaxAnimation extends StatelessWidget {
  final ScrollController controller;
  final int index;
  final Widget child;

  const ParallaxAnimation({
    super.key,
    required this.controller,
    required this.index,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final position = index * 370.0;
        final scrollOffset = controller.hasClients
            ? controller.offset
            : 0.0;

        final difference = position - scrollOffset;

        final offset = (difference / 700).clamp(-0.10, 0.10);

        return Transform.translate(
          offset: Offset(0, offset * 45),
          child: child,
        );
      },
      child: child,
    );
  }
}