import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class TokenCard extends StatelessWidget {

  const TokenCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.only(bottom:20),

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(

        gradient: AppColors.successGradient,

        borderRadius: BorderRadius.circular(24),

      ),

      child: const Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Row(

            children: [

              Icon(
                Icons.save,
                color: Colors.white,
              ),

              SizedBox(width:10),

              Text(
                "8. Token Stored",
                style: TextStyle(
                  color: Colors.white,
                  fontSize:22,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],

          ),

          SizedBox(height:18),

          Text(
            "SharedPreferences.save(token)",
            style: TextStyle(
              color: Colors.white,
            ),
          ),

          SizedBox(height:12),

          Text(
            "✔ Authentication Completed",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],

      ),

    );

  }

}