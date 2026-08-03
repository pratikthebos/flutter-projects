import 'package:flutter/material.dart';

class HudBackground extends StatelessWidget {
  const HudBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HudPainter(),
      size: Size.infinite,
    );
  }
}

class _HudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.cyan.withOpacity(.06)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const gap = 35.0;

    for (double x = 0; x < size.width; x += gap) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    for (double y = 0; y < size.height; y += gap) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}