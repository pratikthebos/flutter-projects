import 'package:flutter/material.dart';

class ModuleModel {
  final String name;
  final IconData icon;
  final int health;
  final String status;
  final String description;

  ModuleModel({
    required this.name,
    required this.icon,
    required this.health,
    required this.status,
    required this.description,
  });
}