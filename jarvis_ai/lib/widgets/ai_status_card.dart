import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class AIStatusCard extends StatefulWidget {
  const AIStatusCard({super.key});

  @override
  State<AIStatusCard> createState() =>
      _AIStatusCardState();
}

class _AIStatusCardState
    extends State<AIStatusCard>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {

    super.initState();

    controller = AnimationController(

      vsync: this,

      duration: const Duration(seconds: 1),

    )..repeat(reverse: true);

  }

  @override
  Widget build(BuildContext context) {

    return FadeTransition(

      opacity: controller,

      child: Container(

        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(

          color: AppColors.card,

          borderRadius: BorderRadius.circular(20),

          border: Border.all(
            color: Colors.greenAccent,
          ),

        ),

        child: const Row(

          children: [

            Icon(
              Icons.memory,
              color: Colors.greenAccent,
            ),

            SizedBox(width: 12),

            Expanded(

              child: Text(

                "JARVIS AI ONLINE",

                style: TextStyle(

                  color: Colors.greenAccent,

                  fontWeight: FontWeight.bold,

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

  @override
  void dispose() {

    controller.dispose();

    super.dispose();

  }

}