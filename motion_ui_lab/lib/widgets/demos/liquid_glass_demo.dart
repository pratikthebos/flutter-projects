import 'dart:ui';

import 'package:flutter/material.dart';

class LiquidGlassDemo extends StatefulWidget {
  const LiquidGlassDemo({
    super.key,
  });

  @override
  State<LiquidGlassDemo> createState() =>
      _LiquidGlassDemoState();
}

class _LiquidGlassDemoState
    extends State<LiquidGlassDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration:
      const Duration(seconds: 4),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Center(
          child: ClipRRect(
            borderRadius:
            BorderRadius.circular(35),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20,
              ),
              child: Container(
                width: 310,
                height: 420,
                padding:
                const EdgeInsets.all(25),
                decoration:
                BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(
                    35,
                  ),
                  color: Colors.white
                      .withValues(
                    alpha: .55,
                  ),
                  border: Border.all(
                    color: Colors.white
                        .withValues(
                      alpha: .9,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle:
                      controller.value *
                          6.28,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration:
                        const BoxDecoration(
                          shape:
                          BoxShape.circle,
                          gradient:
                          LinearGradient(
                            colors: [
                              Color(
                                0xff6C63FF,
                              ),
                              Color(
                                0xff00C6FF,
                              ),
                              Color(
                                0xffEC4899,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 35,
                    ),

                    const Text(
                      'LIQUID GLASS',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight:
                        FontWeight.w900,
                        letterSpacing: 2,
                        color:
                        Color(
                          0xff172033,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    const Text(
                      'Blur • Glass • Motion',
                      style: TextStyle(
                        color:
                        Color(
                          0xff687386,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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