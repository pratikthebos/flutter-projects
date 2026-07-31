import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CyberCard extends StatelessWidget {
  final Widget child;

  const CyberCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: AppColors.card.withOpacity(.88),

        borderRadius: BorderRadius.circular(28),

        border: Border.all(
          color: AppColors.cyan.withOpacity(.18),
          width: 1.2,
        ),

        boxShadow: [
          BoxShadow(
            color: AppColors.cyan.withOpacity(.08),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),

      child: child,
    );
  }
}