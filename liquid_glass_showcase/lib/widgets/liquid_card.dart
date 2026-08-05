import 'package:flutter/material.dart';

import 'glass_card.dart';

class LiquidCard extends StatefulWidget {

  final String title;
  final IconData icon;

  const LiquidCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  State<LiquidCard> createState() =>
      _LiquidCardState();
}

class _LiquidCardState extends State<LiquidCard>
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

        return Transform.translate(

          offset: Offset(
            0,
            controller.value * 10,
          ),

          child: GlassCard(

            child: Column(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                Icon(
                  widget.icon,
                  size: 70,
                  color: Colors.white,
                ),

                const SizedBox(height: 20),

                Text(

                  widget.title,

                  style: const TextStyle(

                    color: Colors.white,

                    fontSize: 22,

                    fontWeight: FontWeight.bold,

                  ),

                ),

              ],

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