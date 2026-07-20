import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final String text;

  const StatusChip({
    super.key,
    required this.text,
  });

  Color get color {
    switch (text.toLowerCase()) {
      case "critical":
        return const Color(0xffFF4D6D);

      case "high":
        return const Color(0xffFF9800);

      case "medium":
        return const Color(0xffFACC15);

      case "low":
        return const Color(0xff22C55E);

      case "open":
        return const Color(0xff3B82F6);

      case "in progress":
        return const Color(0xff8B5CF6);

      case "resolved":
      case "fixed":
        return const Color(0xff10B981);

      case "closed":
        return const Color(0xff64748B);

      default:
        return Colors.white70;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          colors: [
            color.withOpacity(.30),
            color.withOpacity(.10),
          ],
        ),
        border: Border.all(
          color: color.withOpacity(.45),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.18),
            blurRadius: 16,
            spreadRadius: 1,
          ),
        ],
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
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(.8),
                  blurRadius: 8,
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 12,
              letterSpacing: .3,
            ),
          ),
        ],
      ),
    );
  }
}