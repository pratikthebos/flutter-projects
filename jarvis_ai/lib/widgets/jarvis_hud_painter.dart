import 'package:flutter/material.dart';

class JarvisHudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.cyanAccent.withOpacity(.6)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final glowPaint = Paint()
      ..color = Colors.cyanAccent.withOpacity(.18)
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        8,
      );

    void draw(
        Offset start,
        Offset end,
        ) {
      canvas.drawLine(start, end, glowPaint);
      canvas.drawLine(start, end, linePaint);
    }

    //-------------------------------
    // Helmet
    //-------------------------------

    draw(
      const Offset(180, 30),
      const Offset(180, 105),
    );

    //-------------------------------
    // Left Shoulder
    //-------------------------------

    draw(
      const Offset(40, 110),
      const Offset(125, 150),
    );

    //-------------------------------
    // Right Shoulder
    //-------------------------------

    draw(
      const Offset(320, 110),
      const Offset(235, 150),
    );

    //-------------------------------
    // Left Repulsor
    //-------------------------------

    draw(
      const Offset(30, 230),
      const Offset(120, 230),
    );

    //-------------------------------
    // AI Core
    //-------------------------------

    draw(
      const Offset(330, 230),
      const Offset(240, 230),
    );

    //-------------------------------
    // Arc Reactor
    //-------------------------------

    draw(
      const Offset(180, 350),
      const Offset(180, 250),
    );

    //-------------------------------
    // Left Leg
    //-------------------------------

    draw(
      const Offset(70, 455),
      const Offset(145, 345),
    );

    //-------------------------------
    // Right Leg
    //-------------------------------

    draw(
      const Offset(290, 455),
      const Offset(215, 345),
    );

    //-------------------------------
    // Flight
    //-------------------------------

    draw(
      const Offset(180, 500),
      const Offset(180, 385),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}