import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/routes.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

import '../../viewmodels/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late AnimationController plateController;
  late AnimationController forkController;
  late AnimationController textController;

  @override
  void initState() {

    super.initState();

    plateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    forkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    startAnimation();

  }

  Future<void> startAnimation() async {

    plateController.forward();

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    forkController.forward();

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    textController.forward();

    await context.read<SplashViewModel>().loadApp();

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      Routes.dashboard,
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            ScaleTransition(
              scale: CurvedAnimation(
                parent: plateController,
                curve: Curves.elasticOut,
              ),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffFF9800),
                      Color(0xffFFB74D),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.35),
                      blurRadius: 25,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.restaurant_menu_rounded,
                  color: Colors.white,
                  size: 70,
                ),
              ),
            ),

            const SizedBox(height: 30),

            FadeTransition(

              opacity: textController,

              child: Column(

                children: [

                  Text(

                    AppStrings.appName,

                    style: const TextStyle(

                      fontSize: 34,

                      fontWeight: FontWeight.bold,

                      color: AppColors.textPrimary,

                    ),

                  ),

                  const SizedBox(height: 8),

                  const Text(

                    "Smart Canteen Management",

                    style: TextStyle(

                      color: AppColors.textSecondary,

                      fontSize: 16,

                    ),

                  ),

                ],

              ),

            ),

            const SizedBox(height: 40),

            const SizedBox(

              width: 220,

              child: LinearProgressIndicator(),

            ),

          ],

        ),

      ),

    );

  }

  @override
  void dispose() {

    plateController.dispose();

    forkController.dispose();

    textController.dispose();

    super.dispose();

  }

}