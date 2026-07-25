import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff4F46E5),
            Color(0xff06B6D4),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff4F46E5).withOpacity(.35),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [

          Row(
            children: [

              const CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 34,
                  color: Color(0xff4F46E5),
                ),
              ),

              const SizedBox(width: 15),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Tarkesh Gurav",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      "B.Tech • IT • Semester 8",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),

                  ],
                ),
              ),

              CircularPercentIndicator(
                radius: 45,
                lineWidth: 8,
                animation: true,
                animationDuration: 1800,
                percent: .92,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.white,
                backgroundColor: Colors.white24,
                center: const Text(
                  "92%",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            ],
          ),

          const SizedBox(height: 25),

          Row(
            children: const [

              Expanded(
                child: _InfoTile(
                  title: "Present",
                  value: "118",
                  icon: Icons.check_circle,
                ),
              ),

              SizedBox(width: 12),

              Expanded(
                child: _InfoTile(
                  title: "Absent",
                  value: "10",
                  icon: Icons.cancel,
                ),
              ),

              SizedBox(width: 12),

              Expanded(
                child: _InfoTile(
                  title: "Total",
                  value: "128",
                  icon: Icons.school,
                ),
              ),

            ],
          ),

          const SizedBox(height: 22),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.15),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [

                Icon(
                  Icons.emoji_events,
                  color: Colors.amber,
                ),

                SizedBox(width: 12),

                Expanded(
                  child: Text(
                    "Excellent! Your attendance is above the required 75%. Keep it up!",
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
    ).animate().fade().slideY(begin: .2);
  }
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _InfoTile({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.15),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [

          Icon(
            icon,
            color: Colors.white,
          ),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),

        ],
      ),
    );
  }
}