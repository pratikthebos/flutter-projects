import 'package:flutter/material.dart';

class ForecastChip extends StatelessWidget {
  final String text;
  final bool selected;

  const ForecastChip({
    super.key,
    required this.text,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: selected
            ? const LinearGradient(
          colors: [
            Color(0xff7C3AED),
            Color(0xff62D8FF),
          ],
        )
            : null,
        color: selected ? null : Colors.white10,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.white70,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}