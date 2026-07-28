import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_icons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Icon(
            AppIcons.appLogo,
            color: Colors.white,
            size: 30,
          ),
        ),

        const SizedBox(width: 16),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "SecureGate",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 4),

              Text(
                "Apartment Security",
                style: TextStyle(
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Icon(
            AppIcons.notification,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}