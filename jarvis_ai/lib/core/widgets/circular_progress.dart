import 'package:flutter/material.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularProgressWidget extends StatelessWidget {
  final double value;
  final String title;

  const CircularProgressWidget({
    super.key,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 55,
      lineWidth: 8,
      animation: true,
      percent: value,
      progressColor: Colors.cyanAccent,
      backgroundColor: Colors.white12,
      center: Text(
        "${(value * 100).toInt()}%",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}