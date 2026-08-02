import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AttendanceCard extends StatelessWidget {
  final int present;
  final int absent;
  final int leave;

  const AttendanceCard({
    super.key,
    required this.present,
    required this.absent,
    required this.leave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          _item(
            "Present",
            present.toString(),
            Colors.green,
          ),

          _divider(),

          _item(
            "Absent",
            absent.toString(),
            Colors.red,
          ),

          _divider(),

          _item(
            "Leave",
            leave.toString(),
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1,
      height: 50,
      color: Colors.grey.shade300,
    );
  }

  Widget _item(
      String title,
      String value,
      Color color,
      ) {
    return Column(
      children: [

        Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          title,
          style: const TextStyle(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}