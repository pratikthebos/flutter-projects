import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/routes.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

import '../../core/widgets/hud_background.dart';
import '../../core/widgets/particle_effect.dart';
import '../../core/widgets/rotating_ring.dart';
import '../../core/widgets/energy_ring.dart';

import '../../viewmodels/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  int progress = 0;

  late AnimationController helmetController;

  late AnimationController textController;

  @override
  void initState() {
    super.initState();

    helmetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    bootSequence();
  }

  Future<void> bootSequence() async {

    helmetController.forward();

    await Future.delayed(
      const Duration(milliseconds: 600),
    );

    textController.forward();

    for (int i = 0; i <= 100; i++) {

      await Future.delayed(
        const Duration(milliseconds: 28),
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
      backgroundColor: Colors.black,

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Hero(
                tag: "ironman",
                child: Image.asset(
                  AppAssets.ironman,
                  height: 420,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),

              const SizedBox(height: 35),

              Text(
                AppStrings.appName,
                style: const TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "AI Suit Diagnostic System",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 45),

              SizedBox(
                width: 260,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: LinearProgressIndicator(
                    value: progress / 100,
                    minHeight: 8,
                    backgroundColor: Colors.white12,
                    color: Colors.cyanAccent,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Text(
                "$progress%",
                style: const TextStyle(
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Initializing JARVIS...",
                style: TextStyle(
                  color: Colors.white60,
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }

  @override
  void dispose() {

    helmetController.dispose();

    textController.dispose();

    super.dispose();

  }

}