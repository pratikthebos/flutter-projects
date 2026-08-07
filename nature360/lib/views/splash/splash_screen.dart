import 'dart:async';

import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/animated_background.dart';
import '../../core/widgets/custom_loader.dart';

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

      duration: const Duration(seconds: 2),

    )..repeat(reverse: true);

    Timer(

      const Duration(seconds: 3),

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

          //------------------------------------------------
          // Animated Background
          //------------------------------------------------

          const AnimatedBackground(),

          //------------------------------------------------
          // Floating Bubbles
          //------------------------------------------------

          const Positioned(

            top: 100,

            left: 40,

            child: CircleAvatar(

              radius: 35,

              backgroundColor:
              Color(0x22FFFFFF),

            ),

          ),

          const Positioned(

            bottom: 220,

            right: 35,

            child: CircleAvatar(

              radius: 25,

              backgroundColor:
              Color(0x33FFFFFF),

            ),

          ),

          //------------------------------------------------
          // Main Content
          //------------------------------------------------

          Center(

            child: AnimatedBuilder(

              animation: controller,

              builder: (_, __) {

                return Transform.scale(

                  scale: .9 + controller.value * .1,

                  child: Column(

                    mainAxisSize:
                    MainAxisSize.min,

                    children: [

                      //--------------------------------

                      Container(

                        width: 150,

                        height: 150,

                        decoration: BoxDecoration(

                          shape: BoxShape.circle,

                          gradient:
                          const RadialGradient(

                            colors: [

                              Color(0xff6ED8FF),

                              Color(0xff37B6FF),

                            ],

                          ),

                          boxShadow: [

                            BoxShadow(

                              color: Colors.blue
                                  .withOpacity(.35),

                              blurRadius: 40,

                              spreadRadius: 10,

                            )

                          ],

                        ),

                        child: const Icon(

                          Icons.travel_explore,

                          size: 70,

                          color: Colors.white,

                        ),

                      ),

                      const SizedBox(height: 40),

                      //--------------------------------

                      const Text(

                        AppStrings.appName,

                        style: TextStyle(

                          fontSize: 38,

                          fontWeight:
                          FontWeight.bold,

                          color: Color(0xff263238),

                          letterSpacing: 1,

                        ),

                      ),

                      const SizedBox(height: 10),

                      const Text(

                        AppStrings.tagline,

                        style: TextStyle(

                          fontSize: 16,

                          color: Colors.black54,

                        ),

                      ),

                      const SizedBox(height: 50),

                      const CustomLoader(),

                    ],

                  ),

                );

              },

            ),

          ),

          //------------------------------------------------
          // Bottom Text
          //------------------------------------------------

          const Positioned(

            bottom: 40,

            left: 0,

            right: 0,

            child: Center(

              child: Text(

                "Explore Beautiful Places in 360°",

                style: TextStyle(

                  color: Colors.black54,

                  fontSize: 14,

                ),

              ),

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