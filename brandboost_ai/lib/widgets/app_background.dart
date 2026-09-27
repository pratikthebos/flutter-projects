import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.background, AppColors.background2, AppColors.background],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -100,
            right: -90,
            child: _Glow(color: AppColors.purple.withValues(alpha: .16), size: 260),
          ),
          Positioned(
            top: 330,
            left: -140,
            child: _Glow(color: AppColors.cyan.withValues(alpha: .08), size: 260),
          ),
          child,
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  final Color color;
  final double size;
  const _Glow({required this.color, required this.size});

  @override
  Widget build(BuildContext context) => IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: color, blurRadius: 100, spreadRadius: 25)],
          ),
        ),
      );
}
