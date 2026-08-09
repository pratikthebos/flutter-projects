import 'dart:math';

import 'package:flutter/material.dart';

class SecurityScannerDemo extends StatefulWidget {
  const SecurityScannerDemo({
    super.key,
  });

  @override
  State<SecurityScannerDemo> createState() =>
      _SecurityScannerDemoState();
}

class _SecurityScannerDemoState
    extends State<SecurityScannerDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration:
      const Duration(seconds: 2),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Center(
          child: Container(
            width: 330,
            height: 400,
            padding:
            const EdgeInsets.all(25),
            decoration:
            BoxDecoration(
              borderRadius:
              BorderRadius.circular(
                35,
              ),
              color:
              const Color(
                0xff101827,
              ),
              boxShadow: [
                BoxShadow(
                  color:
                  const Color(
                    0xff00C6FF,
                  ).withValues(
                    alpha: .20,
                  ),
                  blurRadius: 35,
                ),
              ],
            ),
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.shield_rounded,
                      color:
                      Color(
                        0xff00E5A8,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'SECURITY SCAN',
                      style:
                      TextStyle(
                        color:
                        Colors.white,
                        fontWeight:
                        FontWeight.w800,
                        letterSpacing:
                        1.5,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                Transform.rotate(
                  angle:
                  controller.value *
                      pi *
                      2,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration:
                    BoxDecoration(
                      shape:
                      BoxShape.circle,
                      border: Border.all(
                        color:
                        const Color(
                          0xff00E5A8,
                        ).withValues(
                          alpha: .5,
                        ),
                        width: 2,
                      ),
                    ),
                    child:
                    const Center(
                      child: Icon(
                        Icons
                            .security_rounded,
                        size: 65,
                        color:
                        Color(
                          0xff00E5A8,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                const Text(
                  'SCANNING...',
                  style: TextStyle(
                    color:
                    Color(
                      0xff00E5A8,
                    ),
                    fontWeight:
                    FontWeight.bold,
                    letterSpacing:
                    2,
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),

                Text(
                  '${(controller.value * 100).toInt()}% COMPLETE',
                  style:
                  const TextStyle(
                    color:
                    Colors.white54,
                    fontSize: 12,
                  ),
                ),

                const Spacer(),
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