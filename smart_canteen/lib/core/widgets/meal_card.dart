import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class MealCard extends StatelessWidget {

  final String meal;

  final List<String> items;

  final IconData icon;

  final LinearGradient gradient;

  const MealCard({
    super.key,
    required this.meal,
    required this.items,
    required this.icon,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.only(bottom: 18),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(22),

        boxShadow: const [

          BoxShadow(

            color: AppColors.shadow,

            blurRadius: 10,

            offset: Offset(0,5),

          )

        ],

      ),

      child: Row(

        children: [

          Container(

            width: 65,

            height: 65,

            decoration: BoxDecoration(

              gradient: gradient,

              borderRadius: BorderRadius.circular(18),

            ),

            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),

          ),

          const SizedBox(width:20),

          Expanded(

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(

                  meal,

                  style: const TextStyle(

                    fontWeight: FontWeight.bold,

                    fontSize:20,

                  ),

                ),

                const SizedBox(height:8),

                Text(

                  items.join(", "),

                  style: const TextStyle(

                    color: AppColors.textSecondary,

                  ),

                ),

              ],

            ),

          ),

        ],

      ),

    );

  }

}