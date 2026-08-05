import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';

class CrystalBlurDemo extends StatefulWidget {
  const CrystalBlurDemo({super.key});

  @override
  State<CrystalBlurDemo> createState() => _CrystalBlurDemoState();
}

class _CrystalBlurDemoState extends State<CrystalBlurDemo>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: controller,

      builder: (context, child) {

        final t = controller.value;

        return Container(

          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),

          height: 320,

          child: Stack(

            children: [

              //-----------------------------------
              // Floating Blur Blob 1
              //-----------------------------------

              Positioned(

                left: 20 + sin(t * pi * 2) * 25,

                top: 30,

                child: _blurBlob(
                  120,
                  const Color(0xff5EEBFF),
                ),

              ),

              //-----------------------------------
              // Floating Blur Blob 2
              //-----------------------------------

              Positioned(

                right: 25,

                bottom: 25 + cos(t * pi * 2) * 20,

                child: _blurBlob(
                  140,
                  const Color(0xff6A5CFF),
                ),

              ),

              //-----------------------------------
              // Main Crystal Glass
              //-----------------------------------

              ClipRRect(

                borderRadius: BorderRadius.circular(36),

                child: BackdropFilter(

                  filter: ImageFilter.blur(
                    sigmaX: 28,
                    sigmaY: 28,
                  ),

                  child: Container(

                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(36),

                      border: Border.all(
                        color: Colors.white.withValues(alpha: .22),
                      ),

                      gradient: LinearGradient(

                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,

                        colors: [

                          Colors.white.withValues(alpha: .22),

                          Colors.white.withValues(alpha: .06),

                        ],

                      ),

                    ),

                    child: Stack(

                      children: [

                        //-----------------------------------
                        // Moving Reflection
                        //-----------------------------------

                        Positioned(

                          left: -170 + t * 520,

                          child: Transform.rotate(

                            angle: -.45,

                            child: Container(

                              width: 90,

                              height: 500,

                              decoration: BoxDecoration(

                                gradient: LinearGradient(

                                  colors: [

                                    Colors.white.withValues(alpha: .35),

                                    Colors.transparent,

                                  ],

                                ),

                              ),

                            ),

                          ),

                        ),

                        //-----------------------------------
                        // Content
                        //-----------------------------------

                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withValues(alpha: 0.08),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.25),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.blur_on,
                                  size: 46,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 24),

                              const Text(
                                "Crystal Blur",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              const Text(
                                "Dynamic Frosted Glass\nPremium Blur Engine",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  height: 1.5,
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

  Widget _blurBlob(double size, Color color) {

    return ImageFiltered(

      imageFilter: ImageFilter.blur(
        sigmaX: 40,
        sigmaY: 40,
      ),

      child: Container(

        width: size,

        height: size,

        decoration: BoxDecoration(

          shape: BoxShape.circle,

          color: color.withValues(alpha: .25),

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