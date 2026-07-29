import 'package:flutter/material.dart';

class CoinModel {
  final String name;
  final String symbol;
  final String price;
  final String change;
  final bool isUp;
  final IconData icon;
  final Color color;

  CoinModel({
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
    required this.isUp,
    required this.icon,
    required this.color,
  });
}