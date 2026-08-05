import 'package:flutter/material.dart';

class LiquidVerticalList extends StatelessWidget {
  const LiquidVerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        return TweenAnimationBuilder<double>(
          duration: Duration(
            milliseconds: 300 + index * 80,
          ),
          tween: Tween<double>(
            begin: 0.7,
            end: 1.0,
          ),
          builder: (context, double scale, child) {
            return Transform.scale(
              scale: scale,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withValues(alpha: 0.10),
                      Colors.white.withValues(alpha: 0.04),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}