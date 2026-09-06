import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/content_card_model.dart';

class TechCard extends StatefulWidget {
  final ContentCardModel item;

  const TechCard({
    super.key,
    required this.item,
  });

  @override
  State<TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<TechCard>
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

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: item.accent.withOpacity(.18),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              width: 120,
              height: 130,
              child: Image.network(
                item.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      item.icon,
                      color: item.accent,
                      size: 16,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      item.category,
                      style: TextStyle(
                        color: item.accent,
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  item.subtitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 11,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) {
                    return LinearProgressIndicator(
                      value: .65 + controller.value * .25,
                      minHeight: 3,
                      backgroundColor:
                      Colors.white.withOpacity(.06),
                      valueColor:
                      AlwaysStoppedAnimation<Color>(
                        item.accent,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}