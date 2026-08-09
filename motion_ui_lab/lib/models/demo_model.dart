import 'package:flutter/material.dart';

class DemoModel {
  final String title;
  final String subtitle;
  final String category;
  final IconData icon;
  final int index;
  final Color color;

  const DemoModel({
    required this.title,
    required this.subtitle,
    required this.category,
    required this.icon,
    required this.index,
    required this.color,
  });
}