import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/task_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../viewmodels/home_view_model.dart';
import '../../viewmodels/task_details_view_model.dart';
import '../../widgets/category_chip.dart';
import '../../widgets/progress_header.dart';
import '../../widgets/section_title.dart';
import '../../widgets/summary_card.dart';
import '../../widgets/task_card.dart';
import '../details/task_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: AppColors.background,

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add,color: Colors.white),
        onPressed: () {},
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                AppStrings.welcome,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                AppStrings.subtitle,
                style: TextStyle(
                  color: AppColors.subtitle,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 28),

              ProgressHeader(
                progress: vm.completedTasks / vm.totalTasks,
              ),

              const SizedBox(height: 28),

              Row(
                children: [

                  SummaryCard(
                    title: "Open Tasks",
                    value: vm.pendingTasks.toString(),
                    icon: Icons.pending_actions,
                    color: const Color(0xffEF4444),
                  ),

                  const SizedBox(width: 14),

                  SummaryCard(
                    title: "Completed",
                    value: vm.completedTasks.toString(),
                    icon: Icons.check_circle,
                    color: const Color(0xff10B981),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Categories",
              ),

              const SizedBox(height: 14),

              Wrap(
                spacing: 14,
                runSpacing: 14,
                children: const [

                  CategoryChip(title: "Design"),

                  CategoryChip(title: "Development"),

                  CategoryChip(title: "Testing"),

                  CategoryChip(title: "Meeting"),

                  CategoryChip(title: "Release"),
                ],
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: AppStrings.todayTasks,
              ),

              const SizedBox(height: 15),

              ...vm.tasks.map(
                    (TaskModel task) => TaskCard(
                  task: task,
                  onTap: () {

                    context
                        .read<TaskDetailsViewModel>()
                        .setTask(task);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                        const TaskDetailsScreen(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}