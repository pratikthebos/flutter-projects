import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.background,
          ),
          child: Stack(
            children: [

              /// Aurora Gradient
              Positioned.fill(
                child: CustomPaint(
                  painter: AuroraPainter(controller.value),
                ),
              ),

              /// Glass Orb 1
              Positioned(
                left: -80,
                top: -50,
                child: FloatingGlassOrb(
                  size: 260,
                  color: Colors.blue.withOpacity(.25),
                  progress: controller.value,
                ),
              ),

              /// Glass Orb 2
              Positioned(
                right: -90,
                bottom: -60,
                child: FloatingGlassOrb(
                  size: 300,
                  color: Colors.purple.withOpacity(.22),
                  progress: controller.value + .4,
                ),
              ),

              /// Glass Orb 3
              Positioned(
                right: 70,
                top: 120,
                child: FloatingGlassOrb(
                  size: 120,
                  color: Colors.cyan.withOpacity(.18),
                  progress: controller.value + .7,
                ),
              ),

              /// Blur Overlay
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 45,
                    sigmaY: 45,
                  ),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),

              /// Floating Particles
              Positioned.fill(
                child: CustomPaint(
                  painter: ParticlePainter(controller.value),
                ),
              ),

              widget.child,
            ],
          ),
        );
      },
    );
  }
}

class FloatingGlassOrb extends StatelessWidget {
  final double size;
  final Color color;
  final double progress;

  const FloatingGlassOrb({
    super.key,
    required this.size,
    required this.color,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        sin(progress * pi * 2) * 25,
        cos(progress * pi * 2) * 18,
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color,
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}

class AuroraPainter extends CustomPainter {
  final double progress;

  AuroraPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment(
          -1 + progress,
          -1,
        ),
        end: Alignment(
          1,
          1 - progress,
        ),
        colors: [
          const Color(0xff6C63FF).withOpacity(.22),
          const Color(0xff00E5FF).withOpacity(.18),
          const Color(0xffEC4899).withOpacity(.18),
          Colors.transparent,
        ],
      ).createShader(rect);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ParticlePainter extends CustomPainter {
  final double progress;

  ParticlePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(.08);

    for (int i = 0; i < 55; i++) {
      final dx = (i * 41.0) % size.width;

      final dy =
          ((i * 83.0) + progress * size.height) % size.height;

      canvas.drawCircle(
        Offset(dx, dy),
        1.5 + sin(progress * pi * 2 + i),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}