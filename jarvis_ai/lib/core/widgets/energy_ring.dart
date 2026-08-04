import 'package:flutter/material.dart';

class EnergyRing extends StatefulWidget {

  final double size;

  const EnergyRing({
    super.key,
    this.size = 180,
  });

  @override
  State<EnergyRing> createState() =>
      _EnergyRingState();

}

class _EnergyRingState extends State<EnergyRing>
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

        double glow =
            10 + controller.value * 20;

        return Container(

          width: widget.size,

          height: widget.size,

          decoration: BoxDecoration(

            shape: BoxShape.circle,

            border: Border.all(

              color: Colors.cyanAccent,

              width: 4,

            ),

            boxShadow: [

              BoxShadow(

                color: Colors.cyanAccent
                    .withOpacity(.6),

                blurRadius: glow,

                spreadRadius: 3,

              ),

            ],

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