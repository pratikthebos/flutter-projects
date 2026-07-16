import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_data.dart';
import '../widgets/circular_chart.dart';
import '../widgets/weekly_chart.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  Widget _infoCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.12),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            width: 55,
            height: 55,

            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              borderRadius: BorderRadius.circular(16),
            ),

            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          "Statistics",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            //----------------------------------------
            // Circular Chart
            //----------------------------------------

            const CircularChart(),

            const SizedBox(height: 25),

            //----------------------------------------
            // Weekly Chart
            //----------------------------------------

            const WeeklyChart(),

            const SizedBox(height: 25),

            //----------------------------------------
            // Summary Cards
            //----------------------------------------

            _infoCard(
              "Calories Burned",
              "${AppData.calories} kcal",
              Icons.local_fire_department,
              Colors.orange,
            ),

            const SizedBox(height: 15),

            _infoCard(
              "Today's Steps",
              "${AppData.totalSteps}",
              Icons.directions_walk,
              Colors.blue,
            ),

            const SizedBox(height: 15),

            _infoCard(
              "Water Intake",
              "${AppData.water} ml",
              Icons.water_drop,
              Colors.cyan,
            ),

            const SizedBox(height: 15),

            _infoCard(
              "Active Minutes",
              "${AppData.activeMinutes} min",
              Icons.timer,
              Colors.green,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}