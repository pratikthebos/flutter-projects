import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ChartCard extends StatelessWidget {

  final String title;

  final Widget child;

  const ChartCard({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(22),

        boxShadow: const [

          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: Offset(0,5),
          )

        ],

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(

            title,

            style: const TextStyle(

              fontSize: 18,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height:20),

          child,

        ],

      ),

    );

  }

}