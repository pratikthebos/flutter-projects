import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/status_chip.dart';

class DashboardCard extends StatelessWidget {

  final IconData icon;

  final String title;

  final String subtitle;

  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(

      borderRadius: BorderRadius.circular(24),

      onTap: onTap,

      child: Container(

        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius: BorderRadius.circular(24),

          boxShadow: [

            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),

          ],

        ),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Row(

              children: [

                Container(

                  width: 52,

                  height: 55,

                  decoration: BoxDecoration(

                    gradient: AppColors.primaryGradient,

                    borderRadius: BorderRadius.circular(16),

                  ),

                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 28,
                  ),

                ),

                const Spacer(),

                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: AppColors.textSecondary,
                ),

              ],

            ),

            const SizedBox(height: 18),

            Text(

              title,

              maxLines: 2,

              style: const TextStyle(

                fontSize: 18,

                fontWeight: FontWeight.bold,

                color: AppColors.textPrimary,

              ),

            ),

            const SizedBox(height: 8),

            Text(

              subtitle,

              maxLines: 2,

              style: const TextStyle(

                color: AppColors.textSecondary,

                fontSize: 13,

              ),

            ),

            const Spacer(),

            const StatusChip(

              text: "Healthy",

              color: AppColors.success,

            ),

          ],

        ),

      ),

    );
  }
}