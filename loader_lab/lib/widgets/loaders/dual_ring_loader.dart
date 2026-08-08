import 'dart:math';

import 'package:flutter/material.dart';

class DualRingLoader extends StatefulWidget {
  const DualRingLoader({
    super.key,
  });

  @override
  State<DualRingLoader> createState() =>
      _DualRingLoaderState();
}

class _DualRingLoaderState
    extends State<DualRingLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1400,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,

      builder: (context, child) {
        final rotation =
            controller.value * pi * 2;

        return SizedBox(
          width: 100,
          height: 100,

          child: Stack(
            alignment: Alignment.center,
            children: [

              //================================================
              // OUTER ROTATING RING
              //================================================

              Transform.rotate(
                angle: rotation,

                child: CustomPaint(
                  size: const Size(
                    86,
                    86,
                  ),

                  painter: _RingPainter(
                    color:
                    const Color(0xff6C63FF),

                    strokeWidth: 6,

                    startAngle: -pi / 2,

                    sweepAngle:
                    pi * 1.35,
                  ),
                ),
              ),

              //================================================
              // OUTER GLOW DOT
              //================================================

              Transform.rotate(
                angle: rotation,

                child: SizedBox(
                  width: 86,
                  height: 86,

                  child: Align(
                    alignment:
                    Alignment.topCenter,

                    child: Container(
                      width: 11,
                      height: 11,

                      decoration:
                      BoxDecoration(
                        shape:
                        BoxShape.circle,

                        color:
                        const Color(
                          0xff6C63FF,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color:
                            const Color(
                              0xff6C63FF,
                            ).withValues(
                              alpha: .65,
                            ),

                            blurRadius: 12,

                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //================================================
              // INNER ROTATING RING
              //================================================

              Transform.rotate(
                angle: -rotation * 1.35,

                child: CustomPaint(
                  size: const Size(
                    56,
                    56,
                  ),

                  painter: _RingPainter(
                    color:
                    const Color(0xff00C6FF),

                    strokeWidth: 5,

                    startAngle: pi / 2,

                    sweepAngle:
                    pi * 1.25,
                  ),
                ),
              ),

              //================================================
              // INNER GLOW DOT
              //================================================

              Transform.rotate(
                angle: -rotation * 1.35,

                child: SizedBox(
                  width: 56,
                  height: 56,

                  child: Align(
                    alignment:
                    Alignment.bottomCenter,

                    child: Container(
                      width: 9,
                      height: 9,

                      decoration:
                      BoxDecoration(
                        shape:
                        BoxShape.circle,

                        color:
                        const Color(
                          0xff00C6FF,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color:
                            const Color(
                              0xff00C6FF,
                            ).withValues(
                              alpha: .7,
                            ),

                            blurRadius: 10,

                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //================================================
              // CENTER
              //================================================

              Container(
                width: 10,
                height: 10,

                decoration:
                BoxDecoration(
                  shape:
                  BoxShape.circle,

                  color: Colors.white,

                  boxShadow: [
                    BoxShadow(
                      color:
                      const Color(
                        0xff6C63FF,
                      ).withValues(
                        alpha: .35,
                      ),

                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
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

//==============================================================
// RING PAINTER
//==============================================================

class _RingPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double startAngle;
  final double sweepAngle;

  _RingPainter({
    required this.color,
    required this.strokeWidth,
    required this.startAngle,
    required this.sweepAngle,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius =
        min(size.width, size.height) / 2 -
            strokeWidth / 2;

    final rect = Rect.fromCircle(
      center: center,
      radius: radius,
    );

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(
      covariant _RingPainter oldDelegate,
      ) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.startAngle != startAngle ||
        oldDelegate.sweepAngle != sweepAngle;
  }
}