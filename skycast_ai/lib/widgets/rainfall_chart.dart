import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RainfallChart extends StatelessWidget {
  final List<double> data;

  const RainfallChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff1B1630),
        borderRadius: BorderRadius.circular(28),
      ),
      child: BarChart(
        BarChartData(
          maxY: 50,

          alignment: BarChartAlignment.spaceAround,

          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: Colors.white12,
            ),
          ),

          gridData: FlGridData(
            show: true,
            horizontalInterval: 10,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.white10,
                strokeWidth: 1,
              );
            },
          ),

          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 38,
                interval: 10,
                getTitlesWidget: (value, meta) {
                  return Text(
                    "${value.toInt()}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                    ),
                  );
                },
              ),
            ),

            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const days = [
                    "Mon",
                    "Tue",
                    "Wed",
                    "Thu",
                    "Fri",
                    "Sat",
                    "Sun",
                  ];

                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      days[value.toInt()],
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          barGroups: List.generate(
            data.length,
                (index) => BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: data[index],
                  width: 18,
                  borderRadius: BorderRadius.circular(8),

                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xff00E5FF),
                      Color(0xff2196F3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}