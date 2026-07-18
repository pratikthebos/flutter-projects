import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/animated_background.dart';
import '../widgets/animated_button.dart';
import '../widgets/floating_blob.dart';
import '../widgets/glass_card.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _fade;
  late Animation<double> _scale;
  late Animation<Offset> _slide;

  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _scale = Tween<double>(
      begin: .7,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, .35),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();

    Timer(
      const Duration(seconds: 4),
          () {
        if (!_navigated) {
          _openHome();
        }
      },
    );
  }

  void _openHome() {
    _navigated = true;

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 900),
        pageBuilder: (_, __, ___) => const HomeScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: Stack(
          children: [

            const FloatingBlob(
              size: 260,
              alignment: Alignment.topLeft,
              colors: [
                Color(0xff8B5CF6),
                Color(0xff6366F1),
              ],
            ),

            const FloatingBlob(
              size: 220,
              alignment: Alignment.bottomRight,
              colors: [
                Color(0xff06B6D4),
                Color(0xff3B82F6),
              ],
            ),

            const FloatingBlob(
              size: 180,
              alignment: Alignment.centerRight,
              colors: [
                Color(0xffEC4899),
                Color(0xffF43F5E),
              ],
            ),

            SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      FadeTransition(
                        opacity: _fade,
                        child: ScaleTransition(
                          scale: _scale,
                          child: Hero(
                            tag: "logo",
                            child: GlassCard(
                              borderRadius: 40,
                              padding: const EdgeInsets.all(32),
                              child: const Icon(
                                Icons.auto_awesome,
                                color: Colors.white,
                                size: 90,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      SlideTransition(
                        position: _slide,
                        child: FadeTransition(
                          opacity: _fade,
                          child: const Text(
                            "Aurora Motion",
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      FadeTransition(
                        opacity: _fade,
                        child: const Text(
                          "Premium Flutter Animation Showcase",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),
                      ),

                      const SizedBox(height: 60),

                      AnimatedButton(
                        text: "Explore",
                        icon: Icons.arrow_forward_ios_rounded,
                        onPressed: _openHome,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}