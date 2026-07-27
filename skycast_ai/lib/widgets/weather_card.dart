import 'package:flutter/material.dart';

import '../core/widgets/glass_card.dart';

class WeatherCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const WeatherCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        children: [

          Icon(
            icon,
            color: Colors.amber,
            size: 34,
          ),

          const SizedBox(height: 14),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

        ],
      ),
    );
  }
}