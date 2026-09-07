import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/demo_card_model.dart';

class Depth4DCard extends StatefulWidget {
  final DemoCardModel item;

  const Depth4DCard({
    super.key,
    required this.item,
  });

  @override
  State<Depth4DCard> createState() => _Depth4DCardState();
}

class _Depth4DCardState
    extends State<Depth4DCard>
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
        final value = controller.value;

        final rotation =
            math.sin(value * math.pi * 2) * .035;

        final scale =
            0.97 + math.sin(value * math.pi * 2) * .03;

        return Container(
          height: 330,
          margin: const EdgeInsets.only(bottom: 25),
          alignment: Alignment.center,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, .0015)
              ..rotateX(rotation)
              ..rotateY(rotation * 1.5)
              ..scale(scale),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Back layer
                Transform.translate(
                  offset: const Offset(0, 18),
                  child: _Layer(
                    item: item,
                    opacity: .10,
                    scale: .90,
                  ),
                ),

                // Middle layer
                Transform.translate(
                  offset: const Offset(0, 9),
                  child: _Layer(
                    item: item,
                    opacity: .16,
                    scale: .95,
                  ),
                ),

                // Main layer
                _Layer(
                  item: item,
                  opacity: .95,
                  scale: 1,
                  main: true,
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

class _Layer extends StatelessWidget {
  final DemoCardModel item;
  final double opacity;
  final double scale;
  final bool main;

  const _Layer({
    required this.item,
    required this.opacity,
    required this.scale,
    this.main = false,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Container(
        width: double.infinity,
        height: 270,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              item.primary.withOpacity(opacity),
              Colors.black.withOpacity(.95),
              item.secondary.withOpacity(opacity),
            ],
          ),
          border: Border.all(
            color: item.primary.withOpacity(
              main ? .45 : .12,
            ),
          ),
          boxShadow: main
              ? [
            BoxShadow(
              color:
              item.primary.withOpacity(.20),
              blurRadius: 40,
            ),
          ]
              : null,
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Icon(
              item.icon,
              color: item.primary,
              size: 42,
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
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}