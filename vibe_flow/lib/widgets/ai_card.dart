import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/content_card_model.dart';

class AiCard extends StatefulWidget {
  final ContentCardModel item;

  const AiCard({
    super.key,
    required this.item,
  });

  @override
  State<AiCard> createState() => _AiCardState();
}

class _AiCardState extends State<AiCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Container(
      height: 290,
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: item.accent.withOpacity(0.25),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: item.accent.withOpacity(0.12),
            blurRadius: 35,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.network(
              item.image,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        item.accent.withOpacity(0.30),
                        AppColors.background,
                      ],
                    ),
                  ),
                );
              },
            ),

            // Dark cinematic overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(0.25),
                    Colors.black.withOpacity(0.45),
                    Colors.black.withOpacity(0.90),
                  ],
                ),
              ),
            ),

            // Animated AI gradient
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final value = _controller.value;

                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(
                        -1 + value * 2,
                        -1,
                      ),
                      end: Alignment(
                        1 - value * 2,
                        1,
                      ),
                      colors: [
                        item.accent.withOpacity(0.03),
                        item.accent.withOpacity(0.12),
                        Colors.transparent,
                        AppColors.purple.withOpacity(0.06),
                      ],
                    ),
                  ),
                );
              },
            ),

            // AI scanning glow
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final pulse =
                    0.8 + (_controller.value * 0.2);

                return Positioned(
                  top: -55,
                  right: -45,
                  child: Transform.scale(
                    scale: pulse,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: item.accent.withOpacity(0.08),
                        boxShadow: [
                          BoxShadow(
                            color:
                            item.accent.withOpacity(0.18),
                            blurRadius: 70,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Top AI status
            Positioned(
              top: 18,
              left: 18,
              right: 18,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  _StatusChip(
                    icon: Icons.psychology,
                    label: 'AI ACTIVE',
                    color: item.accent,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.35),
                      borderRadius:
                      BorderRadius.circular(20),
                      border: Border.all(
                        color:
                        Colors.white.withOpacity(0.10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            color: AppColors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'ONLINE',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // AI brain icon
            Positioned(
              top: 72,
              right: 22,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  final scale =
                      0.92 + (_controller.value * 0.08);

                  return Transform.scale(
                    scale: scale,
                    child: Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                        item.accent.withOpacity(0.10),
                        border: Border.all(
                          color:
                          item.accent.withOpacity(0.35),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                            item.accent.withOpacity(0.20),
                            blurRadius: 25,
                          ),
                        ],
                      ),
                      child: Icon(
                        item.icon,
                        color: item.accent,
                        size: 28,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Bottom content
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    item.category,
                    style: TextStyle(
                      color: item.accent,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      height: 1.05,
                      letterSpacing: -0.7,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    item.subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.68),
                      fontSize: 12,
                      height: 1.35,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // AI processing indicator
                  Row(
                    children: [
                      Expanded(
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            final progress =
                                0.55 +
                                    (_controller.value * 0.35);

                            return ClipRRect(
                              borderRadius:
                              BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: progress,
                                minHeight: 3,
                                backgroundColor:
                                Colors.white
                                    .withOpacity(0.08),
                                valueColor:
                                AlwaysStoppedAnimation<
                                    Color>(
                                  item.accent,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(width: 12),

                      Text(
                        'ANALYZING',
                        style: TextStyle(
                          color: item.accent,
                          fontSize: 8,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _StatusChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _StatusChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(0.35),
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.10),
            blurRadius: 15,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 14,
          ),
          const SizedBox(width: 7),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 9,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}