import 'dart:math';

import 'package:flutter/material.dart';

class ScanParticles extends StatelessWidget {
  final Animation<double> animation;

  const ScanParticles({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (
          context,
          child,
          ) {
        return CustomPaint(
          size: const Size(
            320,
            260,
          ),
          painter: _ParticlePainter(
            progress: animation.value,
          ),
        );
      },
    );
  }
}

class _ParticlePainter
    extends CustomPainter {
  final double progress;

  _ParticlePainter({
    required this.progress,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final random =
    Random(42);

    final paint = Paint();

    for (int i = 0; i < 35; i++) {
      final x =
          random.nextDouble() *
              size.width;

      final baseY =
          random.nextDouble() *
              size.height;

      final movement =
          sin(
            progress *
                pi *
                2 +
                i,
          ) *
              10;

      final y =
          baseY + movement;

      final opacity =
          .15 +
              random.nextDouble() *
                  .35;

      paint.color =
      i.isEven
          ? const Color(
        0xff22D3EE,
      ).withValues(
        alpha: opacity,
      )
          : const Color(
        0xff8B5CF6,
      ).withValues(
        alpha: opacity,
      );

      canvas.drawCircle(
        Offset(x, y),
        1.2 +
            random.nextDouble() *
                2,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant _ParticlePainter oldDelegate,
      ) {
    return oldDelegate.progress !=
        progress;
  }
}