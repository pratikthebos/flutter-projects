import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget bubble(
      double size,
      Color color,
      Alignment begin,
      Alignment end,
      ) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Align(
          alignment: Alignment.lerp(
            begin,
            end,
            Curves.easeInOut.transform(controller.value),
          )!,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  color.withOpacity(.55),
                  color.withOpacity(.18),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        //---------------------------------------
        // Main Gradient
        //---------------------------------------

        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff0F172A),
                Color(0xff1E1B4B),
                Color(0xff312E81),
                Color(0xff6D28D9),
              ],
            ),
          ),
        ),

        //---------------------------------------
        // Animated Blobs
        //---------------------------------------

        bubble(
          320,
          Colors.blue,
          const Alignment(-1.2, -1),
          const Alignment(-0.2, -.4),
        ),

        bubble(
          260,
          Colors.purple,
          const Alignment(1.3, -.8),
          const Alignment(.4, -.2),
        ),

        bubble(
          260,
          Colors.cyan,
          const Alignment(-1.1, .8),
          const Alignment(-.2, .4),
        ),

        bubble(
          300,
          Colors.pink,
          const Alignment(1.2, 1),
          const Alignment(.5, .3),
        ),

        bubble(
          180,
          Colors.orange,
          const Alignment(.7, -.4),
          const Alignment(.2, -.8),
        ),

        //---------------------------------------
        // Extra Glow
        //---------------------------------------

        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 1.2,
                colors: [
                  Colors.white.withOpacity(.06),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}