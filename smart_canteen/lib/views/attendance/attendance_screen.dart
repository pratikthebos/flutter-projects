import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_appbar.dart';
import '../../core/widgets/section_title.dart';
import '../../core/widgets/attendance_card.dart';
import '../../core/widgets/status_chip.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

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
                    title: "Staff Attendance",
                  ),
                ),

              ],
            ),

            const SizedBox(height: 25),

            const AttendanceCard(
              present: 18,
              absent: 2,
              leave: 1,
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Kitchen Staff",
            ),

            const SizedBox(height: 15),

            _staffTile(
              "Rahul Sharma",
              "Head Chef",
              "08:00 AM",
              true,
            ),

            _staffTile(
              "Amit Kumar",
              "Cook",
              "08:05 AM",
              true,
            ),

            _staffTile(
              "Ramesh Patil",
              "Cook",
              "08:02 AM",
              true,
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Serving Staff",
            ),

            const SizedBox(height: 15),

            _staffTile(
              "Suresh",
              "Serving",
              "08:10 AM",
              true,
            ),

            _staffTile(
              "Akash",
              "Serving",
              "--",
              false,
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Housekeeping",
            ),

            const SizedBox(height: 15),

            _staffTile(
              "Meena",
              "Cleaning",
              "07:50 AM",
              true,
            ),

            _staffTile(
              "Sunita",
              "Cleaning",
              "08:01 AM",
              true,
            ),

            const SizedBox(height: 35),

          ],
        ),
      ),
    );
  }

  static Widget _staffTile(
      String name,
      String role,
      String time,
      bool present,
      ) {

    return Container(

      margin: const EdgeInsets.only(bottom: 15),

      padding: const EdgeInsets.all(16),

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

            radius: 28,

            backgroundColor: Colors.orange.shade100,

            child: Text(
              name[0],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

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

                    fontSize:17,

                  ),

                ),

                const SizedBox(height:5),

                Text(
                  role,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),

              ],

            ),

          ),

          Column(

            children: [

              Text(

                time,

                style: const TextStyle(

                  fontWeight: FontWeight.bold,

                ),

              ),

              const SizedBox(height:8),

              StatusChip(

                text: present
                    ? "Present"
                    : "Absent",

                color: present
                    ? Colors.green
                    : Colors.red,

              ),

            ],

          ),

        ],

      ),

    );

  }

}