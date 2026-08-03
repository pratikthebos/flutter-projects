import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class VehicleInfoCard extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;

  const VehicleInfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(

      child: Container(

        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(

          color: AppColors.card,

          borderRadius: BorderRadius.circular(22),

          border: Border.all(
            color: Colors.cyanAccent.withOpacity(.25),
          ),

        ),

        child: Column(

          children: [

            Icon(
              icon,
              size: 34,
              color: Colors.cyanAccent,
            ),

            const SizedBox(height: 15),

            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
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

      ),

    );

  }

}