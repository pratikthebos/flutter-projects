import 'package:eduflow_ai/views/navigation/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const BottomNavigationScreen(),
        ),
      );

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [

              Color(0xff4F46E5),

              Color(0xff06B6D4),

              Color(0xff8B5CF6),

            ],

          ),

        ),

        child: Stack(

          children: [

            Positioned(
              top: -80,
              right: -60,
              child: Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.10),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Positioned(
              bottom: -120,
              left: -80,
              child: Container(
                height: 280,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.08),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Center(

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Container(

                    height: 120,
                    width: 120,

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius: BorderRadius.circular(35),

                      boxShadow: [

                        BoxShadow(

                          color: Colors.black.withOpacity(.20),

                          blurRadius: 30,

                          offset: const Offset(0,15),

                        ),

                      ],

                    ),

                    child: const Icon(

                      Icons.school_rounded,

                      color: Color(0xff4F46E5),

                      size: 70,

                    ),

                  )
                      .animate()
                      .scale(
                    duration: 800.ms,
                    curve: Curves.elasticOut,
                  ),

                  const SizedBox(height: 35),

                  const Text(

                    "Study Pilot",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 34,

                      fontWeight: FontWeight.bold,

                    ),

                  )
                      .animate()
                      .fade(duration: 700.ms)
                      .slideY(begin: .4),

                  const SizedBox(height: 12),

                  const Text(

                    "Smart Classroom For Modern Students",

                    style: TextStyle(

                      color: Colors.white70,

                      fontSize: 16,

                      letterSpacing: 1,

                    ),

                  )
                      .animate()
                      .fade(delay: 300.ms),

                  const SizedBox(height: 80),

                  const CircularProgressIndicator(

                    color: Colors.white,

                    strokeWidth: 3,

                  )
                      .animate()
                      .fade(delay: 600.ms),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }
}