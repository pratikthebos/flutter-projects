import 'dart:math';
import 'package:flutter/material.dart';

class ParticleEffect extends StatelessWidget {
  const ParticleEffect({super.key});

  @override
  Widget build(BuildContext context) {

    return IgnorePointer(

      child: Stack(

        children: List.generate(

          40,

              (index) {

            final random = Random(index);

            return Positioned(

              left: random.nextDouble() * 400,

              top: random.nextDouble() * 900,

              child: Container(

                width: 2 + random.nextDouble() * 3,

                height: 2 + random.nextDouble() * 3,

                decoration: BoxDecoration(

                  color: Colors.cyanAccent.withOpacity(.6),

                  shape: BoxShape.circle,

                ),

              ),

            );

          },

        ),

      ),

    );

  }
}