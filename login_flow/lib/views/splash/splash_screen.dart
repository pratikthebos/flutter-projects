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
      duration: const Duration(seconds: 12),
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

      body: Container(

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topLeft,

            end: Alignment.bottomRight,

            colors: [

              Color(0xff2563EB),

              Color(0xff7C3AED),

              Color(0xff4F46E5),

            ],

          ),

        ),

        child: Stack(

          children: [

            Positioned(
              top: -80,
              left: -60,
              child: _circle(220),
            ),

            Positioned(
              bottom: -120,
              right: -80,
              child: _circle(260),
            ),

            Positioned(
              top: 130,
              left: 40,
              child: Icon(
                Icons.cloud_upload_rounded,
                color: Colors.white24,
                size: 60,
              ).animate(onPlay: (c)=>c.repeat())
                  .moveY(begin: -10,end: 10,duration: 3.seconds),
            ),

            Positioned(
              top: 230,
              right: 40,
              child: Icon(
                Icons.storage_rounded,
                color: Colors.white24,
                size: 60,
              ).animate(onPlay: (c)=>c.repeat())
                  .moveY(begin: 10,end: -10,duration: 4.seconds),
            ),

            Center(

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

                            color: Colors.white.withOpacity(.3),

                            blurRadius: 35,

                          )

                        ],

                      ),

                      child: const Icon(

                        Icons.login_rounded,

                        size: 70,

                        color: Colors.white,

                      ),

                    ),

                  ),

                  const SizedBox(height: 35),

                  const Text(

                    AppStrings.appName,

                    style: TextStyle(

                      fontSize: 34,

                      color: Colors.white,

                      fontWeight: FontWeight.bold,

                    ),

                  ).animate().fadeIn().slideY(),

                  const SizedBox(height: 12),

                  const Padding(

                    padding: EdgeInsets.symmetric(horizontal: 40),

                    child: Text(

                      AppStrings.slogan,

                      textAlign: TextAlign.center,

                      style: TextStyle(

                        color: Colors.white70,

                        fontSize: 16,

                      ),

                    ),

                  ),

                  const SizedBox(height: 50),

                  const CircularProgressIndicator(

                    color: Colors.white,

                  ),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

  Widget _circle(double size){

    return Container(

      width: size,

      height: size,

      decoration: BoxDecoration(

        color: Colors.white.withOpacity(.06),

        shape: BoxShape.circle,

      ),

    );

  }

}