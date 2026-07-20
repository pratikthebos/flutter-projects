import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ProgressRing extends StatefulWidget {
  final int progress;

  const ProgressRing({
    super.key,
    required this.progress,
  });

  @override
  State<ProgressRing> createState() => _ProgressRingState();
}

class _ProgressRingState extends State<ProgressRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.progress / 100,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant ProgressRing oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.progress != widget.progress) {
      _animation = Tween<double>(
        begin: oldWidget.progress / 100,
        end: widget.progress / 100,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOutCubic,
        ),
      );

      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, __) {
          return Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(150, 150),
                painter: RingPainter(_animation.value),
              ),

              Container(
                width: 108,
                height: 108,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.liquidGradient,
                  border: Border.all(
                    color: Colors.white.withOpacity(.15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(.18),
                      blurRadius: 30,
                    ),
                  ],
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${(_animation.value * 100).toInt()}%",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Sprint",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  final double progress;

  RingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 12.0;

    final rect = Rect.fromLTWH(
      stroke,
      stroke,
      size.width - stroke * 2,
      size.height - stroke * 2,
    );

    final background = Paint()
      ..color = Colors.white.withOpacity(.08)
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke;

    final foreground = Paint()
      ..shader = SweepGradient(
        colors: const [
          Color(0xff6C63FF),
          Color(0xff00E5FF),
          Color(0xff7B61FF),
        ],
      ).createShader(rect)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      rect,
      0,
      2 * pi,
      false,
      background,
    );

    canvas.drawArc(
      rect,
      -pi / 2,
      progress * 2 * pi,
      false,
      foreground,
    );

    final angle = -pi / 2 + progress * 2 * pi;

    final point = Offset(
      size.width / 2 +
          cos(angle) * (size.width / 2 - stroke),
      size.height / 2 +
          sin(angle) * (size.height / 2 - stroke),
    );

    canvas.drawCircle(
      point,
      7,
      Paint()..color = Colors.white,
    );

    canvas.drawCircle(
      point,
      13,
      Paint()
        ..color = AppColors.secondary.withOpacity(.25)
        ..maskFilter = const MaskFilter.blur(
          BlurStyle.normal,
          12,
        ),
    );
  }

  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}