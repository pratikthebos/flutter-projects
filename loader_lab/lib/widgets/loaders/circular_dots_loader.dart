import 'dart:math';

import 'package:flutter/material.dart';

class CircularDotsLoader extends StatefulWidget {
  const CircularDotsLoader({
    super.key,
  });

  @override
  State<CircularDotsLoader> createState() =>
      _CircularDotsLoaderState();
}

class _CircularDotsLoaderState
    extends State<CircularDotsLoader>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,

      builder: (_, __) {
        return SizedBox(
          width: 90,
          height: 90,

          child: Stack(
            alignment: Alignment.center,

            children: List.generate(
              8,
                  (index) {
                final angle =
                    (index / 8) * pi * 2;

                final rotation =
                    controller.value *
                        pi *
                        2;

                final radius = 32.0;

                final x =
                    cos(angle + rotation) *
                        radius;

                final y =
                    sin(angle + rotation) *
                        radius;

                final opacity =
                    .25 +
                        (.75 *
                            ((index +
                                controller.value *
                                    8)
                                .round() %
                                8 ==
                                0
                                ? 1
                                : 0));

                return Transform.translate(
                  offset: Offset(x, y),

                  child: Container(
                    width: 10,
                    height: 10,

                    decoration:
                    BoxDecoration(
                      shape:
                      BoxShape.circle,

                      color:
                      const Color(
                        0xff6C63FF,
                      ).withValues(
                        alpha: opacity,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}