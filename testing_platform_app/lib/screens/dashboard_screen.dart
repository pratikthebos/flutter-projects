import 'package:flutter/material.dart';

import '../services/fake_data.dart';
import '../utils/app_colors.dart';
import '../widgets/ai_banner.dart';
import '../widgets/animated_background.dart';
import '../widgets/bug_tile.dart';
import '../widgets/glass_card.dart';
import '../widgets/gradient_header.dart';
import '../widgets/metric_card.dart';
import '../widgets/progress_ring.dart';
import 'bug_details_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sprint = FakeData.sprint;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AnimatedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Header
                Row(
                  children: [
                    const Expanded(
                      child: GradientHeader(
                        title: "Agentic QA Platform",
                        subtitle: "Autonomous AI Testing Platform",
                      ),
                    ),

                    GlassCard(
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 28),

                /// Sprint Card
                GlassCard(
                  child: Row(
                    children: [
                      ProgressRing(
                        progress: sprint.progress,
                      ),

                      const SizedBox(width: 25),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            Text(
                              sprint.sprintName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              "Current Sprint Progress",
                              style: TextStyle(
                                color: Colors.white60,
                              ),
                            ),

                            const SizedBox(height: 20),

                            Row(
                              children: [

                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 18,
                                ),

                                const SizedBox(width: 6),

                                Text(
                                  "${sprint.completedTasks} Completed",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            Row(
                              children: [

                                const Icon(
                                  Icons.schedule,
                                  color: Colors.orange,
                                  size: 18,
                                ),

                                const SizedBox(width: 6),

                                Text(
                                  "${sprint.pendingTasks} Pending",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// Metrics
                GridView.count(
                  crossAxisCount: 2,
                  physics:
                  const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: .70,
                  children: [

                    MetricCard(
                      title: "Open Bugs",
                      value: "${FakeData.bugs.length}",
                      icon: Icons.bug_report,
                      color: AppColors.danger,
                    ),

                    MetricCard(
                      title: "Test Cases",
                      value: "${sprint.testCases}",
                      icon: Icons.fact_check,
                      color: AppColors.success,
                    ),

                    MetricCard(
                      title: "AI Risk",
                      value: "91%",
                      icon: Icons.auto_awesome,
                      color: AppColors.secondary,
                    ),

                    MetricCard(
                      title: "Developers",
                      value: "18",
                      icon: Icons.groups,
                      color: AppColors.primary,
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                const AIBanner(
                  message:
                  "Agentic AI predicts two production blockers. Review critical issues before deployment.",
                ),

                const SizedBox(height: 28),

                const Text(
                  "Recent Issues",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 18),

                ...FakeData.bugs.map(
                      (bug) => BugTile(
                    bug: bug,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              BugDetailsScreen(bug: bug),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}