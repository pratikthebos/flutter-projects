import 'package:flutter/material.dart';

class ActivityModel {
  final String title;
  final String subtitle;
  final String value;
  final String unit;
  final String time;

  final IconData icon;

  final List<Color> gradient;

  final Color iconBackground;

  final double progress;

  const ActivityModel({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.unit,
    required this.time,
    required this.icon,
    required this.gradient,
    required this.iconBackground,
    required this.progress,
  });
}