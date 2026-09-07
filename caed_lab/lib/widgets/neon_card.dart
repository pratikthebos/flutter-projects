import 'package:flutter/material.dart';

import '../models/demo_card_model.dart';

class NeonCard extends StatefulWidget {
  final DemoCardModel item;

  const NeonCard({
    super.key,
    required this.item,
  });

  @override
  State<NeonCard> createState() => _NeonCardState();
}

class _NeonCardState extends State<NeonCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final glow = 10 + controller.value * 20;

        return Container(
          height: 280,
          margin: const EdgeInsets.only(bottom: 22),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [
                item.primary,
                item.secondary,
                item.primary,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: item.primary.withOpacity(.45),
                blurRadius: glow,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF030305),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: item.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: item.primary,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'SYSTEM ACTIVE',
                      style: TextStyle(
                        color: item.primary,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  item.icon,
                  color: item.primary,
                  size: 38,
                ),
                const SizedBox(height: 16),
                Text(
                  item.label,
                  style: TextStyle(
                    color: item.primary,
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  item.subtitle,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
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