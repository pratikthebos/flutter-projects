import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
import '../../viewmodels/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashViewModel>().initialize(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  height: 130,
                  width: 130,

                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30),

                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(.25),
                        blurRadius: 30,
                        offset: const Offset(0, 12),
                      )
                    ],
                  ),

                  child: const Icon(
                    Icons.api_rounded,
                    size: 70,
                    color: Colors.white,
                  ),
                )
                    .animate()
                    .scale(
                  duration: 700.ms,
                  curve: Curves.easeOutBack,
                )
                    .fadeIn(),

                const SizedBox(height: 30),

                const Text(
                  "API Tester Pro",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                )
                    .animate()
                    .fadeIn(delay: 300.ms)
                    .slideY(begin: .3),

                const SizedBox(height: 10),

                const Text(
                  "Test REST APIs Anywhere",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.subtitle,
                  ),
                )
                    .animate()
                    .fadeIn(delay: 500.ms),

                const SizedBox(height: 70),

                const CircularProgressIndicator(),

                const SizedBox(height: 18),

                const Text(
                  "Loading...",
                  style: TextStyle(
                    color: AppColors.subtitle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}