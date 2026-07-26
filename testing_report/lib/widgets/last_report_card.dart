import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LastReportCard extends StatelessWidget {
  final String testerName;
  final String date;
  final String platform;
  final String device;
  final String appVersion;

  final int passed;
  final int failed;
  final int notTested;

  final VoidCallback? onTap;

  const LastReportCard({
    super.key,
    required this.testerName,
    required this.date,
    required this.platform,
    required this.device,
    required this.appVersion,
    required this.passed,
    required this.failed,
    required this.notTested,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 10,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: Column(
          children: [

            Row(
              children: [

                const CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColors.primary,
                  child: Icon(
                    Icons.assignment,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Last Report",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        date,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(Icons.arrow_forward_ios),
              ],
            ),

            const SizedBox(height: 20),

            _row(
              Icons.person,
              "Tester",
              testerName,
            ),

            _row(
              Icons.phone_android,
              "Device",
              device,
            ),

            _row(
              Icons.android,
              "Platform",
              platform,
            ),

            _row(
              Icons.system_update,
              "App Version",
              appVersion,
            ),

            const Divider(height: 30),

            Row(
              children: [

                Expanded(
                  child: _status(
                    "Passed",
                    passed.toString(),
                    Colors.green,
                  ),
                ),

                Expanded(
                  child: _status(
                    "Failed",
                    failed.toString(),
                    Colors.red,
                  ),
                ),

                Expanded(
                  child: _status(
                    "Not Tested",
                    notTested.toString(),
                    Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(
      IconData icon,
      String title,
      String value,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [

          Icon(
            icon,
            size: 20,
            color: AppColors.primary,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(title),
          ),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _status(
      String title,
      String value,
      Color color,
      ) {
    return Column(
      children: [

        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}