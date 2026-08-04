import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class DiagnosticsCard extends StatelessWidget {
  final String module;

  const DiagnosticsCard({
    super.key,
    required this.module,
  });

  Widget row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Row(
        children: [

          Text(
            title,
            style: const TextStyle(
              color: Colors.white60,
            ),
          ),

          const Spacer(),

          Text(
            value,
            style: const TextStyle(
              color: Colors.cyanAccent,
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

        borderRadius: BorderRadius.circular(24),

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text(

            "Diagnostics",

            style: TextStyle(

              color: Colors.white,

              fontSize: 22,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 20),

          row("Selected Module", module),

          row("Power", "98 %"),

          row("Temperature", "38 °C"),

          row("Efficiency", "99 %"),

          row("Status", "Operational"),

          row("AI", "JARVIS ONLINE"),

        ],

      ),

    );

  }

}