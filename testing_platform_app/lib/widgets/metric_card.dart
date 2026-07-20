import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'glass_card.dart';

class MetricCard extends StatefulWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  State<MetricCard> createState() => _MetricCardState();
}

class _MetricCardState extends State<MetricCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GlassCard(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.identity()
            ..translate(0.0, hover ? -5.0 : 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Top Row
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: hover ? 56 : 52,
                    height: hover ? 56 : 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          widget.color,
                          widget.color.withOpacity(.6),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: widget.color.withOpacity(.35),
                          blurRadius: hover ? 25 : 15,
                        )
                      ],
                    ),
                    child: Icon(
                      widget.icon,
                      color: Colors.white,
                    ),
                  ),

                  const Spacer(),

                  Icon(
                    Icons.trending_up_rounded,
                    color: widget.color.withOpacity(.8),
                    size: 20,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 900),
                builder: (_, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.scale(
                      scale: .9 + (.1 * value),
                      child: child,
                    ),
                  );
                },
                child: Text(
                  widget.value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                widget.title,
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}