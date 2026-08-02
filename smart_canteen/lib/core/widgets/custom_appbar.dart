
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Row(

      children: [

        Container(

          width: 55,

          height: 55,

          decoration: BoxDecoration(

            gradient: AppColors.orangeGradient,

            borderRadius: BorderRadius.circular(18),

          ),

          child: const Icon(
            Icons.restaurant,
            color: Colors.white,
          ),

        ),

        const SizedBox(width: 15),

        Expanded(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(

                title,

                style: const TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 22,

                ),

              ),

              const Text(

                "Smart Canteen Management",

                style: TextStyle(

                  color: AppColors.textSecondary,

                ),

              ),

            ],

          ),

        ),

        CircleAvatar(

          radius: 26,

          backgroundColor: Colors.orange.shade50,

          child: const Icon(

            Icons.notifications,

            color: AppColors.primary,

          ),

        ),

      ],

    );

  }

}