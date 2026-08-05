import 'dart:ui';
import 'package:flutter/material.dart';

class PremiumCarousel extends StatefulWidget {
  const PremiumCarousel({super.key});

  @override
  State<PremiumCarousel> createState() => _PremiumCarouselState();
}

class _PremiumCarouselState extends State<PremiumCarousel> {
  final PageController controller =
  PageController(viewportFraction: 0.78);

  double page = 0;

  final List<IconData> icons = [
    Icons.auto_awesome,
    Icons.blur_on,
    Icons.layers,
    Icons.animation,
    Icons.bubble_chart,
  ];

  final List<String> titles = [
    "Liquid Glass",
    "Dynamic Blur",
    "Morph UI",
    "VisionOS",
    "Glass Engine",
  ];

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        page = controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,

      child: PageView.builder(
        controller: controller,
        itemCount: titles.length,

        itemBuilder: (context, index) {

          final diff = page - index;

          final scale =
          (1 - diff.abs() * .18).clamp(.82, 1.0);

          final rotate =
              diff * -.28;

          final opacity =
          (1 - diff.abs() * .45).clamp(.35, 1.0);

          return Transform(
            alignment: Alignment.center,

            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0015)
              ..rotateY(rotate)
              ..rotateZ(diff * -0.03)
              ..scale(scale),

            child: Opacity(

              opacity: opacity,

              child: Padding(

                padding:
                const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 18,
                ),

                child: ClipRRect(

                  borderRadius:
                  BorderRadius.circular(34),

                  child: BackdropFilter(

                    filter: ImageFilter.blur(
                      sigmaX: 25,
                      sigmaY: 25,
                    ),

                    child: Container(

                      decoration: BoxDecoration(

                        borderRadius:
                        BorderRadius.circular(34),

                        border: Border.all(
                          color: Colors.white24,
                        ),

                        gradient: LinearGradient(

                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,

                          colors: [

                            Colors.white.withValues(alpha: .22),

                            Colors.white.withValues(alpha: .05),

                          ],

                        ),

                        boxShadow: [

                          BoxShadow(

                            color: Colors.cyan
                                .withValues(alpha: .18),

                            blurRadius: 35,

                            spreadRadius: 2,

                          ),

                        ],

                      ),

                      child: Stack(
                        fit: StackFit.expand,
                        children: [

                          //-----------------------------------------
                          // Animated Background
                          //-----------------------------------------

                          Positioned.fill(
                            child: Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(32),
                                child: Transform.translate(
                                  offset: Offset(diff * -18, 0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: const RadialGradient(
                                        center: Alignment(-0.8, -0.8),
                                        radius: 1.8,
                                        colors: [
                                          Color(0xff74F2FF),
                                          Color(0xff6A5CFF),
                                          Color(0xff2A1E5C),
                                          Color(0xff080808),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //-----------------------------------------
                          // Floating Blur Blob 1
                          //-----------------------------------------

                          Positioned(
                            top: 30,
                            left: 20 + diff * 30,
                            child: Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.cyan.withValues(alpha: .12),
                              ),
                            ),
                          ),

                          //-----------------------------------------
                          // Floating Blur Blob 2
                          //-----------------------------------------

                          Positioned(
                            bottom: 25,
                            right: 20 - diff * 30,
                            child: Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepPurple.withValues(alpha: .10),
                              ),
                            ),
                          ),

                          //-----------------------------------------
                          // Reflection
                          //-----------------------------------------

                          Positioned(
                            left: -220 + (page - index + 1) * 200,
                            top: -80,
                            child: Transform.rotate(
                              angle: -.40,
                              child: Container(
                                width: 100,
                                height: 520,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.white.withValues(alpha: .40),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //-----------------------------------------
                          // Card Content
                          //-----------------------------------------

                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  Container(
                                    width: 110,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white.withValues(alpha: .20),
                                          Colors.white.withValues(alpha: .06),
                                        ],
                                      ),
                                      border: Border.all(
                                        color: Colors.white.withValues(alpha: .25),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.cyan.withValues(alpha: .25),
                                          blurRadius: 25,
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      icons[index],
                                      color: Colors.white,
                                      size: 54,
                                    ),
                                  ),

                                  const SizedBox(height: 26),

                                  Text(
                                    titles[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  const Text(
                                    "Premium CogniCore Inspired UI",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 28),

                                  Container(
                                    width: 100,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Colors.transparent,
                                          Colors.cyanAccent,
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                    ),

                  ),

                ),

              ),

            ),

          );

        },

      ),

    );

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}