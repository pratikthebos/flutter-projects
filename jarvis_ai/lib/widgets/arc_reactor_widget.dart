import 'dart:math';
import 'package:flutter/material.dart';

class ArcReactorWidget extends StatefulWidget {
  const ArcReactorWidget({super.key});

  @override
  State<ArcReactorWidget> createState() =>
      _ArcReactorWidgetState();
}

class _ArcReactorWidgetState
    extends State<ArcReactorWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: controller,

      builder: (_, __) {

        double glow = 15 + controller.value * 30;

        return Container(

          width: 90,
          height: 90,

          decoration: BoxDecoration(

            shape: BoxShape.circle,

            color: Colors.cyanAccent.withOpacity(.15),

            border: Border.all(
              color: Colors.cyanAccent,
              width: 3,
            ),

            boxShadow: [

              BoxShadow(

                color: Colors.cyanAccent,

                blurRadius: glow,

                spreadRadius: 3,

              ),

            ],

          ),

          child: Transform.rotate(

            angle: controller.value * pi * 2,

            child: const Icon(

              Icons.bolt,

              color: Colors.white,

              size: 45,

            ),

          ),

        );

      },

    );

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}