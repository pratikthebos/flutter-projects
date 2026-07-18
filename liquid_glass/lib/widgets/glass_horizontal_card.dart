import 'dart:ui';

import 'package:flutter/material.dart';

class GlassHorizontalCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradient;

  const GlassHorizontalCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 180,
      margin: const EdgeInsets.only(right: 18),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),

        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 25,
            sigmaY: 25,
          ),

          child: Container(
            padding: const EdgeInsets.all(18),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),

              border: Border.all(
                color: Colors.white.withOpacity(.18),
                width: 1,
              ),

              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(.20),
                  Colors.white.withOpacity(.08),
                ],
              ),

              boxShadow: [
                BoxShadow(
                  color: gradient.first.withOpacity(.28),
                  blurRadius: 28,
                  spreadRadius: 2,
                  offset: const Offset(0, 16),
                ),

                BoxShadow(
                  color: Colors.black.withOpacity(.15),
                  blurRadius: 18,
                  offset: const Offset(0, 12),
                ),
              ],
            ),

            child: Stack(
              children: [

                //-------------------------------------
                // Reflection
                //-------------------------------------

                Positioned(
                  top: -40,
                  right: -20,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Colors.white.withOpacity(.20),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                //-------------------------------------
                // Content
                //-------------------------------------

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Container(
                      width: 56,
                      height: 56,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: gradient,
                        ),
                      ),

                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(.78),
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 14),

                    Row(
                      children: [

                        Container(
                          width: 34,
                          height: 34,

                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.12),
                            shape: BoxShape.circle,
                          ),

                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          "Open",
                          style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: 13,
                          ),
                        ),
                      ],
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