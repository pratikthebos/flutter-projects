import 'dart:ui';
import 'package:flutter/material.dart';

class LiquidGlassDemo extends StatefulWidget {
  const LiquidGlassDemo({super.key});

  @override
  State<LiquidGlassDemo> createState() => _LiquidGlassDemoState();
}

class _LiquidGlassDemoState extends State<LiquidGlassDemo>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: controller,

      builder: (context, child) {

        final glow = 18 + controller.value * 18;

        return Container(

          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),

          height: 300,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(34),

            boxShadow: [

              BoxShadow(
                color: Colors.cyan.withValues(alpha: .18),
                blurRadius: glow,
                spreadRadius: 2,
              ),

            ],

          ),

          child: ClipRRect(

            borderRadius: BorderRadius.circular(34),

            child: BackdropFilter(

              filter: ImageFilter.blur(
                sigmaX: 22,
                sigmaY: 22,
              ),

              child: Container(

                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(34),

                  border: Border.all(
                    color: Colors.white.withValues(alpha: .20),
                  ),

                  gradient: LinearGradient(

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                    colors: [

                      Colors.white.withValues(alpha: .18),

                      Colors.white.withValues(alpha: .05),

                    ],

                  ),

                ),

                child: Stack(

                  children: [

                    //--------------------------------
                    // Moving Reflection
                    //--------------------------------

                    Positioned(

                      left: -160 + controller.value * 420,

                      child: Transform.rotate(

                        angle: -.4,

                        child: Container(

                          width: 90,
                          height: 500,

                          decoration: BoxDecoration(

                            gradient: LinearGradient(

                              colors: [

                                Colors.white.withValues(alpha: .30),

                                Colors.transparent,

                              ],

                            ),

                          ),

                        ),

                      ),

                    ),

                    //--------------------------------
                    // Content
                    //--------------------------------

                    const Center(

                      child: Column(

                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          Icon(
                            Icons.water_drop,
                            color: Colors.white,
                            size: 70,
                          ),

                          SizedBox(height: 18),

                          Text(
                            "Liquid Glass",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            "Dynamic blur • Reflection • Glow",
                            style: TextStyle(
                              color: Colors.white70,
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