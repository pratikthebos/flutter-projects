import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/attendance_card.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/homework_card.dart';
import '../../widgets/lecture_card.dart';
import '../../widgets/quick_action_card.dart';
import '../../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const CustomAppBar(),

              const SizedBox(height: 25),

              const AttendanceCard(),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Today's Lectures",
              ),

              const SizedBox(height: 15),

              const LectureCard(
                subject: "Flutter Development",
                teacher: "Prof. Sharma",
                time: "09:00 AM",
                color: Color(0xff4F46E5),
              ),

              const SizedBox(height: 15),

              const LectureCard(
                subject: "Database Management",
                teacher: "Prof. Joshi",
                time: "11:00 AM",
                color: Color(0xff06B6D4),
              ),

              const SizedBox(height: 15),

              const LectureCard(
                subject: "Artificial Intelligence",
                teacher: "Prof. Patil",
                time: "02:00 PM",
                color: Color(0xff8B5CF6),
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Quick Actions",
              ),

              const SizedBox(height: 20),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: 1.25,
                children: const [

                  QuickActionCard(
                    title: "Timetable",
                    icon: Icons.calendar_month,
                    color: Color(0xff4F46E5),
                  ),

                  QuickActionCard(
                    title: "Notes",
                    icon: Icons.menu_book,
                    color: Color(0xff06B6D4),
                  ),

                  QuickActionCard(
                    title: "Homework",
                    icon: Icons.assignment,
                    color: Color(0xff8B5CF6),
                  ),

                  QuickActionCard(
                    title: "Leaderboard",
                    icon: Icons.emoji_events,
                    color: Color(0xffF59E0B),
                  ),

                ],
              ),

              const SizedBox(height: 30),

              const HomeworkCard(),

            ],
          ),
        ),
      ),
    );
  }
}