import 'package:flutter/material.dart';

import '../models/demo_card_model.dart';

class HolographicCard extends StatefulWidget {
  final DemoCardModel item;

  const HolographicCard({
    super.key,
    required this.item,
  });

  @override
  State<HolographicCard> createState() =>
      _HolographicCardState();
}

class _HolographicCardState
    extends State<HolographicCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final v = controller.value;

        return Container(
          height: 300,
          margin: const EdgeInsets.only(bottom: 22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: item.primary.withOpacity(.35),
            ),
            gradient: LinearGradient(
              begin: Alignment(
                -1 + v * 2,
                -1,
              ),
              end: Alignment(
                1 - v * 2,
                1,
              ),
              colors: [
                item.primary.withOpacity(.18),
                Colors.transparent,
                item.secondary.withOpacity(.18),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: item.primary.withOpacity(.18),
                blurRadius: 35,
              ),
            ],
          ),
          child: Stack(
            children: [
              // Holographic grid
              CustomPaint(
                painter: _GridPainter(
                  color: item.primary,
                  progress: v,
                ),
                size: Size.infinite,
              ),

              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Icon(
                      item.icon,
                      color: item.primary,
                      size: 40,
                    ),
                    const Spacer(),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: item.primary,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      item.subtitle,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
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

class _GridPainter extends CustomPainter {
  final Color color;
  final double progress;

  _GridPainter({
    required this.color,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(.10)
      ..strokeWidth = 1;

    const spacing = 25.0;

    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    final offset = progress * spacing;

    for (
    double y = -spacing + offset;
    y < size.height;
    y += spacing
    ) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}