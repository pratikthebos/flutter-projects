import 'package:flutter/material.dart';

class DotsLoader extends StatefulWidget {
  const DotsLoader({super.key});

  @override
  State<DotsLoader> createState() =>
      _DotsLoaderState();
}

class _DotsLoaderState extends State<DotsLoader>
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
          children: List.generate(3, (index) {
            final value =
                (controller.value + index * .2) % 1;

            final scale =
                0.6 + (1 - (value - .5).abs() * 2) * .4;

            return Transform.scale(
              scale: scale,
              child: Container(
                margin:
                const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff6C63FF),
                ),
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