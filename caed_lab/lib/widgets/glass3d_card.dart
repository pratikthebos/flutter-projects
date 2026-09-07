import 'package:flutter/material.dart';

import '../models/demo_card_model.dart';

class Glass3DCard extends StatefulWidget {
  final DemoCardModel item;
  final int index;

  const Glass3DCard({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  State<Glass3DCard> createState() => _Glass3DCardState();
}

class _Glass3DCardState extends State<Glass3DCard> {
  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          y += details.delta.dx * .003;
          x -= details.delta.dy * .003;

          x = x.clamp(-.12, .12);
          y = y.clamp(-.12, .12);
        });
      },
      onPanEnd: (_) {
        setState(() {
          x = 0;
          y = 0;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
        height: 320,
        margin: const EdgeInsets.only(bottom: 22),
        transform: Matrix4.identity()
          ..setEntry(3, 2, .001)
          ..rotateX(x)
          ..rotateY(y),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: LinearGradient(
            colors: [
              item.primary.withOpacity(.22),
              Colors.white.withOpacity(.03),
              item.secondary.withOpacity(.12),
            ],
          ),
          border: Border.all(
            color: Colors.white.withOpacity(.15),
          ),
          boxShadow: [
            BoxShadow(
              color: item.primary.withOpacity(.20),
              blurRadius: 40,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -40,
              top: -40,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.primary.withOpacity(.08),
                ),
              ),
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
                    size: 42,
                  ),
                  const Spacer(),
                  Text(
                    item.label,
                    style: TextStyle(
                      color: item.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.subtitle,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'DRAG TO ROTATE',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 8,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}