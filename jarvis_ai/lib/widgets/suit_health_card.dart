import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class SuitHealthCard extends StatelessWidget {
  final String title;
  final int value;

  const SuitHealthCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(25),

        border: Border.all(
          color: Colors.cyanAccent.withOpacity(.25),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(.10),
            blurRadius: 25,
          ),
        ],
      ),

      child: Column(
        children: [

          const Icon(
            Icons.health_and_safety,
            color: Colors.greenAccent,
            size: 40,
          ),

          const SizedBox(height: 15),

          Text(
            "$value%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),

        ],
      ),
    );
  }
}