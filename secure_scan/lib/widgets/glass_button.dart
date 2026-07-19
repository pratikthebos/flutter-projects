import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class GlassButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool loading;
  final List<Color>? gradient;

  const GlassButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
    this.loading = false,
    this.gradient,
  });

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  bool _pressed = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = widget.gradient ?? AppColors.cyber;

    return AnimatedScale(
      duration: const Duration(milliseconds: 150),
      scale: _pressed ? .97 : 1,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) {
          setState(() => _pressed = false);

          if (!widget.loading) {
            widget.onPressed?.call();
          }
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment(
                    -1 + _controller.value,
                    -1,
                  ),
                  end: Alignment(
                    1,
                    1 - _controller.value,
                  ),
                  colors: colors,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colors.first.withOpacity(.45),
                    blurRadius: 25,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _ShinePainter(_controller.value),
                    ),
                  ),
                  Center(
                    child: widget.loading
                        ? const SizedBox(
                      width: 26,
                      height: 26,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.white,
                      ),
                    )
                        : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          widget.icon,
                          color: Colors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          widget.text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ShinePainter extends CustomPainter {
  final double animation;

  _ShinePainter(this.animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final shimmer = LinearGradient(
      begin: Alignment(-1 + animation * 2, 0),
      end: Alignment(animation * 2, 0),
      colors: [
        Colors.transparent,
        Colors.white.withOpacity(.22),
        Colors.transparent,
      ],
      stops: const [
        .2,
        .5,
        .8,
      ],
    );

    paint.shader = shimmer.createShader(rect);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        rect,
        const Radius.circular(20),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ShinePainter oldDelegate) {
    return animation != oldDelegate.animation;
  }
}