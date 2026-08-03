import 'package:flutter/material.dart';

class ParticleEffect extends StatelessWidget {
  const ParticleEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: List.generate(
          35,
              (index) {
            return Positioned(
              left: (index * 27) % 380,
              top: (index * 43) % 750,
              child: Container(
                width: 3,
                height: 3,
                decoration: const BoxDecoration(
                  color: Colors.cyanAccent,
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