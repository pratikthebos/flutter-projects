import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../app/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController pulseController;
  late AnimationController rotateController;

  @override
  void initState() {
    super.initState();

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  Color(0xff092B4D),
                  Color(0xff000000),
                ],
              ),
            ),
          ),

          //--------------------------------------------------
          // Glowing Blur
          //--------------------------------------------------

          Positioned(
            top: -120,
            left: -80,
            child: _glow(320, Colors.cyanAccent),
          ),

          Positioned(
            bottom: -120,
            right: -60,
            child: _glow(280, Colors.blueAccent),
          ),

          //--------------------------------------------------
          // Center Logo
          //--------------------------------------------------

          Center(
            child: AnimatedBuilder(
              animation: Listenable.merge([
                pulseController,
                rotateController,
              ]),
              builder: (_, __) {
                return Transform.scale(
                  scale: 0.92 + pulseController.value * 0.08,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      //----------------------------------------
                      // Rotating Ring
                      //----------------------------------------

                      Transform.rotate(
                        angle: rotateController.value * pi * 2,
                        child: Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: SweepGradient(
                              colors: [
                                Colors.transparent,
                                Colors.cyanAccent,
                                Colors.blueAccent,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),

                      //----------------------------------------
                      // Glass Circle
                      //----------------------------------------

                      Container(
                        width: 170,
                        height: 170,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(.20),
                              Colors.white.withOpacity(.05),
                            ],
                          ),
                          border: Border.all(
                            color: Colors.white24,
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                              Colors.cyanAccent.withOpacity(.45),
                              blurRadius: 50,
                              spreadRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.home_work_rounded,
                          size: 82,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          //--------------------------------------------------
          // Bottom Text
          //--------------------------------------------------

          const Positioned(
            bottom: 140,
            left: 0,
            right: 0,
            child: Column(
              children: [

                Text(
                  "INTERIOR360",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "360° Interior Design Experience",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),

          //--------------------------------------------------
          // Premium Loader
          //--------------------------------------------------

          const Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 34,
                height: 34,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(
                    Colors.cyanAccent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _glow(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.35),
            blurRadius: 150,
            spreadRadius: 40,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pulseController.dispose();
    rotateController.dispose();
    super.dispose();
  }
}