import 'dart:math';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class VerificationRing extends StatelessWidget {
  final Animation<double> rotation;
  final Animation<double> pulse;

  const VerificationRing({
    super.key,
    required this.rotation,
    required this.pulse,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        rotation,
        pulse,
      ]),
      builder: (
          context,
          child,
          ) {
        final double scale =
            1 + pulse.value * .06;

        return Transform.scale(
          scale: scale,
          child: SizedBox(
            width: 190,
            height: 190,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle:
                  rotation.value * pi * 2,
                  child: CustomPaint(
                    size:
                    const Size(
                      190,
                      190,
                    ),
                    painter:
                    _VerificationPainter(),
                  ),
                ),

                Container(
                  width: 116,
                  height: 116,
                  decoration:
                  BoxDecoration(
                    shape: BoxShape.circle,
                    gradient:
                    AppTheme.successGradient,
                    boxShadow: [
                      BoxShadow(
                        color:
                        AppTheme.success
                            .withValues(
                          alpha: .35,
                        ),
                        blurRadius: 35,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 62,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VerificationPainter
    extends CustomPainter {
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
        size.width / 2 - 8;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..shader = const SweepGradient(
        colors: [
          Colors.transparent,
          AppTheme.success,
          Colors.transparent,
          AppTheme.cyan,
        ],
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
      );

    canvas.drawCircle(
      center,
      radius,
      paint,
    );

    final dotPaint = Paint()
      ..color = AppTheme.success;

    for (int i = 0; i < 8; i++) {
      final angle =
          (pi * 2 / 8) * i;

      final offset = Offset(
        center.dx +
            cos(angle) *
                (radius + 2),
        center.dy +
            sin(angle) *
                (radius + 2),
      );

      canvas.drawCircle(
        offset,
        2.5,
        dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant CustomPainter oldDelegate,
      ) {
    return true;
  }
}