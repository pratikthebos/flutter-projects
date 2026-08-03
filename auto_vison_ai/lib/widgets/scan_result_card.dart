import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import 'neon_border.dart';

class ScanResultCard extends StatelessWidget {
  final String part;
  final bool scanning;

  const ScanResultCard({
    super.key,
    required this.part,
    required this.scanning,
  });

  Map<String, dynamic> getData() {
    switch (part) {
      case "Engine":
        return {
          "status": "Healthy",
          "temp": "89°C",
          "health": "98%",
          "extra1": "Oil : Normal",
          "extra2": "RPM : 850",
          "icon": Icons.settings,
        };

      case "Battery":
        return {
          "status": "Excellent",
          "temp": "32°C",
          "health": "97%",
          "extra1": "Voltage : 12.8V",
          "extra2": "Charging : Normal",
          "icon": Icons.battery_charging_full,
        };

      case "Left Door":
      case "Right Door":
        return {
          "status": "Working",
          "temp": "28°C",
          "health": "99%",
          "extra1": "Window : OK",
          "extra2": "Lock : Connected",
          "icon": Icons.sensor_door,
        };

      case "Front Wheel":
      case "Rear Wheel":
        return {
          "status": "Normal",
          "temp": "31°C",
          "health": "95%",
          "extra1": "Pressure : 34 PSI",
          "extra2": "Brake Pad : 91%",
          "icon": Icons.tire_repair,
        };

      case "Headlight":
        return {
          "status": "Perfect",
          "temp": "26°C",
          "health": "100%",
          "extra1": "Brightness : 100%",
          "extra2": "Sensor : Connected",
          "icon": Icons.lightbulb,
        };

      default:
        return {
          "status": "Healthy",
          "temp": "29°C",
          "health": "98%",
          "extra1": "System : Normal",
          "extra2": "AI Scan : Passed",
          "icon": Icons.check_circle,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = getData();

    return NeonBorder(
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(24),
        ),
        child: scanning
            ? Column(
          children: const [
            CircularProgressIndicator(
              color: Colors.cyanAccent,
            ),
            SizedBox(height: 18),
            Text(
              "Scanning Vehicle Part...",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                Icon(
                  data["icon"],
                  color: Colors.cyanAccent,
                  size: 34,
                ),

                const SizedBox(width: 12),

                Text(
                  part,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 25),

            _item(
              "Status",
              data["status"],
              Colors.greenAccent,
            ),

            _item(
              "Temperature",
              data["temp"],
              Colors.orangeAccent,
            ),

            _item(
              "AI Health",
              data["health"],
              Colors.cyanAccent,
            ),

            _item(
              "Diagnostic",
              data["extra1"],
              Colors.white,
            ),

            _item(
              "System",
              data["extra2"],
              Colors.white,
            ),

          ],
        ),
      ),
    );
  }

  Widget _item(
      String title,
      String value,
      Color color,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 15,
              ),
            ),
          ),

          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

        ],
      ),
    );
  }
}