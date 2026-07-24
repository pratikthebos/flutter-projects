import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../viewmodels/splash_viewmodel.dart';
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
    _initialize();
  }

  Future<void> _initialize() async {

    await context.read<SplashViewModel>().initialize();

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
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

              Color(0xff0F172A),

              Color(0xff1E3A8A),

              Color(0xff2563EB),

            ],
          ),
        ),

        child: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Container(

                height: 140,

                width: 140,

                decoration: BoxDecoration(

                  shape: BoxShape.circle,

                  color: Colors.white.withOpacity(.12),

                  border: Border.all(
                    color: Colors.white24,
                    width: 1.5,
                  ),

                  boxShadow: [

                    BoxShadow(

                      color: Colors.blue.withOpacity(.5),

                      blurRadius: 45,

                      spreadRadius: 8,
                    )
                  ],
                ),

                child: const Icon(

                  Icons.fitness_center,

                  size: 70,

                  color: Colors.white,
                ),
              )
                  .animate(onPlay: (c) => c.repeat())
                  .scale(
                duration: 1500.ms,
                begin: const Offset(.9, .9),
                end: const Offset(1.05, 1.05),
              )
                  .then()
                  .scale(
                begin: const Offset(1.05, 1.05),
                end: const Offset(.95, .95),
              ),

              const SizedBox(height: 40),

              Text(

                AppStrings.appName,

                style: const TextStyle(

                  fontSize: 38,

                  fontWeight: FontWeight.bold,

                  color: Colors.white,
                ),
              )
                  .animate()
                  .fadeIn(duration: 800.ms)
                  .slideY(begin: .4),

              const SizedBox(height: 12),

              Text(

                AppStrings.slogan,

                style: const TextStyle(

                  fontSize: 16,

                  color: Colors.white70,
                ),
              )
                  .animate()
                  .fadeIn(delay: 300.ms),

              const SizedBox(height: 80),

              const SizedBox(

                width: 35,

                height: 35,

                child: CircularProgressIndicator(

                  strokeWidth: 3,

                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}