import 'package:flutter/material.dart';

class GlowEffect extends StatefulWidget {

  final Widget child;

  const GlowEffect({
    super.key,
    required this.child,
  });

  @override
  State<GlowEffect> createState() =>
      _GlowEffectState();

}

class _GlowEffectState
    extends State<GlowEffect>
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

        return Container(

          decoration: BoxDecoration(

            boxShadow: [

              BoxShadow(

                color:
                Colors.cyanAccent.withOpacity(
                  .25 + controller.value * .25,
                ),

                blurRadius:
                25 + controller.value * 25,

                spreadRadius:
                controller.value * 4,

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