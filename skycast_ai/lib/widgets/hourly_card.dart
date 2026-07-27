import 'package:flutter/material.dart';

import '../core/widgets/glass_card.dart';
import '../models/hourly_weather_model.dart';

class HourlyCard extends StatelessWidget {
  final HourlyWeatherModel weather;

  const HourlyCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(right: 14),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              weather.time,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),

            Icon(
              weather.icon,
              color: weather.color,
              size: 28,
            ),

            Text(
              "${weather.temperature}°",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}