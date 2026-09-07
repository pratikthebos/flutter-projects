import 'package:flutter/material.dart';

import 'glow_orb.dart';

class AnimatedBackground extends StatelessWidget {
  final Color primary;
  final Color secondary;

  const AnimatedBackground({
    super.key,
    required this.primary,
    required this.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -80,
          right: -80,
          child: GlowOrb(
            color: primary,
            size: 240,
          ),
        ),
        Positioned(
          bottom: 100,
          left: -100,
          child: GlowOrb(
            color: secondary,
            size: 220,
          ),
        ),
      ],
    );
  }
}