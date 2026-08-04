import 'package:flutter/material.dart';

class RadarAnimation extends StatefulWidget {
  const RadarAnimation({super.key});

  @override
  State<RadarAnimation> createState() =>
      _RadarAnimationState();
}

class _RadarAnimationState extends State<RadarAnimation>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {

    super.initState();

    controller = AnimationController(

      vsync: this,

      duration: const Duration(seconds: 3),

    )..repeat();

  }

  @override
  Widget build(BuildContext context) {

    return RotationTransition(

      turns: controller,

      child: Image.asset(

        "assets/images/hud_circle.jpg",

        width: 180,

      ),

    );

  }

  @override
  void dispose() {

    controller.dispose();

    super.dispose();

  }

}