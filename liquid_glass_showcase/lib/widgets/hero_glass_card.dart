import 'dart:ui';

import 'package:flutter/material.dart';

class HeroGlassCard extends StatefulWidget {
  const HeroGlassCard({super.key});

  @override
  State<HeroGlassCard> createState() => _HeroGlassCardState();
}

class _HeroGlassCardState extends State<HeroGlassCard>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: controller,

      builder: (context, child) {

        final offset = controller.value * 14;

        return Transform.translate(

          offset: Offset(0, offset),

          child: Container(

            width: 340,
            height: 220,

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(35),

              gradient: LinearGradient(

                begin: Alignment.topLeft,
                end: Alignment.bottomRight,

                colors: [

                  Colors.white.withValues(alpha: 0.22),
                  Colors.white.withValues(alpha: 0.05),

                ],

              ),

              border: Border.all(
                color: Colors.white.withValues(alpha: 0.25),
                width: 1.5,
              ),

              boxShadow: [

                BoxShadow(
                  color: Colors.cyan.withValues(alpha: 0.15),
                  blurRadius: 40,
                  spreadRadius: 5,
                ),

              ],

            ),

            child: ClipRRect(

              borderRadius: BorderRadius.circular(35),

              child: BackdropFilter(

                filter: ImageFilter.blur(
                  sigmaX: 25,
                  sigmaY: 25,
                ),

                child: Stack(

                  children: [

                    //---------------------------------
                    // Reflection
                    //---------------------------------

                    Positioned(

                      top: -60,
                      left: -20,

                      child: Transform.rotate(

                        angle: -.35,

                        child: Container(

                          width: 180,
                          height: 300,

                          decoration: BoxDecoration(

                            gradient: LinearGradient(

                              colors: [

                                Colors.white.withValues(alpha: .30),

                                Colors.white.withValues(alpha: .02),

                              ],

                            ),

                          ),

                        ),

                      ),

                    ),

                    //---------------------------------
                    // Content
                    //---------------------------------

                    Padding(

                      padding: const EdgeInsets.all(25),

                      child: Column(

                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          Row(

                            children: [

                              Container(

                                width: 54,
                                height: 54,

                                decoration: BoxDecoration(

                                  shape: BoxShape.circle,

                                  gradient: LinearGradient(

                                    colors: [

                                      Colors.blue,
                                      Colors.cyan,

                                    ],

                                  ),

                                ),

                                child: const Icon(
                                  Icons.auto_awesome,
                                  color: Colors.white,
                                ),

                              ),

                              const Spacer(),

                              const Icon(
                                Icons.blur_on,
                                color: Colors.white70,
                              ),

                            ],

                          ),

                          const Spacer(),

                          const Text(

                            "Liquid Glass UI",

                            style: TextStyle(

                              color: Colors.white,

                              fontSize: 28,

                              fontWeight: FontWeight.bold,

                            ),

                          ),

                          const SizedBox(height: 8),

                          const Text(

                            "Apple VisionOS Inspired\nPremium Flutter Animations",

                            style: TextStyle(

                              color: Colors.white70,

                              fontSize: 15,

                              height: 1.4,

                            ),

                          ),

                        ],

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