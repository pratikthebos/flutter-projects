import 'package:flutter/material.dart';

class WeeklyWeatherModel {
  final String day;
  final String condition;
  final int highTemp;
  final int lowTemp;
  final IconData icon;
  final Color color;

  const WeeklyWeatherModel({
    required this.day,
    required this.condition,
    required this.highTemp,
    required this.lowTemp,
    required this.icon,
    required this.color,
  });
}