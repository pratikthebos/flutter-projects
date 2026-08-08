import 'package:flutter/material.dart';

class LinearLoader extends StatefulWidget {
  const LinearLoader({super.key});

  @override
  State<LinearLoader> createState() =>
      _LinearLoaderState();
}

class _LinearLoaderState extends State<LinearLoader>
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
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return SizedBox(
          width: 180,
          child: LinearProgressIndicator(
            value: controller.value,
            minHeight: 7,
            borderRadius: BorderRadius.circular(20),
            backgroundColor:
            Colors.white.withOpacity(.7),
            valueColor:
            const AlwaysStoppedAnimation(
              Color(0xff2979FF),
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