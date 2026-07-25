import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LectureCard extends StatelessWidget {
  final String subject;
  final String teacher;
  final String time;
  final Color color;

  const LectureCard({
    super.key,
    required this.subject,
    required this.teacher,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [

          Container(
            width: 6,
            height: 90,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [

                    Expanded(
                      child: Text(
                        subject,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: color.withOpacity(.12),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "LIVE",
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [

                    Icon(
                      Icons.person,
                      color: Colors.grey.shade600,
                      size: 18,
                    ),

                    const SizedBox(width: 6),

                    Text(
                      teacher,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  children: [

                    Icon(
                      Icons.access_time_filled,
                      color: color,
                      size: 18,
                    ),

                    const SizedBox(width: 6),

                    Text(
                      time,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [

                    Icon(
                      Icons.location_on,
                      color: Colors.grey.shade500,
                      size: 18,
                    ),

                    const SizedBox(width: 6),

                    Text(
                      "Room 205",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),

          const SizedBox(width: 15),

          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(.10),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              Icons.menu_book_rounded,
              color: color,
              size: 30,
            ),
          ),

        ],
      ),
    )
        .animate()
        .fade(duration: 500.ms)
        .slideX(begin: .2);
  }
}