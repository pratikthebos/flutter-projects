import 'package:flutter/material.dart';

class TimetableCard extends StatelessWidget {
  final Color color;
  final String subject;
  final String teacher;
  final String room;
  final String start;
  final String end;
  final bool live;

  const TimetableCard({
    super.key,
    required this.color,
    required this.subject,
    required this.teacher,
    required this.room,
    required this.start,
    required this.end,
    this.live = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Column(
          children: [

            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),

            Container(
              width: 3,
              height: 140,
              color: color.withOpacity(.3),
            )

          ],
        ),

        const SizedBox(width: 18),

        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [

                    Expanded(
                      child: Text(
                        subject,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),

                    if (live)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          "LIVE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )

                  ],
                ),

                const SizedBox(height: 15),

                Row(
                  children: [

                    Icon(Icons.person,
                        size: 18,
                        color: color),

                    const SizedBox(width: 8),

                    Text(teacher),

                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  children: [

                    Icon(Icons.location_on,
                        size: 18,
                        color: color),

                    const SizedBox(width: 8),

                    Text(room),

                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  children: [

                    Icon(Icons.schedule,
                        size: 18,
                        color: color),

                    const SizedBox(width: 8),

                    Text("$start - $end"),

                  ],
                ),

              ],
            ),
          ),
        ),

      ],
    );
  }
}