import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class StatusChip extends StatelessWidget {

  final String text;

  final Color color;

  const StatusChip({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      decoration: BoxDecoration(

        color: color.withOpacity(.12),

        borderRadius: BorderRadius.circular(30),

      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 6),

          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}