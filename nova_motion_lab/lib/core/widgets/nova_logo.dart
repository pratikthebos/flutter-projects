import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class NovaLogo extends StatelessWidget {
  const NovaLogo({
    super.key,
    this.size = 48,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(size * .3),
        gradient: const LinearGradient(
          colors: [
            AppColors.purple,
            AppColors.pink,
            AppColors.cyan,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color:
            AppColors.purple.withValues(
              alpha: .35,
            ),
            blurRadius: 25,
          ),
        ],
      ),
      child: const Icon(
        Icons.auto_awesome_rounded,
        color: Colors.white,
      ),
    );
  }
}