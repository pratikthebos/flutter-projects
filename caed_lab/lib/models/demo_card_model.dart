import 'package:flutter/material.dart';

class DemoCardModel {
  final String title;
  final String subtitle;
  final String label;
  final IconData icon;
  final Color primary;
  final Color secondary;

  const DemoCardModel({
    required this.title,
    required this.subtitle,
    required this.label,
    required this.icon,
    required this.primary,
    required this.secondary,
  });

  DemoCardModel copyWith({
    String? title,
    String? subtitle,
  }) {
    return DemoCardModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      label: label,
      icon: icon,
      primary: primary,
      secondary: secondary,
    );
  }
}