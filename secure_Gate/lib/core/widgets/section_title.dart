import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? action;

  const SectionTitle({
    super.key,
    required this.title,
    this.action,
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
          Text(
            action!,
            style: const TextStyle(
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }
}