import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeworkCard extends StatelessWidget {
  const HomeworkCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: const [

              Icon(
                Icons.assignment_rounded,
                color: Color(0xff4F46E5),
              ),

              SizedBox(width: 10),

              Text(
                "Homework",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),

          const SizedBox(height: 20),

          const _HomeworkTile(
            color: Color(0xff4F46E5),
            subject: "Flutter Development",
            title: "Design Login UI",
            due: "Today • 5 PM",
            completed: false,
          ),

          const SizedBox(height: 15),

          const _HomeworkTile(
            color: Color(0xff06B6D4),
            subject: "Database Management",
            title: "Normalization Assignment",
            due: "Tomorrow",
            completed: false,
          ),

          const SizedBox(height: 15),

          const _HomeworkTile(
            color: Color(0xff22C55E),
            subject: "Artificial Intelligence",
            title: "ML Notes Submission",
            due: "Completed",
            completed: true,
          ),

          const SizedBox(height: 25),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xff4F46E5),
                  Color(0xff06B6D4),
                ],
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [

                Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                ),

                SizedBox(width: 12),

                Expanded(
                  child: Text(
                    "Complete today's assignments to maintain your 15-day study streak 🔥",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    )
        .animate()
        .fade()
        .slideY(begin: .2);
  }
}

class _HomeworkTile extends StatelessWidget {

  final Color color;
  final String subject;
  final String title;
  final String due;
  final bool completed;

  const _HomeworkTile({
    required this.color,
    required this.subject,
    required this.title,
    required this.due,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [

          CircleAvatar(
            backgroundColor: color,
            child: Icon(
              completed
                  ? Icons.check
                  : Icons.book,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  subject,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  due,
                  style: TextStyle(
                    color: completed
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),

              ],
            ),
          ),

          Icon(
            completed
                ? Icons.check_circle
                : Icons.arrow_forward_ios,
            color: completed
                ? Colors.green
                : color,
          )

        ],
      ),
    );
  }
}