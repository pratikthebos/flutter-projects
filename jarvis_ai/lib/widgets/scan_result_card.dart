import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class ScanResultCard extends StatelessWidget {
  final String module;
  final double progress;

  const ScanResultCard({
    super.key,
    required this.module,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text(
            "Scan Result",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            module,
            style: const TextStyle(
              color: Colors.cyanAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          LinearProgressIndicator(
            value: progress,
            color: Colors.cyanAccent,
            backgroundColor: Colors.white12,
          ),

          const SizedBox(height: 15),

          Text(
            "${(progress * 100).toInt()} %",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),

        ],
      ),
    );
  }
}