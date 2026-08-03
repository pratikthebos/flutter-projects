import 'dart:math';

import 'package:flutter/material.dart';

class RadarAnimation extends StatefulWidget {
  const RadarAnimation({super.key});

  @override
  State<RadarAnimation> createState() => _RadarAnimationState();
}

class _RadarAnimationState extends State<RadarAnimation>
    with TickerProviderStateMixin {

  late AnimationController rotationController;
  late AnimationController pulseController;

  @override
  void initState() {
    super.initState();

    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [

          //-------------------------------
          // Outer Ring
          //-------------------------------

          _ring(280, .08),

          _ring(220, .12),

          _ring(160, .18),

          _ring(100, .25),

          //-------------------------------
          // Rotating Scanner
          //-------------------------------

          RotationTransition(
            turns: rotationController,
            child: CustomPaint(
              size: const Size(280, 280),
              painter: RadarPainter(),
            ),
          ),

          //-------------------------------
          // Pulse Effect
          //-------------------------------

          AnimatedBuilder(
            animation: pulseController,
            builder: (_, __) {

              double scale =
                  0.7 + (pulseController.value * 0.6);

              return Transform.scale(
                scale: scale,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent.withOpacity(.25),
                    shape: BoxShape.circle,
                  ),
                ),
              );

            },
          ),

          //-------------------------------
          // Center Dot
          //-------------------------------

          Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
              color: Colors.cyanAccent,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ring(double size, double opacity) {

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.cyanAccent.withOpacity(opacity),
          width: 2,
        ),
      ),
    );
  }

  @override
  void dispose() {
    rotationController.dispose();
    pulseController.dispose();
    super.dispose();
  }
}

class RadarPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = size.width / 2;

    Rect rect = Rect.fromCircle(
      center: center,
      radius: radius,
    );

    Paint paint = Paint()
      ..shader = SweepGradient(
        colors: [
          Colors.transparent,
          Colors.cyanAccent.withOpacity(.15),
          Colors.cyanAccent.withOpacity(.85),
          Colors.transparent,
        ],
        stops: const [
          0.0,
          .55,
          .65,
          1.0,
        ],
      ).createShader(rect);

    canvas.drawArc(
      rect,
      -pi / 2,
      pi / 3,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}