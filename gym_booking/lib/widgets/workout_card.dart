import 'package:flutter/material.dart';

import '../models/workout_model.dart';

class WorkoutCard extends StatelessWidget {

  final WorkoutModel workout;

  const WorkoutCard({
    super.key,
    required this.workout,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(22),
      ),

      child: Row(

        children: [

          CircleAvatar(
            backgroundColor:
            workout.completed ? Colors.green : Colors.orange,

            child: Icon(

              workout.completed
                  ? Icons.check
                  : Icons.fitness_center,

              color: Colors.white,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  workout.exercise,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "${workout.sets} Sets • ${workout.reps} Reps",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),

          workout.completed
              ? const Icon(
            Icons.check_circle,
            color: Colors.green,
          )
              : const Icon(
            Icons.arrow_forward_ios,
            size: 18,
          )
        ],
      ),
    );
  }
}