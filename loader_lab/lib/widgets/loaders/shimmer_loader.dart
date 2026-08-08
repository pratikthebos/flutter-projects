import 'package:flutter/material.dart';

class ShimmerLoader extends StatefulWidget {
  const ShimmerLoader({
    super.key,
  });

  @override
  State<ShimmerLoader> createState() =>
      _ShimmerLoaderState();
}

class _ShimmerLoaderState
    extends State<ShimmerLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1400,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,

      builder: (context, child) {
        final position = controller.value;

        return Container(
          width: 200,
          height: 32,

          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(18),

            gradient: LinearGradient(
              begin: Alignment(
                -2.0 + position * 4,
                0,
              ),

              end: Alignment(
                -0.5 + position * 4,
                0,
              ),

              colors: const [
                Color(0xffE8E7F8),
                Color(0xffC9C5FF),
                Color(0xff7C6CFF),
                Color(0xff00C6FF),
                Color(0xffC9C5FF),
                Color(0xffE8E7F8),
              ],

              stops: const [
                0.0,
                0.25,
                0.40,
                0.50,
                0.65,
                1.0,
              ],
            ),

            boxShadow: [
              BoxShadow(
                color: const Color(
                  0xff6C63FF,
                ).withValues(
                  alpha: .15,
                ),

                blurRadius: 18,

                spreadRadius: 1,
              ),
            ],
          ),

          child: ClipRRect(
            borderRadius:
            BorderRadius.circular(18),

            child: Stack(
              children: [
                // Moving highlight
                Positioned(
                  left:
                  -60 +
                      position * 320,

                  top: 0,
                  bottom: 0,

                  child: Container(
                    width: 55,

                    decoration: BoxDecoration(
                      gradient:
                      LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.white
                              .withValues(
                            alpha: .75,
                          ),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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