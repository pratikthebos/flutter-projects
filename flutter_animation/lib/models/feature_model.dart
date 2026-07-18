import 'package:flutter/material.dart';

class FeatureModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradient;
  final String value;

  const FeatureModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    required this.value,
  });
}