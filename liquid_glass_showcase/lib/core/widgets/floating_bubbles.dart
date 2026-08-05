import 'package:flutter/material.dart';

class FloatingBubbles extends StatefulWidget {
  const FloatingBubbles({super.key});

  @override
  State<FloatingBubbles> createState() =>
      _FloatingBubblesState();
}

class _FloatingBubblesState extends State<FloatingBubbles>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {

    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

  }

  Widget bubble(
      double size,
      double left,
      double top,
      Color color,
      ) {

    return Positioned(

      left: left,

      top: top + controller.value * 40,

      child: Container(

        width: size,

        height: size,

        decoration: BoxDecoration(

          shape: BoxShape.circle,

          gradient: RadialGradient(

            colors: [

              color.withOpacity(.18),

              Colors.transparent,

            ],

          ),

        ),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: controller,

      builder: (_, __) {

        return Stack(

          children: [

            bubble(220, -80, 80, Colors.blue),

            bubble(160, 280, 120, Colors.purple),

            bubble(180, 40, 500, Colors.cyan),

            bubble(140, 300, 620, Colors.pink),

          ],

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