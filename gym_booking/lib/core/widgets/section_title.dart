import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? action;
  final VoidCallback? onTap;

  const SectionTitle({
    super.key,
    required this.title,
    this.action,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        if (action != null)
          GestureDetector(
            onTap: onTap,
            child: Text(
              action!,
              style: const TextStyle(
                color: Color(0xff2563EB),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}