import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Student Dashboard"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome 👋",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Admin",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1,
                children: [
                  DashboardCard(
                    icon: Icons.people,
                    title: "Students",
                    value: "450",
                    color: Colors.blue,
                  ),

                  DashboardCard(
                    icon: Icons.school,
                    title: "Courses",
                    value: "18",
                    color: Colors.green,
                  ),

                  DashboardCard(
                    icon: Icons.assignment,
                    title: "Attendance",
                    value: "95%",
                    color: Colors.orange,
                  ),

                  DashboardCard(
                    icon: Icons.notifications,
                    title: "Notices",
                    value: "08",
                    color: Colors.red,
                  ),

                  DashboardCard(
                    icon: Icons.calendar_month,
                    title: "Timetable",
                    value: "Today",
                    color: Colors.purple,
                  ),

                  DashboardCard(
                    icon: Icons.settings,
                    title: "Settings",
                    value: "--",
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}