import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../viewmodels/splash_viewmodel.dart';

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

      duration: const Duration(seconds: 10),

    )..repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {

      Provider.of<SplashViewModel>(

        context,

        listen: false,

      ).start(context);

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

                  shape: BoxShape.circle,

                  gradient: AppColors.primaryGradient,

                  boxShadow: [

                    BoxShadow(

                      color: Colors.red.withOpacity(.30),

                      blurRadius: 30,

                    ),

                  ],

                ),

                child: const Icon(

                  Icons.movie_creation,

                  size: 80,

                  color: Colors.white,

                ),

              ),

            ),

            const SizedBox(height: 35),

            const Text(

              "MovieVerse",

              style: TextStyle(

                fontSize: 36,

                fontWeight: FontWeight.bold,

              ),

            ).animate().fadeIn().slideY(),

            const SizedBox(height: 10),

            const Text(

              "Book Tickets Instantly",

              style: TextStyle(

                color: Colors.grey,

                fontSize: 16,

              ),

            ).animate().fadeIn(delay: 400.ms),

            const SizedBox(height: 60),

            const CircularProgressIndicator(

              color: Colors.red,

            ),

          ],

        ),

      ),

    );
  }
}