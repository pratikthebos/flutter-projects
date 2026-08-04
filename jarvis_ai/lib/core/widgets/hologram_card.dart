import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'glass_card.dart';

class HologramCard extends StatelessWidget {
  final Widget child;

  const HologramCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary.withOpacity(.4),
          ),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(.18),
              blurRadius: 25,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: child,
        ),
      ),
    );
  }
}