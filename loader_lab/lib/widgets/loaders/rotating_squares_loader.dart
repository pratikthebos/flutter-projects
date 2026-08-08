import 'dart:math';

import 'package:flutter/material.dart';

class RotatingSquaresLoader extends StatefulWidget {
  const RotatingSquaresLoader({
    super.key,
  });

  @override
  State<RotatingSquaresLoader> createState() =>
      _RotatingSquaresLoaderState();
}

class _RotatingSquaresLoaderState
    extends State<RotatingSquaresLoader>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1200,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,

      builder: (_, __) {
        return Transform.rotate(
          angle: controller.value * pi * 2,

          child: SizedBox(
            width: 70,
            height: 70,

            child: Stack(
              alignment: Alignment.center,

              children: [
                _square(
                  Alignment.topLeft,
                  14,
                  const Color(0xff6C63FF),
                ),

                _square(
                  Alignment.topRight,
                  11,
                  const Color(0xff00C6FF),
                ),

                _square(
                  Alignment.bottomLeft,
                  11,
                  const Color(0xffff4F9A),
                ),

                _square(
                  Alignment.bottomRight,
                  14,
                  const Color(0xffff9100),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _square(
      Alignment alignment,
      double size,
      Color color,
      ) {
    return Align(
      alignment: alignment,

      child: Container(
        width: size,
        height: size,

        decoration: BoxDecoration(
          color: color,
          borderRadius:
          BorderRadius.circular(4),

          boxShadow: [
            BoxShadow(
              color: color.withValues(
                alpha: .35,
              ),
              blurRadius: 10,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}