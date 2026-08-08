import 'package:flutter/material.dart';

class PulseLoader extends StatefulWidget {
  const PulseLoader({super.key});

  @override
  State<PulseLoader> createState() =>
      _PulseLoaderState();
}

class _PulseLoaderState extends State<PulseLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final scale =
            .65 + controller.value * .8;

        final opacity =
            1 - controller.value;

        return Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xff00C6FF)
                .withOpacity(opacity),
          ),
          child: Center(
            child: Transform.scale(
              scale: scale,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff00C6FF),
                ),
              ),
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