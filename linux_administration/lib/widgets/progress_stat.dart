import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressStat extends StatelessWidget {

  final String title;

  final double percent;

  final Color color;

  const ProgressStat({

    super.key,

    required this.title,

    required this.percent,

    required this.color,

  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(24),

      ),

      child: Column(

        children: [

          CircularPercentIndicator(

            radius: 45,

            lineWidth: 8,

            percent: percent,

            animation: true,

            progressColor: color,

            center: Text(
              "${(percent*100).toInt()}%",
            ),

          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

        ],

      ),

    );

  }

}