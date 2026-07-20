import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({super.key});

  final List<String> steps = const [
    "Bug Reported",
    "Assigned",
    "Testing",
    "Fixed",
    "Closed",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        steps.length,
            (index) {
          final isLast = index == steps.length - 1;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  if (!isLast)
                    Container(
                      width: 2,
                      height: 40,
                      color: Colors.white24,
                    ),
                ],
              ),

              const SizedBox(width: 16),

              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text(
                  steps[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}