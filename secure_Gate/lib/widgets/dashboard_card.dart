import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_icons.dart';
import '../core/widgets/glass_card.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  AppIcons.shield,
                  color: Colors.white,
                ),
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(.15),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [

                    Icon(
                      Icons.circle,
                      size: 10,
                      color: AppColors.success,
                    ),

                    SizedBox(width: 6),

                    Text(
                      "Gate Open",
                      style: TextStyle(
                        color: AppColors.success,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          const Text(
            "Today's Security",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "85 Entries",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Visitors • Staff • Delivery • Cab",
            style: TextStyle(
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}