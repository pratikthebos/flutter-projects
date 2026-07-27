import 'package:flutter/material.dart';

class WindCard extends StatelessWidget {
  final double speed;

  const WindCard({
    super.key,
    required this.speed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xff1B1630),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [

          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.withOpacity(.15),
            ),
            child: const Icon(
              Icons.air,
              color: Colors.lightBlue,
              size: 36,
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "${speed.toInt()} km/h",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  "Moderate Wind",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
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