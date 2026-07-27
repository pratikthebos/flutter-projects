import 'package:flutter/material.dart';

class WeatherModel {
  final String city;
  final String condition;
  final int temperature;
  final int feelsLike;
  final int humidity;
  final int windSpeed;
  final int uvIndex;
  final int airQuality;
  final String sunrise;
  final String sunset;
  final IconData icon;
  final Color color;

  const WeatherModel({
    required this.city,
    required this.condition,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.uvIndex,
    required this.airQuality,
    required this.sunrise,
    required this.sunset,
    required this.icon,
    required this.color,
  });
}