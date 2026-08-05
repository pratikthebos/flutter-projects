import 'package:flutter/material.dart';

class LiquidLoader extends StatefulWidget {
  const LiquidLoader({super.key});

  @override
  State<LiquidLoader> createState() =>
      _LiquidLoaderState();
}

class _LiquidLoaderState
    extends State<LiquidLoader>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {

    return RotationTransition(

      turns: controller,

      child: SizedBox(

        width: 70,
        height: 70,

        child: CircularProgressIndicator(
          strokeWidth: 5,
          valueColor:
          const AlwaysStoppedAnimation(
            Colors.cyanAccent,
          ),
          backgroundColor: Colors.white12,
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