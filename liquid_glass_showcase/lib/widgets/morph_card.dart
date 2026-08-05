import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class MorphingGlassCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const MorphingGlassCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  State<MorphingGlassCard> createState() => _MorphingGlassCardState();
}

class _MorphingGlassCardState extends State<MorphingGlassCard>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: controller,

      builder: (context, child) {

        final wave = sin(controller.value * pi * 2) * 8;

        return Transform.translate(

          offset: Offset(0, wave),

          child: Stack(

            children: [

              //-----------------------------------------
              // Shadow
              //-----------------------------------------

              Positioned.fill(

                child: Container(

                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(36),

                    boxShadow: [

                      BoxShadow(

                        color: Colors.cyan.withValues(alpha: .18),

                        blurRadius: 40,

                        spreadRadius: 5,

                      ),

                    ],

                  ),

                ),

              ),

              //-----------------------------------------
              // Glass Card
              //-----------------------------------------

              ClipRRect(

                borderRadius: BorderRadius.circular(36),

                child: BackdropFilter(

                  filter: ImageFilter.blur(
                    sigmaX: 25,
                    sigmaY: 25,
                  ),

                  child: Container(

                    width: 330,
                    height: 420,

                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(36),

                      border: Border.all(
                        color: Colors.white.withValues(alpha: .20),
                        width: 1.5,
                      ),

                      gradient: LinearGradient(

                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,

                        colors: [

                          Colors.white.withValues(alpha: .20),

                          Colors.white.withValues(alpha: .04),

                        ],

                      ),

                    ),

                    child: Stack(

                      children: [

                        //----------------------------------
                        // Moving Reflection
                        //----------------------------------

                        Positioned(

                          left: -160 + controller.value * 500,

                          child: Transform.rotate(

                            angle: -.35,

                            child: Container(

                              width: 110,

                              height: 520,

                              decoration: BoxDecoration(

                                gradient: LinearGradient(

                                  colors: [

                                    Colors.white.withValues(alpha: .35),

                                    Colors.white.withValues(alpha: 0),

                                  ],

                                ),

                              ),

                            ),

                          ),

                        ),

                        //----------------------------------
                        // Glass Content
                        //----------------------------------

                        Padding(

                          padding: const EdgeInsets.all(28),

                          child: Column(

                            mainAxisAlignment:
                            MainAxisAlignment.center,

                            children: [

                              Icon(

                                widget.icon,

                                size: 82,

                                color: Colors.white,

                              ),

                              const SizedBox(height: 28),

                              Text(

                                widget.title,

                                style: const TextStyle(

                                  color: Colors.white,

                                  fontSize: 30,

                                  fontWeight: FontWeight.bold,

                                ),

                              ),

                              const SizedBox(height: 12),

                              Text(

                                widget.subtitle,

                                textAlign: TextAlign.center,

                                style: const TextStyle(

                                  color: Colors.white70,

                                  fontSize: 16,

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