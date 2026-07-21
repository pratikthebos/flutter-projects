import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../app/routes.dart';
import '../../utils/app_colors.dart';
import '../../viewmodels/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<SplashViewModel>().initialize(() {
        Navigator.pushReplacementNamed(
          context,
          Routes.home,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(.25),
                    blurRadius: 30,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: const Icon(
                Icons.task_alt_rounded,
                color: Colors.white,
                size: 60,
              ),
            )
                .animate()
                .scale(duration: 700.ms)
                .fadeIn(),

            const SizedBox(height: 30),

            const Text(
              "TaskFlow",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            )
                .animate()
                .fadeIn(delay: 300.ms)
                .slideY(begin: .4),

            const SizedBox(height: 10),

            const Text(
              "Organize Your Day Efficiently",
              style: TextStyle(
                color: AppColors.subtitle,
                fontSize: 16,
              ),
            )
                .animate()
                .fadeIn(delay: 600.ms),

            const SizedBox(height: 45),

            const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            )
                .animate(onPlay: (controller) => controller.repeat())
                .rotate(duration: 1500.ms),
          ],
        ),
      ),
    );
  }
}