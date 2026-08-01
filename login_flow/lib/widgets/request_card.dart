import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.only(bottom: 18),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(24),

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: const [

          Text(
            "1. Validate User Input",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12),

          Text("Username : student"),

          Text("Password : ******"),

          SizedBox(height: 15),

          LinearProgressIndicator(

            value: 1,

            color: AppColors.success,

          ),

          SizedBox(height: 12),

          Text(
            "✔ Validation Successful",
            style: TextStyle(
              color: AppColors.success,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],

      ),

    );

  }

}