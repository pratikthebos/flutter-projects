import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_data.dart';
import '../widgets/activity_card.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          "Today's Activity",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [

          //----------------------------------
          // Date Card
          //----------------------------------

          Container(
            padding: const EdgeInsets.all(22),

            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xff4C5CFF),
                  Color(0xff7A87FF),
                ],
              ),

              borderRadius: BorderRadius.circular(26),
            ),

            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Today's Schedule",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "Tuesday, July 15",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                Row(
                  children: [

                    Icon(
                      Icons.flag,
                      color: Colors.white,
                    ),

                    SizedBox(width: 10),

                    Text(
                      "5 Activities Planned",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          //----------------------------------
          // Timeline
          //----------------------------------

          ...AppData.todayActivities.map(
                (activity) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //----------------------------------
                  // Timeline Line
                  //----------------------------------

                  Column(
                    children: [

                      Container(
                        width: 18,
                        height: 18,

                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),

                      Container(
                        width: 3,
                        height: 260,
                        color: Colors.grey.shade300,
                      ),
                    ],
                  ),

                  const SizedBox(width: 20),

                  //----------------------------------
                  // Activity Card
                  //----------------------------------

                  Expanded(
                    child: ActivityCard(
                      activity: activity,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}