import 'package:flutter/material.dart';

class WaveLoader extends StatefulWidget {
  const WaveLoader({super.key});

  @override
  State<WaveLoader> createState() =>
      _WaveLoaderState();
}

class _WaveLoaderState extends State<WaveLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(5, (index) {
            final phase =
                (controller.value + index * .15) % 1;

            final height =
                20 + 65 * (0.5 + .5 * (1 - (phase - .5).abs() * 2));

            return Container(
              margin:
              const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: height.clamp(20, 75),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff8E5CFF),
              ),
            );
          }),
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