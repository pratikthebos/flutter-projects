import 'package:abc_kids_learn/features/alphabet/view/%20alphabet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_colors.dart';
import '../viewmodel/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const AlphabetScreen(),
        ),
      );
    });
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

              Color(0xff8B5CF6),

              Color(0xff6366F1),

              Color(0xff3B82F6),

            ],

          ),

        ),

        child: SafeArea(

          child: Center(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Container(

                  width: 150,
                  height: 150,

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius: BorderRadius.circular(40),

                    boxShadow: [

                      BoxShadow(

                        color: Colors.white.withOpacity(.4),

                        blurRadius: 40,

                        spreadRadius: 5,

                      ),

                    ],

                  ),

                  child: Center(

                    child: Text(

                      "ABC",

                      style: GoogleFonts.poppins(

                        fontSize: 54,

                        fontWeight: FontWeight.bold,

                        color: AppColors.primary,

                      ),

                    ),

                  ),

                )

                    .animate()
                    .scale(
                  duration: 800.ms,
                  curve: Curves.elasticOut,
                )
                    .then()
                    .shimmer(
                  duration: 1200.ms,
                ),

                const SizedBox(height: 40),

                Text(

                  "ABC Kids Learn",

                  style: GoogleFonts.poppins(

                    color: Colors.white,

                    fontWeight: FontWeight.bold,

                    fontSize: 34,

                  ),

                )

                    .animate()
                    .fadeIn()
                    .slideY(begin: .4),

                const SizedBox(height: 12),

                Text(

                  "Learning is Fun!",

                  style: GoogleFonts.poppins(

                    color: Colors.white70,

                    fontSize: 18,

                  ),

                )

                    .animate()
                    .fadeIn(delay: 500.ms),

                const SizedBox(height: 70),

                const CircularProgressIndicator(

                  color: Colors.white,

                )

                    .animate()
                    .fadeIn(),

              ],

            ),

          ),

        ),

      ),

    );

  }
}