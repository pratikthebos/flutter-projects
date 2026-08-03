import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class HealthCard extends StatelessWidget {

  final String title;
  final int value;

  const HealthCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(

        color: AppColors.card,

        borderRadius: BorderRadius.circular(25),

        border: Border.all(
          color: Colors.cyanAccent.withOpacity(.25),
        ),

      ),

      child: Column(

        children: [

          SizedBox(

            height: 130,
            width: 130,

            child: Stack(

              fit: StackFit.expand,

              children: [

                CircularProgressIndicator(

                  value: value / 100,

                  strokeWidth: 10,

                  color: Colors.cyanAccent,

                  backgroundColor: Colors.white12,

                ),

                Center(

                  child: Text(

                    "$value%",

                    style: const TextStyle(

                      color: Colors.white,

                      fontSize: 26,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                ),

              ],

            ),

          ),

          const SizedBox(height: 20),

          Text(

            title,

            style: const TextStyle(

              color: Colors.white70,

              fontSize: 18,

            ),

          ),

        ],

      ),

    );

  }

}