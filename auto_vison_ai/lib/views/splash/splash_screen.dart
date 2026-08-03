import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/routes.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';



import '../../viewmodels/splash_viewmodel.dart';

import '../../widgets/hud_background.dart';
import '../../widgets/particle_effect.dart';
import '../../widgets/rotating_ring.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  int progress = 0;

  @override
  void initState() {
    super.initState();

    bootSequence();
  }

  Future<void> bootSequence() async {

    for (int i = 0; i <= 100; i++) {

      await Future.delayed(
        const Duration(milliseconds: 30),
      );

      if (!mounted) return;

      setState(() {
        progress = i;
      });
    }

    await context
        .read<SplashViewModel>()
        .initialize();

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      Routes.garage,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      body: Stack(

        children: [

          const HudBackground(),

          const ParticleEffect(),

          Center(

            child: Column(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                //------------------------------------------------------
// AI Scanner Ring + Car
//------------------------------------------------------

                SizedBox(
                  width: 280,
                  height: 280,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      const RotatingRing(
                        size: 260,
                      ),

                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.cyanAccent.withOpacity(.08),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyanAccent.withOpacity(.25),
                              blurRadius: 40,
                              spreadRadius: 8,
                            ),
                          ],
                        ),
                      ),

                      Hero(
                        tag: "car",
                        child: Image.asset(
                          "assets/images/car_side.png",
                          width: 180,
                          fit: BoxFit.contain,
                        ),
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 35),

                Text(
                  AppStrings.appName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "AI Vehicle Diagnostic System",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 45),

                SizedBox(
                  width: 250,
                  child: LinearProgressIndicator(
                    value: progress / 100,
                    minHeight: 8,
                    backgroundColor:
                    Colors.white12,
                    color: Colors.cyanAccent,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  "$progress %",
                  style: const TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Initializing AI Scanner...",
                  style: TextStyle(
                    color: Colors.white60,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}