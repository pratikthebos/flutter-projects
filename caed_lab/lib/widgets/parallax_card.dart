import 'package:flutter/material.dart';

import '../models/demo_card_model.dart';

class ParallaxCard extends StatelessWidget {
  final DemoCardModel item;
  final int index;

  const ParallaxCard({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.only(bottom: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned.fill(
                child: Transform.rotate(
                  angle: index.isEven ? -.025 : .025,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(32),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          item.primary.withOpacity(.20),
                          Colors.black,
                          item.secondary.withOpacity(.12),
                        ],
                      ),
                      border: Border.all(
                        color:
                        item.primary.withOpacity(.20),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: constraints.maxWidth * .86,
                  height: 240,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(28),
                    color: const Color(0xFF0C0C12),
                    border: Border.all(
                      color:
                      item.primary.withOpacity(.30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                        item.primary.withOpacity(.15),
                        blurRadius: 35,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Icon(
                        item.icon,
                        color: item.primary,
                        size: 36,
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
                          fontSize: 26,
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
              ),
            ],
          );
        },
      ),
    );
  }
}