import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class JwtCard extends StatelessWidget {
  const JwtCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.only(bottom: 20),

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(24),

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Row(

            children: [

              Icon(
                Icons.vpn_key_rounded,
                color: AppColors.jwt,
              ),

              SizedBox(width:10),

              Text(
                "5. JWT Token Generated",
                style: TextStyle(
                  fontSize:22,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],

          ),

          const SizedBox(height:20),

          Container(

            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(

              color: Colors.orange.shade50,

              borderRadius: BorderRadius.circular(16),

            ),

            child: const Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text("Header"),

                Text("HS256"),

                SizedBox(height:8),

                Text("Payload"),

                Text("{ id:101, role:'Developer' }"),

                SizedBox(height:8),

                Text("Signature"),

                Text("8sjh823jkh823..."),

              ],

            ),

          ),

          const SizedBox(height:18),

          const Text(
            "✔ JWT Created Successfully",
            style: TextStyle(
              color: AppColors.success,
              fontWeight: FontWeight.bold,
            ),
          )

        ],

      ),

    );

  }

}