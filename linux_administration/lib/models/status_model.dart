import 'package:flutter/material.dart';

class StatusModel {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  StatusModel({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });
}