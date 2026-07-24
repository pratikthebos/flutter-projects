import 'package:flutter/material.dart';

class AiBookingCard extends StatelessWidget {
  const AiBookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xff2563EB),
            Color(0xff06B6D4),
            Color(0xff8B5CF6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(.25),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: const [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white24,
                child: Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  "AI Workout Recommendation",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "Our AI analyzed your recovery, workout history and gym crowd to recommend the best workout slot.",
            style: TextStyle(
              color: Colors.white70,
              height: 1.5,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 25),

          Row(
            children: const [

              Expanded(
                child: _StatItem(
                  icon: Icons.schedule,
                  title: "Best Time",
                  value: "7:00 PM",
                ),
              ),

              Expanded(
                child: _StatItem(
                  icon: Icons.favorite,
                  title: "Recovery",
                  value: "92%",
                ),
              ),

            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: const [

              Expanded(
                child: _StatItem(
                  icon: Icons.groups,
                  title: "Crowd",
                  value: "Low",
                ),
              ),

              Expanded(
                child: _StatItem(
                  icon: Icons.local_fire_department,
                  title: "Calories",
                  value: "640 kcal",
                ),
              ),

            ],
          ),

          const SizedBox(height: 25),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.18),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: const [

                Icon(
                  Icons.tips_and_updates,
                  color: Colors.amber,
                ),

                SizedBox(width: 12),

                Expanded(
                  child: Text(
                    "AI predicts 18% better performance if you train between 6:30 PM and 7:30 PM today.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _StatItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.15),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [

          Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}