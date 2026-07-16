import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_data.dart';
import '../widgets/activity_card.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/progress_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //-------------------------------------------------
              // Header
              //-------------------------------------------------

              Row(
                children: [

                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 32,
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Good Morning 👋",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Pratik",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.notifications_none,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              //-------------------------------------------------
              // Statistics
              //-------------------------------------------------

              Row(
                children: [

                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: ProgressCard(
                        title: "Calories",
                        value: "${AppData.calories}",
                        unit: "kcal",
                        icon: Icons.local_fire_department,
                        color: Colors.orange,
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: ProgressCard(
                        title: "Steps",
                        value: "${AppData.totalSteps}",
                        unit: "",
                        icon: Icons.directions_walk,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: [

                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: ProgressCard(
                        title: "Water",
                        value: "${AppData.water}",
                        unit: "ml",
                        icon: Icons.water_drop,
                        color: Colors.cyan,
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: ProgressCard(
                        title: "Active",
                        value: "${AppData.activeMinutes}",
                        unit: "min",
                        icon: Icons.timer,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              //-------------------------------------------------
              // Today's Activity
              //-------------------------------------------------

              const Text(
                "Today's Activities",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              ...AppData.todayActivities
                  .map((activity) => ActivityCard(activity: activity))
                  .toList(),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),






    );
  }
}