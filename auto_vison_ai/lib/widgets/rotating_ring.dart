import 'package:flutter/material.dart';

class RotatingRing extends StatefulWidget {
  final double size;

  const RotatingRing({
    super.key,
    required this.size,
  });

  @override
  State<RotatingRing> createState() => _RotatingRingState();
}

class _RotatingRingState extends State<RotatingRing>
    with SingleTickerProviderStateMixin {

  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: controller,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.cyanAccent,
            width: 2,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}