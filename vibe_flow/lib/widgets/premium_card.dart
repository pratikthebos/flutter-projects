import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/widgets/neon_border.dart';
import '../models/content_card_model.dart';

class PremiumCard extends StatefulWidget {
  final ContentCardModel item;

  const PremiumCard({
    super.key,
    required this.item,
  });

  @override
  State<PremiumCard> createState() => _PremiumCardState();
}

class _PremiumCardState extends State<PremiumCard> {
  double rotateX = 0;
  double rotateY = 0;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          rotateY += details.delta.dx * 0.002;
          rotateX -= details.delta.dy * 0.002;

          rotateX = rotateX.clamp(-0.08, 0.08);
          rotateY = rotateY.clamp(-0.08, 0.08);
        });
      },
      onPanEnd: (_) {
        setState(() {
          rotateX = 0;
          rotateY = 0;
        });
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutBack,
        builder: (_, value, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(rotateX * value)
              ..rotateY(rotateY * value),
            child: child,
          );
        },
        child: NeonBorder(
          color: item.accent,
          radius: 28,
          child: Container(
            height: 260,
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(28),
                    ),
                    child: Image.network(
                      item.image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          color: item.accent.withOpacity(.15),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item.icon,
                          color: item.accent,
                          size: 28,
                        ),
                        const SizedBox(height: 18),
                        Text(
                          item.category,
                          style: TextStyle(
                            color: item.accent,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.4,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.title,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.subtitle,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 12,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}