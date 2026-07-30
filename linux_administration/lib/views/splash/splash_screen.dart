import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../viewmodels/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {

    super.initState();

    controller = AnimationController(

      vsync: this,

      duration: const Duration(seconds: 10),

    )..repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {

      context.read<SplashViewModel>().start(context);

    });

  }

  @override
  void dispose() {

    controller.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            RotationTransition(

              turns: controller,

              child: Container(

                width: 150,

                height: 150,

                decoration: BoxDecoration(

                  gradient: AppColors.primaryGradient,

                  shape: BoxShape.circle,

                  boxShadow: [

                    BoxShadow(

                      color: AppColors.primary.withOpacity(.35),

                      blurRadius: 40,

                    ),

                  ],

                ),

                child: const Icon(

                  Icons.terminal,

                  color: Colors.white,

                  size: 70,

                ),

              ),

            ),

            const SizedBox(height: 35),

            Text(

              AppStrings.appName,

              style: const TextStyle(

                fontSize: 36,

                fontWeight: FontWeight.bold,

              ),

            ).animate().fadeIn().slideY(),

            const SizedBox(height: 8),

            Text(

              AppStrings.slogan,

              style: const TextStyle(

                color: Colors.grey,

                fontSize: 17,

              ),

            ).animate().fadeIn(delay: 400.ms),

            const SizedBox(height: 50),

            const CircularProgressIndicator(),

          ],

        ),

      ),

    );

  }

}