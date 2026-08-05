import 'dart:ui';
import 'package:flutter/material.dart';

class AnimatedBlur extends StatefulWidget {
  final Widget child;

  const AnimatedBlur({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedBlur> createState() =>
      _AnimatedBlurState();
}

class _AnimatedBlurState extends State<AnimatedBlur>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: controller,

      builder: (_, __) {

        return BackdropFilter(

          filter: ImageFilter.blur(

            sigmaX: 8 + controller.value * 12,

            sigmaY: 8 + controller.value * 12,

          ),

          child: widget.child,

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