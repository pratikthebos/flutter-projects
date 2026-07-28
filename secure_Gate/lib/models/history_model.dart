import 'package:flutter/material.dart';

class HistoryModel {
  final String title;
  final String subtitle;
  final String time;
  final String status;
  final Color statusColor;
  final IconData icon;

  HistoryModel({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.icon,
  });
}