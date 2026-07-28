import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/animated_background.dart';
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
      duration: const Duration(seconds: 3),
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
      body: AnimatedBackground(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                        color: AppColors.primary.withOpacity(.5),
                        blurRadius: 35,
                      ),
                    ],
                  ),
                  child: const Icon(
                    AppIcons.shield,
                    color: Colors.white,
                    size: 75,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              Text(
                AppStrings.appName,
                style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ).animate().fade().slideY(begin: .4),

              const SizedBox(height: 10),

              Text(
                AppStrings.appTagline,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ).animate().fade(delay: 500.ms),

              const SizedBox(height: 60),

              const CircularProgressIndicator(
                color: Colors.white,
              )
                  .animate(onPlay: (c) => c.repeat())
                  .rotate(),
            ],
          ),
        ),
      ),
    );
  }
}