import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class ModuleInfoCard extends StatelessWidget {

  final String module;

  const ModuleInfoCard({
    super.key,
    required this.module,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: AppColors.card,

        borderRadius: BorderRadius.circular(24),

        border: Border.all(
          color: Colors.cyanAccent.withOpacity(.25),
        ),

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(

            module,

            style: const TextStyle(

              color: Colors.cyanAccent,

              fontSize: 24,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 18),

          const Text(

            "Status : Operational",

            style: TextStyle(
              color: Colors.white70,
            ),

          ),

          const SizedBox(height: 10),

          const Text(

            "Efficiency : 99%",

            style: TextStyle(
              color: Colors.white70,
            ),

          ),

          const SizedBox(height: 10),

          const Text(

            "Power Usage : Normal",

            style: TextStyle(
              color: Colors.white70,
            ),

          ),

          const SizedBox(height: 10),

          const Text(

            "AI Recommendation",

            style: TextStyle(

              color: Colors.orange,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 6),

          const Text(

            "Module functioning within expected operational limits.",

            style: TextStyle(
              color: Colors.white60,
            ),

          ),

        ],

      ),

    );

  }

}