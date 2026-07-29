import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VolumeChart extends StatelessWidget {
  const VolumeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceBetween,

          borderData: FlBorderData(show: false),

          gridData: const FlGridData(show: false),

          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),

          barGroups: [
            _bar(0, 8, Colors.greenAccent),
            _bar(1, 5, Colors.redAccent),
            _bar(2, 12, Colors.greenAccent),
            _bar(3, 9, Colors.greenAccent),
            _bar(4, 6, Colors.redAccent),
            _bar(5, 14, Colors.greenAccent),
            _bar(6, 10, Colors.redAccent),
            _bar(7, 13, Colors.greenAccent),
            _bar(8, 7, Colors.redAccent),
            _bar(9, 15, Colors.greenAccent),
            _bar(10, 11, Colors.greenAccent),
            _bar(11, 8, Colors.redAccent),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _bar(
      int x,
      double value,
      Color color,
      ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          width: 6,
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
      ],
    );
  }
}