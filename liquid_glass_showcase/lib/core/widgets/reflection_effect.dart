import 'package:flutter/material.dart';

class ReflectionEffect extends StatefulWidget {
  const ReflectionEffect({super.key});

  @override
  State<ReflectionEffect> createState() =>
      _ReflectionEffectState();
}

class _ReflectionEffectState extends State<ReflectionEffect>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: controller,

      builder: (_, __) {

        return Transform.translate(

          offset: Offset(
            controller.value * 400 - 200,
            0,
          ),

          child: Transform.rotate(

            angle: -.2,

            child: Container(

              width: 80,

              decoration: BoxDecoration(

                gradient: LinearGradient(

                  colors: [

                    Colors.transparent,

                    Colors.white.withOpacity(.35),

                    Colors.transparent,

                  ],

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