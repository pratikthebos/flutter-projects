import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Color color;
  final Border? border;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 14,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = const BorderRadius.all(
      Radius.circular(20),
    ),
    this.color = const Color(0x33181822),
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
        ),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
            border: border ??
                Border.all(
                  color: Colors.white.withOpacity(0.08),
                ),
          ),
          child: child,
        ),
      ),
    );
  }
}