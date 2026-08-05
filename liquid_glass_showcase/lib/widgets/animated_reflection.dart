import 'package:flutter/material.dart';

class AnimatedReflection extends StatefulWidget {
  final Widget child;

  const AnimatedReflection({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedReflection> createState() =>
      _AnimatedReflectionState();
}

class _AnimatedReflectionState
    extends State<AnimatedReflection>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: controller,

      builder: (_, __) {

        return Stack(

          children: [

            widget.child,

            Positioned.fill(

              child: IgnorePointer(

                child: Transform.translate(

                  offset: Offset(
                    controller.value * 500 - 250,
                    0,
                  ),

                  child: Transform.rotate(

                    angle: -.5,

                    child: Container(

                      width: 80,

                      decoration: BoxDecoration(

                        gradient: LinearGradient(

                          colors: [

                            Colors.transparent,

                            Colors.white.withOpacity(.30),

                            Colors.transparent,

                          ],

                        ),

                      ),

                    ),

                  ),

                ),

              ),

            ),

          ],

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