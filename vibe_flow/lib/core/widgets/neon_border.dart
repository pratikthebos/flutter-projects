import 'package:flutter/material.dart';

class NeonBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double radius;

  const NeonBorder({
    super.key,
    required this.child,
    this.color = Colors.cyanAccent,
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.25),
            blurRadius: 25,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: color.withOpacity(0.28),
          ),
        ),
        child: child,
      ),
    );
  }
}