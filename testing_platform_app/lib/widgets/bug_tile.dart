import 'package:flutter/material.dart';

import '../models/bug_model.dart';
import '../utils/app_colors.dart';
import 'glass_card.dart';
import 'status_chip.dart';

class BugTile extends StatefulWidget {
  final BugModel bug;
  final VoidCallback onTap;

  const BugTile({
    super.key,
    required this.bug,
    required this.onTap,
  });

  @override
  State<BugTile> createState() => _BugTileState();
}

class _BugTileState extends State<BugTile> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final bug = widget.bug;

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: MouseRegion(
        onEnter: (_) => setState(() => hover = true),
        onExit: (_) => setState(() => hover = false),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 220),
          scale: hover ? 1.015 : 1,
          child: GlassCard(
            onTap: widget.onTap,
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: hover ? 60 : 56,
                  height: hover ? 60 : 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        bug.color,
                        bug.color.withOpacity(.65),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: bug.color.withOpacity(.35),
                        blurRadius: hover ? 30 : 18,
                      )
                    ],
                  ),
                  child: Icon(
                    bug.icon,
                    color: Colors.white,
                    size: 28,
                  ),
                ),

                const SizedBox(width: 18),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bug.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        bug.module,
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          StatusChip(text: bug.priority),
                          StatusChip(text: bug.status),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(width: 15),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withOpacity(.25),
                        AppColors.secondary.withOpacity(.18),
                      ],
                    ),
                    border: Border.all(
                      color: Colors.white.withOpacity(.12),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.auto_awesome,
                        color: AppColors.secondary,
                        size: 18,
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "${bug.aiScore}%",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      const SizedBox(height: 2),

                      const Text(
                        "AI",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}