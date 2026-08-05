import 'package:flutter/material.dart';

class LiquidShadow extends StatefulWidget {
  final Widget child;

  const LiquidShadow({
    super.key,
    required this.child,
  });

  @override
  State<LiquidShadow> createState() =>
      _LiquidShadowState();
}

class _LiquidShadowState extends State<LiquidShadow>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: controller,

      builder: (_, __) {

        double glow = 15 + controller.value * 25;

        return Container(

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(35),

            boxShadow: [

              BoxShadow(
                color: Colors.cyanAccent.withOpacity(.20),
                blurRadius: glow,
                spreadRadius: 1,
              ),

              BoxShadow(
                color: Colors.purpleAccent.withOpacity(.10),
                blurRadius: glow * 1.8,
                spreadRadius: 2,
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