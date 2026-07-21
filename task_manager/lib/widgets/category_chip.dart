import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CategoryChip extends StatelessWidget {
  final String title;

  const CategoryChip({
    super.key,
    required this.title,
  });

  // Beautiful gradient for each category
  List<Color> get gradient {
    switch (title.toLowerCase()) {
      case "design":
        return const [
          Color(0xff7C3AED),
          Color(0xffA78BFA),
        ];

      case "development":
        return const [
          Color(0xff2563EB),
          Color(0xff60A5FA),
        ];

      case "testing":
        return const [
          Color(0xff10B981),
          Color(0xff34D399),
        ];

      case "meeting":
        return const [
          Color(0xffF97316),
          Color(0xffFB923C),
        ];

      case "release":
        return const [
          Color(0xff0891B2),
          Color(0xff06B6D4),
        ];

      default:
        return const [
          Color(0xff6366F1),
          Color(0xff818CF8),
        ];
    }
  }

  IconData get icon {
    switch (title.toLowerCase()) {
      case "design":
        return Icons.palette_rounded;

      case "development":
        return Icons.code_rounded;

      case "testing":
        return Icons.bug_report_rounded;

      case "meeting":
        return Icons.groups_rounded;

      case "release":
        return Icons.rocket_launch_rounded;

      default:
        return Icons.category_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),

        boxShadow: [
          BoxShadow(
            color: gradient.first.withOpacity(.35),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.20),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 18,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 12),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              letterSpacing: .3,
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 500.ms)
        .slideY(begin: .2)
        .scale(
      begin: const Offset(.9, .9),
      curve: Curves.easeOutBack,
    );
  }
}