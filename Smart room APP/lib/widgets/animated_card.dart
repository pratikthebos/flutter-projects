import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../models/card_model.dart';
import '../utils/app_colors.dart';

class AnimatedCard extends StatelessWidget {
  final SmartCardModel card;

  final double scale;
  final double angle;
  final double translateX;
  final double translateY;
  final double opacity;

  const AnimatedCard({
    super.key,
    required this.card,
    required this.scale,
    required this.angle,
    required this.translateX,
    required this.translateY,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 450),
      opacity: opacity,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,

        transform: Matrix4.identity()
          ..translate(translateX, translateY)
          ..rotateZ(angle)
          ..scale(scale),

        child: Container(
          width: double.infinity,
          height: 315,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: card.gradient,
            ),

            boxShadow: [
              BoxShadow(
                color: card.glowColor,
                blurRadius: 45,
                spreadRadius: 2,
                offset: const Offset(0, 18),
              ),

              BoxShadow(
                color: Colors.black.withOpacity(.18),
                blurRadius: 28,
                offset: const Offset(0, 20),
              ),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //----------------------------------------------------
                // Header
                //----------------------------------------------------

                Row(
                  children: [

                    Container(
                      width: 56,
                      height: 56,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.glass,
                        border: Border.all(
                          color: AppColors.glassBorder,
                        ),
                      ),

                      child: Icon(
                        card.icon,
                        color: card.iconColor,
                        size: 28,
                      ),
                    ),

                    const Spacer(),

                    const Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.white70,
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                //----------------------------------------------------
                // Title
                //----------------------------------------------------

                Text(
                  card.title,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 8),

                //----------------------------------------------------
                // Value
                //----------------------------------------------------

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Text(
                      card.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 8),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        card.unit,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  card.subtitle,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
                ),

                const Spacer(),

                //----------------------------------------------------
                // Progress
                //----------------------------------------------------

                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: LinearProgressIndicator(
                    value: card.progress,
                    minHeight: 8,
                    backgroundColor: Colors.white24,
                    valueColor:
                    AlwaysStoppedAnimation(card.iconColor),
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  "${(card.progress * 100).toInt()}% Completed",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
        .animate()
        .fade(duration: 400.ms)
        .scale(
      begin: const Offset(.96, .96),
      end: const Offset(1, 1),
      duration: 400.ms,
    );
  }
}