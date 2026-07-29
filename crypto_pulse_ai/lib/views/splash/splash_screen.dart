import 'dart:async';
import 'package:crypto_pulse_ai/main.dart';
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

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainScreen(),
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

              Color(0xff0F0B1F),

              Color(0xff1B1630),

              Color(0xff7C3AED),

            ],

          ),

        ),

        child: Stack(

          children: [

            Positioned(
              top: -60,
              right: -40,
              child: _floatingCircle(180),
            ),

            Positioned(
              bottom: -90,
              left: -60,
              child: _floatingCircle(240),
            ),

            Positioned(
              top: 120,
              left: 35,
              child: _coin("₿"),
            ),

            Positioned(
              top: 200,
              right: 40,
              child: _coin("Ξ"),
            ),

            Positioned(
              bottom: 170,
              left: 50,
              child: _coin("◎"),
            ),

            Center(

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Container(

                    height: 130,

                    width: 130,

                    decoration: BoxDecoration(

                      shape: BoxShape.circle,

                      gradient: const LinearGradient(

                        colors: [

                          Color(0xff7C3AED),

                          Color(0xffA855F7),

                        ],

                      ),

                      boxShadow: [

                        BoxShadow(

                          color: const Color(0xff7C3AED).withOpacity(.6),

                          blurRadius: 40,

                          spreadRadius: 6,

                        ),

                      ],

                    ),

                    child: const Icon(

                      Icons.currency_bitcoin,

                      color: Colors.white,

                      size: 70,

                    ),

                  )
                      .animate()
                      .scale(
                    duration: 900.ms,
                    curve: Curves.elasticOut,
                  )
                      .fade(),

                  const SizedBox(height: 35),

                  const Text(

                    "CryptoPulse AI",

                    style: TextStyle(

                      color: Colors.white,

                      fontWeight: FontWeight.bold,

                      fontSize: 34,

                    ),

                  )
                      .animate()
                      .slideY(begin: .4)
                      .fade(),

                  const SizedBox(height: 10),

                  const Text(

                    "Track • Analyze • Invest",

                    style: TextStyle(

                      color: Colors.white70,

                      letterSpacing: 1.2,

                    ),

                  )
                      .animate()
                      .fade(delay: 300.ms),

                  const SizedBox(height: 60),

                  const CircularProgressIndicator(
                    color: Colors.white,
                  )
                      .animate()
                      .fade(delay: 500.ms),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

  Widget _floatingCircle(double size) {

    return Container(

      height: size,

      width: size,

      decoration: BoxDecoration(

        shape: BoxShape.circle,

        color: Colors.white.withOpacity(.04),

      ),

    );

  }

  Widget _coin(String text) {

    return Container(

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(

        shape: BoxShape.circle,

        color: Colors.white.withOpacity(.08),

      ),

      child: Text(

        text,

        style: const TextStyle(

          color: Colors.white,

          fontSize: 28,

          fontWeight: FontWeight.bold,

        ),

      ),

    )
        .animate(
      onPlay: (controller) => controller.repeat(reverse: true),
    )
        .moveY(
      begin: -10,
      end: 10,
      duration: 2.seconds,
    );

  }

}