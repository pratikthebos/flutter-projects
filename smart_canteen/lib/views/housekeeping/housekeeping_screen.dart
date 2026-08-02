import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_appbar.dart';
import '../../core/widgets/section_title.dart';
import '../../core/widgets/status_chip.dart';

class HousekeepingScreen extends StatelessWidget {
  const HousekeepingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),

          children: [

            Row(
              children: [

                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),

                const Expanded(
                  child: CustomAppBar(
                    title: "Housekeeping",
                  ),
                ),

              ],
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: AppColors.greenGradient,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Today's Cleaning Progress",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    "85% Completed",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),

                  SizedBox(height: 8),

                  LinearProgressIndicator(
                    value: .85,
                    backgroundColor: Colors.white30,
                    color: Colors.white,
                  ),

                ],
              ),
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Cleaning Checklist",
            ),

            const SizedBox(height: 18),

            _tile(
              "Kitchen Floor",
              "Completed",
              "08:15 AM",
              true,
            ),

            _tile(
              "Dining Hall",
              "Completed",
              "08:40 AM",
              true,
            ),

            _tile(
              "Wash Basin",
              "Completed",
              "09:10 AM",
              true,
            ),

            _tile(
              "Kitchen Equipment",
              "Completed",
              "09:45 AM",
              true,
            ),

            _tile(
              "Utensils Cleaning",
              "Completed",
              "10:20 AM",
              true,
            ),

            _tile(
              "Waste Disposal",
              "Pending",
              "--",
              false,
            ),

            _tile(
              "Dining Tables",
              "Pending",
              "--",
              false,
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Assigned Staff",
            ),

            const SizedBox(height: 15),

            _staff(
              "Meena Patil",
              "Kitchen Area",
            ),

            _staff(
              "Sunita",
              "Dining Hall",
            ),

            _staff(
              "Rahul",
              "Waste Collection",
            ),

            const SizedBox(height: 35),

          ],
        ),
      ),
    );
  }

  static Widget _tile(
      String title,
      String status,
      String time,
      bool completed,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
            offset: Offset(0,5),
          )
        ],
      ),

      child: Row(
        children: [

          CircleAvatar(
            radius: 26,
            backgroundColor: completed
                ? Colors.green.shade100
                : Colors.orange.shade100,

            child: Icon(
              completed
                  ? Icons.check
                  : Icons.pending_actions,

              color: completed
                  ? Colors.green
                  : Colors.orange,
            ),
          ),

          const SizedBox(width:18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:17,
                  ),
                ),

                const SizedBox(height:5),

                Text(
                  "Completed Time : $time",
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),

              ],
            ),
          ),

          StatusChip(
            text: status,
            color: completed
                ? Colors.green
                : Colors.orange,
          ),

        ],
      ),
    );
  }

  static Widget _staff(
      String name,
      String area,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
          )
        ],
      ),

      child: Row(
        children: [

          CircleAvatar(
            backgroundColor: Colors.green.shade100,
            child: Text(name[0]),
          ),

          const SizedBox(width:16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  area,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),

              ],
            ),
          ),

          const Icon(
            Icons.verified,
            color: Colors.green,
          ),

        ],
      ),
    );
  }
}