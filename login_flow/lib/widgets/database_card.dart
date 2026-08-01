import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class DatabaseCard extends StatelessWidget {
  const DatabaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Row(
            children: [
              Icon(Icons.storage_rounded,
                  color: AppColors.database),
              SizedBox(width: 10),
              Text(
                "4. Database Verification",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              """SELECT *
FROM users
WHERE username='student'
LIMIT 1;""",
              style: TextStyle(
                color: Colors.greenAccent,
                fontFamily: "monospace",
                fontSize: 15,
              ),
            ),
          ),

          const SizedBox(height: 18),

          const LinearProgressIndicator(
            value: 1,
            color: AppColors.success,
          ),

          const SizedBox(height: 12),

          const Text(
            "✔ User Found",
            style: TextStyle(
              color: AppColors.success,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text(
            "✔ Password Hash Matched",
            style: TextStyle(
              color: AppColors.success,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}