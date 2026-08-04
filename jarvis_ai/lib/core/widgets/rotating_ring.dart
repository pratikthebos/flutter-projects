import 'package:flutter/material.dart';

class RotatingRing extends StatefulWidget {
  final double size;

  const RotatingRing({
    super.key,
    this.size = 250,
  });

  @override
  State<RotatingRing> createState() => _RotatingRingState();
}

class _RotatingRingState extends State<RotatingRing>
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

    return RotationTransition(

      turns: controller,

      child: Image.asset(
        "assets/images/hud_circle.jpg",
        width: widget.size,
        height: widget.size,
      ),

    );

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}