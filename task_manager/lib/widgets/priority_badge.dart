import 'package:flutter/material.dart';

class PriorityBadge extends StatelessWidget {
  final String priority;

  const PriorityBadge({
    super.key,
    required this.priority,
  });

  Color get color {
    switch (priority.toLowerCase()) {
      case "high":
        return const Color(0xffEF4444);

      case "medium":
        return const Color(0xffF59E0B);

      default:
        return const Color(0xff10B981);
    }
  }

  IconData get icon {
    switch (priority.toLowerCase()) {
      case "high":
        return Icons.local_fire_department_rounded;

      case "medium":
        return Icons.flash_on_rounded;

      default:
        return Icons.check_circle_rounded;
    }
  }

  String get label => priority.toUpperCase();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color,
            color.withOpacity(.75),
          ],
        ),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.35),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),

          const SizedBox(width: 6),

          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}