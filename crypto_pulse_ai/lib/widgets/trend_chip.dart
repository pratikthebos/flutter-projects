import 'package:flutter/material.dart';

class TrendChip extends StatelessWidget {
  final String text;
  final bool selected;

  const TrendChip({
    super.key,
    required this.text,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Chip(
        label: Text(text),
        backgroundColor:
        selected ? const Color(0xff7C3AED) : Colors.white10,
        labelStyle: TextStyle(
          color: selected ? Colors.white : Colors.white70,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}