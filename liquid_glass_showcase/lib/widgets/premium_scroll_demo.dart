import 'dart:ui';
import 'package:flutter/material.dart';

class PremiumScrollDemo extends StatefulWidget {
  const PremiumScrollDemo({super.key});

  @override
  State<PremiumScrollDemo> createState() =>
      _PremiumScrollDemoState();
}

class _PremiumScrollDemoState
    extends State<PremiumScrollDemo> {

  final PageController controller =
  PageController(viewportFraction: .72);

  double page = 0;

  final List<IconData> icons = [

    Icons.auto_awesome,

    Icons.blur_on,

    Icons.animation,

    Icons.water_drop,

    Icons.bubble_chart,

  ];

  final List<String> titles = [

    "Liquid Glass",

    "Crystal Blur",

    "Morph UI",

    "VisionOS",

    "Premium UI",

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

      height: 360,

      child: PageView.builder(

        controller: controller,

        itemCount: titles.length,

        physics: const BouncingScrollPhysics(),

        itemBuilder: (_, index) {

          double diff = page - index;

          double scale =
          (1 - diff.abs() * .18)
              .clamp(.80, 1.0);

          double rotate =
              diff * -.30;

          double opacity =
          (1 - diff.abs() * .45)
              .clamp(.35, 1.0);

          return Transform(

            alignment: Alignment.center,

            transform: Matrix4.identity()

              ..setEntry(3, 2, 0.001)

              ..rotateY(rotate)

              ..scale(scale),

            child: Opacity(

              opacity: opacity,

              child: Padding(

                padding:
                const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 20,
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

                            blurRadius: 40,

                            spreadRadius: 4,

                          ),

                        ],

                      ),

                      child: Stack(
                        fit: StackFit.expand,
                        children: [

                          //--------------------------------
                          // Reflection
                          //--------------------------------

                          Positioned(
                            left: -180 + (page - index + 1) * 180,
                            top: -50,
                            child: Transform.rotate(
                              angle: -.40,
                              child: Container(
                                width: 90,
                                height: 500,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.white.withValues(alpha: .35),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //--------------------------------
                          // Center Content
                          //--------------------------------

                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  //--------------------------------
                                  // Premium Glass Icon
                                  //--------------------------------

                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white.withValues(alpha: .18),
                                          Colors.white.withValues(alpha: .05),
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
                                      size: 50,
                                    ),
                                  ),

                                  const SizedBox(height: 28),

                                  //--------------------------------
                                  // Title
                                  //--------------------------------

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

                                  //--------------------------------
                                  // Subtitle
                                  //--------------------------------

                                  const Text(
                                    "CogniCore Animation",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 25),

                                  //--------------------------------
                                  // Glass Indicator
                                  //--------------------------------

                                  Container(
                                    width: 80,
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