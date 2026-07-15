import 'package:flutter/material.dart';

class SmartCardModel {
  final String title;
  final String value;
  final String unit;
  final String subtitle;

  final IconData icon;

  final List<Color> gradient;

  final Color glowColor;

  final Color iconColor;

  final double progress;

  const SmartCardModel({
    required this.title,
    required this.value,
    required this.unit,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    required this.glowColor,
    required this.iconColor,
    required this.progress,
  });
}