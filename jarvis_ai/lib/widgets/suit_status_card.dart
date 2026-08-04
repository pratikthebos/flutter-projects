import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class SuitStatusCard extends StatelessWidget {
  final String version;
  final String owner;

  final int energy;
  final int flight;

  const SuitStatusCard({
    super.key,
    required this.version,
    required this.owner,
    required this.energy,
    required this.flight,
  });

  Widget row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),

      child: Row(

        children: [

          Text(
            title,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 15,
            ),
          ),

          const Spacer(),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: AppColors.card,

        borderRadius: BorderRadius.circular(25),

        border: Border.all(
          color: Colors.cyanAccent.withOpacity(.20),
        ),

      ),

      child: Column(

        children: [

          row("Owner", owner),

          row("Version", version),

          row("Energy", "$energy%"),

          row("Flight", "$flight%"),

          row("AI Status", "ONLINE"),

          row("Armor", "Operational"),

        ],

      ),

    );
  }
}