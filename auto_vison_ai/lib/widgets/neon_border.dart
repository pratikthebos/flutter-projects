import 'package:flutter/material.dart';

class NeonBorder extends StatefulWidget {
  final Widget child;

  final BorderRadius borderRadius;

  final Color glowColor;

  const NeonBorder({
    super.key,
    required this.child,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(24),
    ),
    this.glowColor = Colors.cyanAccent,
  });

  @override
  State<NeonBorder> createState() => _NeonBorderState();
}

class _NeonBorderState extends State<NeonBorder>
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

        double glow = 8 + controller.value * 18;

        return Container(

          decoration: BoxDecoration(

            borderRadius: widget.borderRadius,

            border: Border.all(

              color: widget.glowColor.withOpacity(.85),

              width: 1.6,

            ),

            boxShadow: [

              BoxShadow(

                color: widget.glowColor.withOpacity(.18),

                blurRadius: glow,

                spreadRadius: 1,

              ),

              BoxShadow(

                color: widget.glowColor.withOpacity(.08),

                blurRadius: glow * 2,

              ),

            ],

          ),

          child: widget.child,

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