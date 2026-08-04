import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class NeonBorder extends StatelessWidget {
  final Widget child;

  const NeonBorder({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(.25),
            blurRadius: 22,
          ),
        ],
      ),
      child: child,
    );
  }
}