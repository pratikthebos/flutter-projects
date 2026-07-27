import 'package:flutter/material.dart';

class HourlyWeatherModel {
  final String time;
  final int temperature;
  final IconData icon;
  final Color color;

  const HourlyWeatherModel({
    required this.time,
    required this.temperature,
    required this.icon,
    required this.color,
  });
}