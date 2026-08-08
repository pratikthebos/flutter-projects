import 'dart:math';

import 'package:flutter/material.dart';

class BouncingBallLoader extends StatefulWidget {
  const BouncingBallLoader({
    super.key,
  });

  @override
  State<BouncingBallLoader> createState() =>
      _BouncingBallLoaderState();
}

class _BouncingBallLoaderState
    extends State<BouncingBallLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,

      builder: (context, child) {
        final value = controller.value;

        // Smooth bounce curve
        final bounce =
            sin(value * pi) * 55;

        // Ball gets slightly wider when touching
        // the ground and slightly narrower in the air.
        final squash =
            1.0 +
                (1 - bounce / 55) * 0.12;

        // Shadow becomes smaller when ball is high.
        final shadowScale =
            1.0 - (bounce / 55) * 0.45;

        return SizedBox(
          width: 160,
          height: 105,

          child: Stack(
            alignment: Alignment.bottomCenter,

            children: [

              //================================================
              // GLOWING FLOOR
              //================================================

              Positioned(
                bottom: 12,

                child: Transform.scale(
                  scaleX: shadowScale,

                  child: Container(
                    width: 90,
                    height: 8,

                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(50),

                      color: const Color(
                        0xff6C63FF,
                      ).withValues(
                        alpha: .16,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xff6C63FF,
                          ).withValues(
                            alpha: .28,
                          ),

                          blurRadius: 18,

                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //================================================
              // BALL
              //================================================

              Positioned(
                bottom: 18 + bounce,

                child: Transform.scale(
                  scaleX: squash,
                  scaleY: 1 / squash,

                  child: Container(
                    width: 30,
                    height: 30,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      gradient:
                      const LinearGradient(
                        begin:
                        Alignment.topLeft,

                        end:
                        Alignment.bottomRight,

                        colors: [
                          Color(0xffA855F7),
                          Color(0xff6366F1),
                          Color(0xff06B6D4),
                        ],
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xff7C3AED,
                          ).withValues(
                            alpha: .45,
                          ),

                          blurRadius: 20,

                          spreadRadius: 3,
                        ),

                        BoxShadow(
                          color: const Color(
                            0xff06B6D4,
                          ).withValues(
                            alpha: .25,
                          ),

                          blurRadius: 30,

                          spreadRadius: 2,
                        ),
                      ],
                    ),

                    child: Container(
                      margin:
                      const EdgeInsets.all(5),

                      decoration:
                      BoxDecoration(
                        shape:
                        BoxShape.circle,

                        gradient:
                        LinearGradient(
                          begin:
                          Alignment.topLeft,

                          end: Alignment.bottomRight,

                          colors: [
                            Colors.white
                                .withValues(
                              alpha: .65,
                            ),

                            Colors.white
                                .withValues(
                              alpha: .05,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //================================================
              // SMALL LIGHT UNDER BALL
              //================================================

              Positioned(
                bottom: 20,

                child: Container(
                  width: 5,
                  height: 5,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    color: const Color(
                      0xff22D3EE,
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: const Color(
                          0xff22D3EE,
                        ).withValues(
                          alpha: .7,
                        ),

                        blurRadius: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ],
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