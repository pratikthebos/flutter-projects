import 'dart:ui';

import 'package:flutter/material.dart';

class GlassChip extends StatelessWidget {
  final String text;

  const GlassChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),

      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),

        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 12,
          ),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),

            color: Colors.white.withOpacity(.08),

            border: Border.all(
              color: Colors.white24,
            ),
          ),

          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}