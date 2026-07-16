import 'dart:async';
import 'dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_colors.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff4C5CFF),
              Color(0xff7A87FF),
            ],
          ),
        ),

        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //----------------------------------
                // Lottie Animation
                //----------------------------------

                // Lottie.asset(
                //   "assets/lottie/fitness.json",
                //   height: 260,
                //   repeat: true,
                // ),
                Lottie.asset(
                  'assets/lottie/Cycling.json',
                  height: 200,
                ),

                const SizedBox(height: 30),

                //----------------------------------
                // App Name
                //----------------------------------

                const Text(
                  "FitTrack",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                )
                    .animate()
                    .fade(duration: 700.ms)
                    .slideY(begin: .4),

                const SizedBox(height: 12),

                const Text(
                  "Your Personal Fitness Partner",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                )
                    .animate()
                    .fade(delay: 300.ms),

                const SizedBox(height: 70),

                //----------------------------------
                // Loading Indicator
                //----------------------------------

                // Lottie.asset(
                //   "assets/lottie/loadingss.json",
                //   height: 200,
                //
                // ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white.withOpacity(.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}