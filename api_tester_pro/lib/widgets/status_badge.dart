import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final int statusCode;

  const StatusBadge({
    super.key,
    required this.statusCode,
  });

  Color get color {
    if (statusCode >= 200 && statusCode < 300) {
      return Colors.green;
    }

    if (statusCode >= 300 && statusCode < 400) {
      return Colors.orange;
    }

    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        "$statusCode",
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}