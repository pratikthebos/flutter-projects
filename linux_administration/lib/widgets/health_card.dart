import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class HealthCard extends StatelessWidget {
  const HealthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: AppColors.successGradient,
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Overall Server Health",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "✔ No Critical Errors Found\n"
                "✔ All Services Running\n"
                "✔ Backup Verified\n"
                "✔ Security Audit Passed\n"
                "✔ Firewall Active",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.8,
            ),
          ),

        ],
      ),
    );
  }
}