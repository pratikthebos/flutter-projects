import 'package:flutter/material.dart';

import '../core/widgets/glass_card.dart';
import '../core/widgets/status_chip.dart';
import '../models/history_model.dart';

class HistoryTile extends StatelessWidget {
  final HistoryModel item;

  const HistoryTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [

          CircleAvatar(
            radius: 26,
            backgroundColor: item.statusColor.withOpacity(.15),
            child: Icon(
              item.icon,
              color: item.statusColor,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  item.subtitle,
                  style: const TextStyle(
                    color: Colors.white60,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  item.time,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          StatusChip(
            text: item.status,
            color: item.statusColor,
          ),
        ],
      ),
    );
  }
}