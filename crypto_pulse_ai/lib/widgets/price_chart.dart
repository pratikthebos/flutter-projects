import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PriceChart extends StatefulWidget {
  const PriceChart({super.key});

  @override
  State<PriceChart> createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  int touchedIndex = -1;

  final List<FlSpot> spots = const [
    FlSpot(0, 3),
    FlSpot(1, 3.4),
    FlSpot(2, 3.2),
    FlSpot(3, 4.1),
    FlSpot(4, 3.8),
    FlSpot(5, 5),
    FlSpot(6, 4.7),
    FlSpot(7, 5.8),
    FlSpot(8, 5.4),
    FlSpot(9, 6.4),
    FlSpot(10, 6),
    FlSpot(11, 7),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: LineChart(
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutCubic,
        LineChartData(
          minX: 0,
          maxX: 11,
          minY: 2,
          maxY: 8,

          backgroundColor: Colors.transparent,

          borderData: FlBorderData(show: false),

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
                reservedSize: 55,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  String text = "";

                  switch (value.toInt()) {
                    case 2:
                      text = "\$64K";
                      break;
                    case 3:
                      text = "\$65K";
                      break;
                    case 4:
                      text = "\$66K";
                      break;
                    case 5:
                      text = "\$67K";
                      break;
                    case 6:
                      text = "\$68K";
                      break;
                    case 7:
                      text = "\$69K";
                      break;
                    case 8:
                      text = "\$70K";
                      break;
                  }

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),

            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                interval: 2,
                getTitlesWidget: (value, meta) {
                  String text = "";

                  switch (value.toInt()) {
                    case 0:
                      text = "09:00";
                      break;
                    case 2:
                      text = "11:00";
                      break;
                    case 4:
                      text = "13:00";
                      break;
                    case 6:
                      text = "15:00";
                      break;
                    case 8:
                      text = "17:00";
                      break;
                    case 10:
                      text = "19:00";
                      break;
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: true,

            horizontalInterval: 1,
            verticalInterval: 1,

            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.white.withOpacity(.08),
                strokeWidth: 1,
              );
            },

            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.white.withOpacity(.05),
                strokeWidth: 1,
              );
            },
          ),

          lineTouchData: LineTouchData(
            enabled: true,
            handleBuiltInTouches: true,

            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (spots) {
                return spots.map((spot) {
                  return LineTooltipItem(
                    "\$${(65000 + spot.y * 800).toStringAsFixed(2)}",
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList();
              },
            ),

            getTouchedSpotIndicator: (barData, indexes) {
              return indexes.map((index) {
                return TouchedSpotIndicatorData(
                  FlLine(
                    color: Colors.greenAccent,
                    strokeWidth: 1,
                    dashArray: [6, 4],
                  ),
                  FlDotData(
                    show: true,
                    getDotPainter: (
                        spot,
                        percent,
                        bar,
                        index,
                        ) {
                      return FlDotCirclePainter(
                        radius: 6,
                        color: Colors.greenAccent,
                        strokeColor: Colors.white,
                        strokeWidth: 2,
                      );
                    },
                  ),
                );
              }).toList();
            },
          ),

          lineBarsData: [
            LineChartBarData(
              spots: spots,

              isCurved: true,

              curveSmoothness: .35,

              color: Colors.greenAccent,

              barWidth: 4,

              isStrokeCapRound: true,

              dotData: const FlDotData(
                show: false,
              ),

              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.greenAccent.withOpacity(.35),
                    Colors.greenAccent.withOpacity(.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}