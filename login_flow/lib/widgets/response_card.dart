import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class ResponseCard extends StatelessWidget {

  const ResponseCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.only(bottom:20),

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
                Icons.http,
                color: Colors.green,
              ),

              SizedBox(width:10),

              Text(
                "6. HTTP Response",
                style: TextStyle(
                  fontSize:22,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],

          ),

          const SizedBox(height:20),

          Container(

            width: double.infinity,

            padding: const EdgeInsets.all(18),

            decoration: BoxDecoration(

              color: Colors.green.shade50,

              borderRadius: BorderRadius.circular(18),

            ),

            child: const Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  "HTTP 200 OK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize:18,
                  ),
                ),

                SizedBox(height:10),

                Text("Response Time : 128 ms"),

                Text("Content-Type : application/json"),

                Text("Content-Length : 2.4 KB"),

              ],

            ),

          ),

        ],

      ),

    );

  }

}