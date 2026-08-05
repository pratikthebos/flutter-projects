import 'package:flutter/material.dart';

class GlassCardModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradient;

  const GlassCardModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
  });
}