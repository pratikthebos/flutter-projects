import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
      BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 18,
          sigmaY: 18,
        ),
        child: Container(
          width: double.infinity,
          padding: padding,
          decoration:
          BoxDecoration(
            borderRadius:
            BorderRadius.circular(28),
            color: Colors.white
                .withValues(alpha: .72),
            border: Border.all(
              color: Colors.white
                  .withValues(alpha: .9),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withValues(alpha: .05),
                blurRadius: 30,
                offset:
                const Offset(0, 12),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}