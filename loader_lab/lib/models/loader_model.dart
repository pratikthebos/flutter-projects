import 'package:flutter/material.dart';

class LoaderModel {
  final String title;
  final String description;
  final String category;
  final IconData icon;
  final int index;

  const LoaderModel({
    required this.title,
    required this.description,
    required this.category,
    required this.icon,
    required this.index,
  });
}