import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../utils/app_colors.dart';

class CircularChart extends StatelessWidget {
  const CircularChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        children: [
          const Text(
            "Activity Statistics",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [

                PieChart(
                  PieChartData(
                    centerSpaceRadius: 58,

                    sectionsSpace: 6,

                    sections: [

                      PieChartSectionData(
                        value: 42,
                        color: AppColors.progressBlue,
                        radius: 32,
                        title: "42%",
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      PieChartSectionData(
                        value: 33,
                        color: AppColors.progressCyan,
                        radius: 32,
                        title: "33%",
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      PieChartSectionData(
                        value: 25,
                        color: AppColors.progressPink,
                        radius: 32,
                        title: "25%",
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    const Text(
                      "Today's",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "100%",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              _legend(
                AppColors.progressBlue,
                "Running",
              ),

              _legend(
                AppColors.progressCyan,
                "Cycling",
              ),

              _legend(
                AppColors.progressPink,
                "Swimming",
              ),
            ],
          ),
        ],
      ),
    )
        .animate()
        .fade(duration: 600.ms)
        .scale(
      begin: const Offset(.9, .9),
      end: const Offset(1, 1),
    );
  }

  Widget _legend(
      Color color,
      String text,
      ) {
    return Row(
      children: [

        Container(
          width: 12,
          height: 12,

          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 6),

        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}