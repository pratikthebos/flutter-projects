import 'dart:math';

import 'package:flutter/material.dart';

import '../core/constants/app_assets.dart';

class RotatingSuit extends StatefulWidget {
  const RotatingSuit({super.key});

  @override
  State<RotatingSuit> createState() =>
      _RotatingSuitState();
}

class _RotatingSuitState
    extends State<RotatingSuit>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {

    super.initState();

    controller = AnimationController(

      vsync: this,

      duration: const Duration(seconds: 12),

    )..repeat();

  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: controller,

      builder: (_, child) {

        return Transform(

          alignment: Alignment.center,

          transform: Matrix4.identity()

            ..setEntry(3, 2, .001)

            ..rotateY(controller.value * pi * 2),

          child: child,

        );

      },

      child: Hero(

        tag: "ironman",

        child: Image.asset(

          AppAssets.ironman,

          height: 330,

        ),

      ),

    );

  }

  @override
  void dispose() {

    controller.dispose();

    super.dispose();

  }

}