import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class TodaySummary extends StatelessWidget {
  final String date;
  final int totalMeals;
  final int staff;
  final int inventory;
  final int cleaning;

  const TodaySummary({
    super.key,
    required this.date,
    required this.totalMeals,
    required this.staff,
    required this.inventory,
    required this.cleaning,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: AppColors.orangeGradient,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Today's Summary",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            date,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),

          const SizedBox(height: 22),

          Row(
            children: [

              Expanded(
                child: _item(
                  Icons.restaurant_menu,
                  totalMeals.toString(),
                  "Meals",
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _item(
                  Icons.people_alt,
                  staff.toString(),
                  "Staff",
                ),
              ),

            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [

              Expanded(
                child: _item(
                  Icons.inventory_2,
                  "$inventory%",
                  "Inventory",
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _item(
                  Icons.cleaning_services,
                  "$cleaning%",
                  "Cleaning",
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }

  Widget _item(
      IconData icon,
      String value,
      String title,
      ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.18),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [

          Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

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