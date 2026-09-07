import 'package:flutter/material.dart';

import '../models/demo_card_model.dart';

class DashboardCard extends StatefulWidget {
  final DemoCardModel item;
  final int index;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.item,
    required this.index,
    required this.onTap,
  });

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 170,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              item.primary.withOpacity(.18),
              const Color(0xFF09090E),
              item.secondary.withOpacity(.08),
            ],
          ),
          border: Border.all(
            color: item.primary.withOpacity(.22),
          ),
          boxShadow: [
            BoxShadow(
              color: item.primary.withOpacity(.10),
              blurRadius: 30,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: controller,
                builder: (_, __) {
                  return Positioned(
                    right: -40 + controller.value * 25,
                    top: -40,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: item.primary.withOpacity(.08),
                        boxShadow: [
                          BoxShadow(
                            color:
                            item.primary.withOpacity(.18),
                            blurRadius: 70,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              Positioned(
                right: 22,
                top: 22,
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item.primary.withOpacity(.10),
                    border: Border.all(
                      color: item.primary.withOpacity(.35),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: item.primary.withOpacity(.25),
                        blurRadius: 25,
                      ),
                    ],
                  ),
                  child: Icon(
                    item.icon,
                    color: item.primary,
                    size: 30,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.label,
                      style: TextStyle(
                        color: item.primary,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.7,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -.5,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 230,
                      child: Text(
                        item.subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 11,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                right: 20,
                bottom: 20,
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: item.primary,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}