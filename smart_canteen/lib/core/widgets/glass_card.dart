import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {

  final Widget child;

  const GlassCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(

      borderRadius: BorderRadius.circular(25),

      child: BackdropFilter(

        filter: ImageFilter.blur(
          sigmaX: 8,
          sigmaY: 8,
        ),

        child: Container(

          padding: const EdgeInsets.all(18),

          decoration: BoxDecoration(

            color: Colors.white.withOpacity(.85),

            borderRadius: BorderRadius.circular(25),

            border: Border.all(
              color: Colors.white,
            ),

          ),

          child: child,

        ),

      ),

    );

  }

}