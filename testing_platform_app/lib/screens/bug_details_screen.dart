import 'package:flutter/material.dart';

import '../models/bug_model.dart';
import '../services/fake_data.dart';
import '../utils/app_colors.dart';
import '../widgets/animated_background.dart';
import '../widgets/glass_card.dart';
import '../widgets/status_chip.dart';
import '../widgets/timeline_widget.dart';

class BugDetailsScreen extends StatelessWidget {
  final BugModel bug;

  const BugDetailsScreen({
    super.key,
    required this.bug,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AnimatedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Header
                Row(
                  children: [

                    GlassCard(
                      padding: const EdgeInsets.all(10),
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 16),

                    const Expanded(
                      child: Text(
                        "AI Bug Analysis",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 35),

                /// AI Score
                Center(
                  child: Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          bug.color,
                          bug.color.withOpacity(.45),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: bug.color.withOpacity(.35),
                          blurRadius: 45,
                        )
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: 145,
                        height: 145,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.liquidGradient,
                          border: Border.all(
                            color: Colors.white.withOpacity(.15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            const Icon(
                              Icons.auto_awesome,
                              color: Colors.white,
                              size: 34,
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "${bug.aiScore}%",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const Text(
                              "AI Confidence",
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                /// Bug Information
                GlassCard(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        bug.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        bug.description,
                        style: const TextStyle(
                          color: Colors.white70,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 22),

                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          StatusChip(text: bug.priority),
                          StatusChip(text: bug.status),
                        ],
                      ),

                      const SizedBox(height: 28),

                      buildInfo(
                        Icons.layers,
                        "Module",
                        bug.module,
                      ),

                      buildInfo(
                        Icons.person,
                        "Assigned",
                        bug.assignedTo,
                      ),

                      buildInfo(
                        Icons.phone_android,
                        "Environment",
                        bug.environment,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                /// AI Suggestions
                GlassCard(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "AI Suggested Fixes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      ...FakeData.aiSuggestions.map(
                            (item) => Padding(
                          padding:
                          const EdgeInsets.only(bottom: 14),
                          child: Row(
                            children: [

                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient:
                                  AppColors.blueGradient,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),

                              const SizedBox(width: 14),

                              Expanded(
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                /// Timeline
                GlassCard(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: const [

                      Text(
                        "Resolution Timeline",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      TimelineWidget(),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfo(
      IconData icon,
      String title,
      String value,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [

          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.blueGradient,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white54,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}