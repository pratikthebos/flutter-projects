import 'dart:math';

import 'package:flutter/material.dart';

class ParallaxProfileDemo extends StatefulWidget {
  const ParallaxProfileDemo({
    super.key,
  });

  @override
  State<ParallaxProfileDemo> createState() =>
      _ParallaxProfileDemoState();
}

class _ParallaxProfileDemoState
    extends State<ParallaxProfileDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration:
      const Duration(seconds: 4),
    )..repeat(
      reverse: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final offset =
            sin(
              controller.value *
                  pi,
            ) *
                12;

        return Center(
          child: Container(
            width: 300,
            height: 390,
            decoration:
            BoxDecoration(
              borderRadius:
              BorderRadius.circular(
                35,
              ),
              gradient:
              const LinearGradient(
                begin:
                Alignment.topCenter,
                end:
                Alignment.bottomCenter,
                colors: [
                  Color(0xffEC4899),
                  Color(0xff6C63FF),
                ],
              ),
            ),
            child: Stack(
              alignment:
              Alignment.center,
              children: [
                Positioned(
                  top:
                  70 + offset,
                  child: Container(
                    width: 125,
                    height: 125,
                    decoration:
                    BoxDecoration(
                      shape:
                      BoxShape.circle,
                      color:
                      Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color:
                          Colors.black
                              .withValues(
                            alpha: .15,
                          ),
                          blurRadius: 25,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 70,
                      color:
                      Color(
                        0xff6C63FF,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 60,
                  child: Column(
                    children: [
                      const Text(
                        'CREATIVE',
                        style:
                        TextStyle(
                          color:
                          Colors.white,
                          fontSize: 26,
                          fontWeight:
                          FontWeight
                              .w900,
                          letterSpacing:
                          2,
                        ),
                      ),

                      const SizedBox(
                        height: 7,
                      ),

                      Text(
                        'Motion Designer',
                        style:
                        TextStyle(
                          color: Colors.white
                              .withValues(
                            alpha: .8,
                          ),
                        ),
                      ),
                    ],
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