import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({super.key});

  @override
  State<LoadingIndicator> createState() =>
      _LoadingIndicatorState();
}

class _LoadingIndicatorState
    extends State<LoadingIndicator>
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

      child: Container(

        width: 60,
        height: 60,

        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.cyanAccent,
            width: 3,
          ),
        ),

        child: const Center(
          child: Icon(
            Icons.home_work,
            color: Colors.white,
          ),
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