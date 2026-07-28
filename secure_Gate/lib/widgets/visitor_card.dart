import 'package:flutter/material.dart';

import '../core/widgets/glass_card.dart';
import '../core/widgets/status_chip.dart';
import '../models/visitor_model.dart';

class VisitorCard extends StatelessWidget {
  final VisitorModel visitor;

  const VisitorCard({
    super.key,
    required this.visitor,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [

          CircleAvatar(
            radius: 26,
            backgroundColor: visitor.statusColor.withOpacity(.15),
            child: Icon(
              visitor.icon,
              color: visitor.statusColor,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  visitor.name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "${visitor.flat} • ${visitor.purpose}",
                  style: const TextStyle(
                    color: Colors.white60,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  visitor.time,
                  style: const TextStyle(
                    color: Colors.white38,
                  ),
                ),
              ],
            ),
          ),

          StatusChip(
            text: visitor.status,
            color: visitor.statusColor,
          ),
        ],
      ),
    );
  }
}