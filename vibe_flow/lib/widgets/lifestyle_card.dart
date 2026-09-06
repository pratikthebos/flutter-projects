import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/content_card_model.dart';

class LifestyleCard extends StatefulWidget {
  final ContentCardModel item;

  const LifestyleCard({
    super.key,
    required this.item,
  });

  @override
  State<LifestyleCard> createState() =>
      _LifestyleCardState();
}

class _LifestyleCardState extends State<LifestyleCard>
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
    final item = widget.item;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(
            0,
            controller.value * 6 - 3,
          ),
          child: child,
        );
      },
      child: Container(
        height: 310,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: item.accent.withOpacity(.10),
              blurRadius: 30,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                item.image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black87,
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          item.icon,
                          color: item.accent,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item.category,
                          style: TextStyle(
                            color: item.accent,
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                            letterSpacing: 1.3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.subtitle,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 12,
                      ),
                    ),
                  ],
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