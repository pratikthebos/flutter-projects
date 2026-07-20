import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class GradientHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const GradientHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) =>
              AppColors.auroraGradient.createShader(bounds),
          child: const Text(
            "Agentic QA Platform",
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}