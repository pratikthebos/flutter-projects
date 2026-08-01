import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {

  final IconData icon;

  final String title;

  final String value;

  final Color color;

  const DashboardCard({

    super.key,

    required this.icon,

    required this.title,

    required this.value,

    required this.color,

  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(24),

        boxShadow: [

          BoxShadow(

            color: Colors.grey.withOpacity(.12),

            blurRadius: 12,

            offset: const Offset(0,4),

          )

        ],

      ),

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          CircleAvatar(

            radius: 26,

            backgroundColor: color.withOpacity(.12),

            child: Icon(

              icon,

              color: color,

              size: 28,

            ),

          ),

          const SizedBox(height:15),

          Text(

            value,

            style: TextStyle(

              color: color,

              fontWeight: FontWeight.bold,

              fontSize:18,

            ),

          ),

          const SizedBox(height:5),

          Text(

            title,

            style: const TextStyle(

              color: Colors.grey,

            ),

          ),

        ],

      ),

    );

  }

}