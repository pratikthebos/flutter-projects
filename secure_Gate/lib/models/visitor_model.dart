import 'package:flutter/material.dart';

class VisitorModel {
  final String name;
  final String mobile;
  final String flat;
  final String purpose;
  final String time;
  final String status;
  final Color statusColor;
  final IconData icon;

  VisitorModel({
    required this.name,
    required this.mobile,
    required this.flat,
    required this.purpose,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.icon,
  });
}