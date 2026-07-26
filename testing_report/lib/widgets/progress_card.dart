import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ProgressCard extends StatelessWidget {
  final int total;
  final int passed;
  final int failed;
  final int notTested;

  const ProgressCard({
    super.key,
    required this.total,
    required this.passed,
    required this.failed,
    required this.notTested,
  });

  @override
  Widget build(BuildContext context) {
    final double progress =
    total == 0 ? 0 : (passed + failed) / total;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [

          /// Progress Circle
          SizedBox(
            width: 90,
            height: 90,
            child: Stack(
              alignment: Alignment.center,
              children: [

                SizedBox(
                  width: 90,
                  height: 90,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 8,
                    backgroundColor: Colors.grey.shade300,
                    color: AppColors.primary,
                  ),
                ),

                Text(
                  "${(progress * 100).toInt()}%",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 25),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  "Today's Progress",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                _item(
                  "Passed",
                  passed.toString(),
                  Colors.green,
                ),

                const SizedBox(height: 8),

                _item(
                  "Failed",
                  failed.toString(),
                  Colors.red,
                ),

                const SizedBox(height: 8),

                _item(
                  "Not Tested",
                  notTested.toString(),
                  Colors.orange,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _item(
      String title,
      String value,
      Color color,
      ) {
    return Row(
      children: [

        CircleAvatar(
          radius: 6,
          backgroundColor: color,
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Text(title),
        ),

        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}