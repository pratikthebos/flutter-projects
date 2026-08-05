import 'dart:async';

import 'package:flutter/material.dart';

import '../../app/routes.dart';

import '../../core/widgets/glass_background.dart';
import '../../core/widgets/floating_bubbles.dart';
import '../../core/widgets/reflection_effect.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {

    super.initState();

    controller = AnimationController(

      vsync: this,

      duration: const Duration(milliseconds: 2000),

    )..repeat(reverse: true);

    Timer(
      const Duration(milliseconds: 3300),
          () {

        Navigator.pushReplacementNamed(
          context,
          Routes.home,
        );

      },
    );

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(

        children: [

          const GlassBackground(),

          const FloatingBubbles(),

          Center(

            child: AnimatedBuilder(

              animation: controller,

              builder: (_, __) {

                return Transform.scale(

                  scale: .9 + controller.value * .15,

                  child: Stack(

                    alignment: Alignment.center,

                    children: [

                      Container(

                        width: 220,

                        height: 220,

                        decoration: BoxDecoration(

                          shape: BoxShape.circle,

                          gradient: RadialGradient(

                            colors: [

                              Colors.white.withOpacity(.15),

                              Colors.white.withOpacity(.03),

                            ],

                          ),

                        ),

                      ),

                      const Icon(

                        Icons.auto_awesome,

                        color: Colors.white,

                        size: 90,

                      ),

                      const ReflectionEffect(),

                    ],

                  ),

                );

              },

            ),

          ),

          const Positioned(

            bottom: 80,

            left: 0,

            right: 0,

            child: Column(

              children: [

                Text(

                  "LIQUID GLASS",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 34,

                    fontWeight: FontWeight.bold,

                    letterSpacing: 3,

                  ),

                ),

                SizedBox(height: 10),

                Text(

                  "Premium Flutter UI",

                  style: TextStyle(

                    color: Colors.white70,

                    fontSize: 16,

                  ),

                ),

              ],

            ),

          ),

        ],

      ),

    );

  }

  @override
  void dispose() {

    controller.dispose();

    super.dispose();

  }

}