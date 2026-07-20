import 'package:flutter/material.dart';

class BugModel {
  final String id;
  final String title;
  final String description;
  final String module;
  final String priority;
  final String status;
  final String assignedTo;
  final String environment;
  final int aiScore;
  final IconData icon;
  final Color color;

  const BugModel({
    required this.id,
    required this.title,
    required this.description,
    required this.module,
    required this.priority,
    required this.status,
    required this.assignedTo,
    required this.environment,
    required this.aiScore,
    required this.icon,
    required this.color,
  });
}