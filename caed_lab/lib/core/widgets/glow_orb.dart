import 'package:flutter/material.dart';

class GlowOrb extends StatefulWidget {
  final Color color;
  final double size;

  const GlowOrb({
    super.key,
    required this.color,
    this.size = 160,
  });

  @override
  State<GlowOrb> createState() => _GlowOrbState();
}

class _GlowOrbState extends State<GlowOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final scale = 0.85 + controller.value * 0.2;

        return Transform.scale(
          scale: scale,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color.withOpacity(.08),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(.20),
                  blurRadius: 70,
                  spreadRadius: 10,
                ),
              ],
            ),
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