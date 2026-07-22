import 'package:flutter/material.dart';

import '../models/history_model.dart';

class ApiCard extends StatelessWidget {
  final HistoryModel history;

  const ApiCard({
    super.key,
    required this.history,
  });

  Color get methodColor {
    switch (history.method) {
      case "GET":
        return const Color(0xff3B82F6);
      case "POST":
        return const Color(0xff10B981);
      case "PUT":
        return const Color(0xffF59E0B);
      case "PATCH":
        return const Color(0xff8B5CF6);
      case "DELETE":
        return const Color(0xffEF4444);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool success = history.statusCode < 400;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [

          /// Left Accent
          Container(
            width: 8,
            height: 110,
            decoration: BoxDecoration(
              color: methodColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(22),
                bottomLeft: Radius.circular(22),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: methodColor.withOpacity(.12),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          history.method,
                          style: TextStyle(
                            color: methodColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const Spacer(),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: success
                              ? Colors.green.withOpacity(.12)
                              : Colors.red.withOpacity(.12),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "${history.statusCode}",
                          style: TextStyle(
                            color: success
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Text(
                    history.endpoint,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Row(
                    children: [

                      Icon(
                        Icons.schedule_rounded,
                        color: Colors.grey.shade600,
                        size: 18,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        history.time,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),

                      const Spacer(),

                      Icon(
                        success
                            ? Icons.check_circle_rounded
                            : Icons.error_rounded,
                        color:
                        success ? Colors.green : Colors.red,
                        size: 22,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}