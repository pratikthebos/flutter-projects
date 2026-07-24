import 'package:flutter/material.dart';

import '../models/trainer_model.dart';

class TrainerCard extends StatelessWidget {
  final TrainerModel trainer;

  const TrainerCard({
    super.key,
    required this.trainer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        children: [

          const CircleAvatar(
            radius: 32,
            backgroundColor: Color(0xff2563EB),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  trainer.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  trainer.speciality,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [

                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),

                    const SizedBox(width: 4),

                    Text("${trainer.rating}")
                  ],
                )
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),

            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(15),
            ),

            child: const Text(
              "Available",
            ),
          )
        ],
      ),
    );
  }
}