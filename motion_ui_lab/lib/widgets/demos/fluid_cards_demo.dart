import 'dart:math';

import 'package:flutter/material.dart';

class FluidCardsDemo extends StatefulWidget {
  const FluidCardsDemo({
    super.key,
  });

  @override
  State<FluidCardsDemo> createState() =>
      _FluidCardsDemoState();
}

class _FluidCardsDemoState
    extends State<FluidCardsDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration:
      const Duration(seconds: 3),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              _card(
                260,
                350,
                const Color(0xff6C63FF),
                -0.08 +
                    sin(
                      controller.value *
                          6.28,
                    ) *
                        .03,
              ),

              _card(
                240,
                320,
                const Color(0xff00C6FF),
                0.06 +
                    cos(
                      controller.value *
                          6.28,
                    ) *
                        .03,
              ),

              Container(
                width: 220,
                height: 290,
                decoration:
                BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(
                    30,
                  ),
                  color: Colors.white
                      .withValues(
                    alpha: .92,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withValues(
                        alpha: .08,
                      ),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons
                          .auto_awesome,
                      size: 55,
                      color:
                      Color(
                        0xff6C63FF,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'FLUID',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight:
                        FontWeight.w900,
                      ),
                    ),
                    Text(
                      'INTERACTION',
                      style: TextStyle(
                        color:
                        Color(
                          0xff687386,
                        ),
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _card(
      double width,
      double height,
      Color color,
      double angle,
      ) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: width,
        height: height,
        decoration:
        BoxDecoration(
          borderRadius:
          BorderRadius.circular(35),
          color:
          color.withValues(
            alpha: .12,
          ),
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