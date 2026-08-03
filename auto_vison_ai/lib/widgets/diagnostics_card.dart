import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import 'neon_border.dart';

class DiagnosticsCard extends StatelessWidget {
  final bool scanning;
  final String selectedPart;

  const DiagnosticsCard({
    super.key,
    required this.scanning,
    required this.selectedPart,
  });

  List<String> _logs() {
    if (scanning) {
      return [
        "Initializing AI Core...",
        "Connecting Vehicle ECU...",
        "Reading CAN Bus...",
        "Scanning $selectedPart...",
        "Collecting Sensor Data...",
        "Running AI Analysis...",
      ];
    }

    return [
      "AI Core Connected",
      "CAN Bus Connected",
      "$selectedPart Scan Completed",
      "No Fault Codes Detected",
      "Performance Stable",
      "Vehicle Health : 98%",
    ];
  }

  @override
  Widget build(BuildContext context) {
    final logs = _logs();

    return NeonBorder(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: const [

                Icon(
                  Icons.memory,
                  color: Colors.cyanAccent,
                ),

                SizedBox(width: 10),

                Text(
                  "AI Diagnostic Console",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            ...logs.map(
                  (e) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [

                    Icon(
                      scanning
                          ? Icons.sync
                          : Icons.check_circle,
                      color: scanning
                          ? Colors.orangeAccent
                          : Colors.greenAccent,
                      size: 18,
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        e,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [

                  Icon(
                    scanning
                        ? Icons.autorenew
                        : Icons.verified,
                    color: scanning
                        ? Colors.orangeAccent
                        : Colors.greenAccent,
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      scanning
                          ? "AI Scanner Running..."
                          : "Vehicle Diagnostics Completed Successfully",
                      style: TextStyle(
                        color: scanning
                            ? Colors.orangeAccent
                            : Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}