import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../viewmodels/home_view_model.dart';
import '../../viewmodels/task_details_view_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/priority_badge.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final detailVM = context.watch<TaskDetailsViewModel>();
    final homeVM = context.read<HomeViewModel>();

    final task = detailVM.task;

    if (task == null) {
      return const Scaffold(
        body: Center(
          child: Text("No Task Selected"),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          AppStrings.taskDetails,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text,
                      ),
                    ),

                    const SizedBox(height: 15),

                    PriorityBadge(
                      priority: task.priority,
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [

                        const Icon(
                          Icons.category,
                          color: AppColors.primary,
                        ),

                        const SizedBox(width: 10),

                        Text(
                          task.category,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [

                        const Icon(
                          Icons.calendar_today,
                          color: AppColors.primary,
                        ),

                        const SizedBox(width: 10),

                        Text(
                          task.dueDate,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Description",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  task.description,
                  style: const TextStyle(
                    height: 1.6,
                    color: AppColors.subtitle,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Progress",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            LinearProgressIndicator(
              value: task.progress,
              minHeight: 10,
              borderRadius: BorderRadius.circular(20),
              backgroundColor: Colors.grey.shade300,
              valueColor:
              const AlwaysStoppedAnimation(
                AppColors.primary,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "${(task.progress * 100).toInt()}% Completed",
              style: const TextStyle(
                color: AppColors.subtitle,
              ),
            ),

            const SizedBox(height: 40),

            CustomButton(
              text: task.completed
                  ? "Completed"
                  : AppStrings.markComplete,
              onPressed: () {

                if (!task.completed) {
                  homeVM.completeTask(task);
                }

                Navigator.pop(context);
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}