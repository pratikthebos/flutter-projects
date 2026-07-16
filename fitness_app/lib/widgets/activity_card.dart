import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../models/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final ActivityModel activity;

  const ActivityCard({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: activity.gradient,
        ),

        boxShadow: [
          BoxShadow(
            color: activity.gradient.first.withOpacity(.35),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(22),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //-------------------------------------------------
            // Header
            //-------------------------------------------------

            Row(
              children: [

                Container(
                  width: 58,
                  height: 58,

                  decoration: BoxDecoration(
                    color: activity.iconBackground,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Icon(
                    activity.icon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                const Spacer(),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.18),
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: Text(
                    activity.time,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            //-------------------------------------------------
            // Title
            //-------------------------------------------------

            Text(
              activity.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              activity.subtitle,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 24),

            //-------------------------------------------------
            // Value
            //-------------------------------------------------

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Text(
                  activity.value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 8),

                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    activity.unit,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            //-------------------------------------------------
            // Progress
            //-------------------------------------------------

            ClipRRect(
              borderRadius: BorderRadius.circular(25),

              child: LinearProgressIndicator(
                value: activity.progress,
                minHeight: 8,

                backgroundColor: Colors.white24,

                valueColor: const AlwaysStoppedAnimation(
                  Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${(activity.progress * 100).toInt()}%",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fade(duration: 500.ms)
        .slideY(
      begin: .25,
      end: 0,
      duration: 500.ms,
    )
        .scale(
      begin: const Offset(.95, .95),
      end: const Offset(1, 1),
    );
  }
}