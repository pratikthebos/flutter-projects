import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.lock,
            color: Colors.white,
          ),
        ),

        const SizedBox(width: 15),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Login Architecture",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 4),

              Text(
                "Authentication Learning",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

            ],
          ),
        ),

        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blue.shade50,
          child: const Icon(
            Icons.person,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}