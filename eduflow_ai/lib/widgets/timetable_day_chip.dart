import 'package:flutter/material.dart';

class TimetableDayChip extends StatelessWidget {
  final String day;
  final bool selected;
  final VoidCallback onTap;

  const TimetableDayChip({
    super.key,
    required this.day,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          gradient: selected
              ? const LinearGradient(
            colors: [
              Color(0xff4F46E5),
              Color(0xff06B6D4),
            ],
          )
              : null,
          color: selected ? null : Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Text(
          day,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}