import 'package:flutter/material.dart';

import '../core/widgets/glass_card.dart';
import '../models/weekly_weather_model.dart';

class WeeklyCard extends StatelessWidget {
  final WeeklyWeatherModel weather;

  const WeeklyCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: GlassCard(
        child: Row(
          children: [

            CircleAvatar(
              radius: 24,
              backgroundColor: weather.color.withOpacity(.15),
              child: Icon(
                weather.icon,
                color: weather.color,
              ),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    weather.day,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    weather.condition,
                    style: const TextStyle(
                      color: Colors.white60,
                    ),
                  ),

                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Text(
                  "${weather.highTemp}°",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "${weather.lowTemp}°",
                  style: const TextStyle(
                    color: Colors.white60,
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}