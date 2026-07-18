import 'dart:ui';

import 'package:flutter/material.dart';

class GlassStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final List<Color> gradient;

  const GlassStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ),
          child: Container(
            height: 170,
            padding: const EdgeInsets.all(18),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),

              border: Border.all(
                color: Colors.white.withOpacity(.18),
                width: 1,
              ),

              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(.22),
                  Colors.white.withOpacity(.08),
                ],
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.18),
                  blurRadius: 22,
                  offset: const Offset(0, 12),
                ),
              ],
            ),

            child: Stack(
              children: [

                //-----------------------------------
                // Glow Effect
                //-----------------------------------

                Positioned(
                  top: -20,
                  right: -20,
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          gradient.first.withOpacity(.35),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                //-----------------------------------
                // Content
                //-----------------------------------

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: 52,
                      height: 52,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: gradient,
                        ),
                      ),

                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white.withOpacity(.78),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}