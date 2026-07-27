import 'package:flutter/material.dart';

class AnalyticsViewModel extends ChangeNotifier {
  final List<double> temperature = [
    28,
    29,
    31,
    32,
    30,
    29,
    27,
  ];

  final List<double> humidity = [
    70,
    74,
    79,
    82,
    77,
    73,
    69,
  ];

  final List<double> rainfall = [
    10,
    25,
    15,
    40,
    22,
    12,
    18,
  ];

  final List<double> wind = [
    10,
    14,
    18,
    15,
    20,
    16,
    12,
  ];
}