import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../models/task_model.dart';
import '../utils/app_colors.dart';
import 'priority_badge.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onTap;

  const TaskCard({
    super.key,
    required this.task,
    required this.onTap,
  });

  Color getAccentColor() {
    switch (task.priority.toLowerCase()) {
      case "high":
        return const Color(0xffEF4444);

      case "medium":
        return const Color(0xffF59E0B);

      default:
        return const Color(0xff10B981);
    }
  }

  @override
  Widget build(BuildContext context) {
    final accent = getAccentColor();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 25,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 180,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  bottomLeft: Radius.circular(28),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: accent.withOpacity(.12),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Icon(
                            Icons.task_alt,
                            color: accent,
                          ),
                        ),

                        const Spacer(),

                        PriorityBadge(
                          priority: task.priority,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Text(
                      task.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.text,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      task.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.subtitle,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: accent.withOpacity(.10),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            task.category,
                            style: TextStyle(
                              color: accent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const Spacer(),

                        const Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Colors.grey,
                        ),

                        const SizedBox(width: 6),

                        Text(
                          task.dueDate,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: LinearProgressIndicator(
                        value: task.progress,
                        minHeight: 8,
                        backgroundColor: Colors.grey.shade200,
                        valueColor:
                        AlwaysStoppedAnimation(accent),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${(task.progress * 100).toInt()}%",
                        style: TextStyle(
                          color: accent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
          .animate()
          .fadeIn(duration: 500.ms)
          .slideY(begin: .2)
          .scale(begin: const Offset(.95, .95)),
    );
  }
}