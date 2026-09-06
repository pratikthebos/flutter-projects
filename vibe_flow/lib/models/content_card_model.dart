import 'package:flutter/material.dart';

class ContentCardModel {
  final String title;
  final String subtitle;
  final String image;
  final String category;
  final IconData icon;
  final Color accent;
  final String? value;
  final String? label;

  const ContentCardModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.category,
    required this.icon,
    required this.accent,
    this.value,
    this.label,
  });
}