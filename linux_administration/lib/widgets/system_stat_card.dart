import 'package:flutter/material.dart';

class SystemStatCard extends StatelessWidget {

  final String title;

  final String value;

  final Color color;

  final IconData icon;

  const SystemStatCard({

    super.key,

    required this.title,

    required this.value,

    required this.color,

    required this.icon,

  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(22),

      ),

      child: Column(

        children: [

          Icon(
            icon,
            size: 34,
            color: color,
          ),

          const SizedBox(height: 12),

          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(title),

        ],

      ),

    );

  }

}