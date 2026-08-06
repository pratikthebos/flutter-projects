import 'dart:math';

import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../core/widgets/glass_button.dart';
import '../../core/widgets/glass_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: AnimatedBuilder(

        animation: controller,

        builder: (_, __) {

          return Stack(

            children: [

              //--------------------------------------------------
              // Premium Background
              //--------------------------------------------------

              Container(

                decoration: const BoxDecoration(

                  gradient: LinearGradient(

                    begin: Alignment.topLeft,

                    end: Alignment.bottomRight,

                    colors: [

                      Color(0xff020617),

                      Color(0xff071A2D),

                      Color(0xff0B2C47),

                      Colors.black,

                    ],

                  ),

                ),

              ),

              //--------------------------------------------------
              // Animated Glow
              //--------------------------------------------------

              Positioned(

                left: -120 +

                    sin(controller.value * pi * 2) * 40,

                top: -100,

                child: _glow(

                  320,

                  Colors.cyanAccent,

                ),

              ),

              Positioned(

                right: -120,

                bottom: -120 +

                    cos(controller.value * pi * 2) * 40,

                child: _glow(

                  300,

                  Colors.blueAccent,

                ),

              ),

              //--------------------------------------------------
              // Content
              //--------------------------------------------------

              SafeArea(

                child: SingleChildScrollView(

                  physics: const BouncingScrollPhysics(),

                  padding: const EdgeInsets.all(22),

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      const SizedBox(height: 20),

                      const Text(

                        "Interior360",

                        style: TextStyle(

                          color: Colors.white,

                          fontSize: 38,

                          fontWeight: FontWeight.bold,

                          letterSpacing: 1.5,

                        ),

                      ),

                      const SizedBox(height: 10),

                      const Text(

                        "Design Your Dream Room in 360°",

                        style: TextStyle(

                          color: Colors.white70,

                          fontSize: 17,

                        ),

                      ),

                      const SizedBox(height: 30),

                      //--------------------------------------------------
                      // Hero Card
                      //--------------------------------------------------

                      GlassCard(

                        height: 320,

                        child: Column(

                          mainAxisAlignment:
                          MainAxisAlignment.center,

                          children: [

                            Container(

                              width: 120,

                              height: 120,

                              decoration: BoxDecoration(

                                shape: BoxShape.circle,

                                gradient: LinearGradient(

                                  colors: [

                                    Colors.cyanAccent
                                        .withOpacity(.30),

                                    Colors.blue
                                        .withOpacity(.10),

                                  ],

                                ),

                                boxShadow: [

                                  BoxShadow(

                                    color: Colors.cyanAccent
                                        .withOpacity(.35),

                                    blurRadius: 35,

                                  ),

                                ],

                              ),

                              child: const Icon(

                                Icons.home_work_rounded,

                                color: Colors.white,

                                size: 60,

                              ),

                            ),

                            const SizedBox(height: 25),

                            const Text(

                              "360° Interior Designer",

                              style: TextStyle(

                                color: Colors.white,

                                fontSize: 28,

                                fontWeight: FontWeight.bold,

                              ),

                            ),

                            const SizedBox(height: 10),

                            const Padding(

                              padding:
                              EdgeInsets.symmetric(horizontal: 20),

                              child: Text(

                                "Place, move, rotate and resize furniture inside immersive panoramic rooms.",

                                textAlign: TextAlign.center,

                                style: TextStyle(

                                  color: Colors.white70,

                                  fontSize: 15,

                                ),

                              ),

                            ),

                          ],

                        ),

                      ),

                      const SizedBox(height: 30),

                      //--------------------------------------------------
                      // Features
                      //--------------------------------------------------

                      Row(

                        children: [

                          Expanded(

                            child: _featureCard(

                              Icons.panorama,

                              "360°",

                              "Panorama",

                              Colors.cyan,

                            ),

                          ),

                          const SizedBox(width: 16),

                          Expanded(

                            child: _featureCard(

                              Icons.chair,

                              "Furniture",

                              "Drag & Drop",

                              Colors.orange,

                            ),

                          ),

                        ],

                      ),

                      const SizedBox(height: 16),

                      Row(

                        children: [

                          Expanded(

                            child: _featureCard(

                              Icons.rotate_right,

                              "Rotate",

                              "Pinch & Zoom",

                              Colors.green,

                            ),

                          ),

                          const SizedBox(width: 16),

                          Expanded(

                            child: _featureCard(

                              Icons.save,

                              "Save",

                              "Demo Layout",

                              Colors.purple,

                            ),

                          ),

                        ],

                      ),

                      const SizedBox(height: 40),

                      //--------------------------------------------------
                      // Start Button
                      //--------------------------------------------------

                      GlassButton(

                        text: "Start Designing",

                        icon: Icons.arrow_forward_rounded,

                        onPressed: () {

                          Navigator.pushNamed(

                            context,

                            Routes.gallery,

                          );

                        },

                      ),

                      const SizedBox(height: 25),

                    ],

                  ),

                ),

              ),

            ],

          );

        },

      ),

    );

  }

  Widget _featureCard(
      IconData icon,
      String title,
      String subtitle,
      Color color,
      ) {
    return GlassCard(
      height: 145,

      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [

            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(.18),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _glow(

      double size,

      Color color,

      ) {

    return Container(

      width: size,

      height: size,

      decoration: BoxDecoration(

        shape: BoxShape.circle,

        boxShadow: [

          BoxShadow(

            color: color.withOpacity(.30),

            blurRadius: 140,

            spreadRadius: 30,

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