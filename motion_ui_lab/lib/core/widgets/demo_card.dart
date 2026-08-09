import 'package:flutter/material.dart';

import '../../models/demo_model.dart';

class DemoCard extends StatelessWidget {
  final DemoModel demo;
  final VoidCallback onTap;

  const DemoCard({
    super.key,
    required this.demo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = _getGradient(demo.index);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),

          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),

          boxShadow: [
            BoxShadow(
              color: colors.first.withValues(
                alpha: .28,
              ),
              blurRadius: 28,
              spreadRadius: 1,
              offset: const Offset(
                0,
                12,
              ),
            ),
          ],
        ),

        child: Stack(
          children: [
            // =============================================
            // BACKGROUND GLOW
            // =============================================

            Positioned(
              right: -45,
              top: -55,
              child: Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(
                    alpha: .10,
                  ),
                ),
              ),
            ),

            Positioned(
              left: -60,
              bottom: -80,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withValues(
                    alpha: .08,
                  ),
                ),
              ),
            ),

            // =============================================
            // CONTENT
            // =============================================

            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  // -----------------------------------------
                  // TOP ROW
                  // -----------------------------------------

                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(
                            alpha: .18,
                          ),
                          borderRadius:
                          BorderRadius.circular(17),
                          border: Border.all(
                            color: Colors.white.withValues(
                              alpha: .28,
                            ),
                          ),
                        ),
                        child: Icon(
                          demo.icon,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),

                      const Spacer(),

                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(
                            alpha: .16,
                          ),
                          borderRadius:
                          BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.white.withValues(
                              alpha: .22,
                            ),
                          ),
                        ),
                        child: Text(
                          demo.category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight:
                            FontWeight.w800,
                            letterSpacing: .4,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // -----------------------------------------
                  // TITLE
                  // -----------------------------------------

                  Text(
                    demo.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -.3,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    demo.subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(
                        alpha: .78,
                      ),
                      fontSize: 12,
                      height: 1.35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 13),

                  // -----------------------------------------
                  // EXPLORE
                  // -----------------------------------------

                  Row(
                    children: [
                      Text(
                        'Explore interaction',
                        style: TextStyle(
                          color: Colors.white.withValues(
                            alpha: .82,
                          ),
                          fontSize: 11,
                          fontWeight:
                          FontWeight.w700,
                        ),
                      ),

                      const SizedBox(width: 7),

                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 16,
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

  // =========================================================
  // PREMIUM CARD GRADIENTS
  // =========================================================

  List<Color> _getGradient(int index) {
    switch (index) {
    // Liquid Glass
      case 0:
        return const [
          Color(0xff4F46E5),
          Color(0xff7C3AED),
          Color(0xff06B6D4),
        ];

    // Fluid Cards
      case 1:
        return const [
          Color(0xff0369A1),
          Color(0xff0284C7),
          Color(0xff06B6D4),
        ];

    // Credit Card
      case 2:
        return const [
          Color(0xff4C1D95),
          Color(0xff7E22CE),
          Color(0xffDB2777),
        ];

    // Parallax Profile
      case 3:
        return const [
          Color(0xffBE123C),
          Color(0xffE11D48),
          Color(0xffF97316),
        ];

    // Music Player
      case 4:
        return const [
          Color(0xff581C87),
          Color(0xff9333EA),
          Color(0xffEC4899),
        ];

    // Analytics
      case 5:
        return const [
          Color(0xff065F46),
          Color(0xff059669),
          Color(0xff14B8A6),
        ];

    // Security Scanner
      case 6:
        return const [
          Color(0xff1E3A8A),
          Color(0xff2563EB),
          Color(0xff06B6D4),
        ];

    // Neon Controls
      case 7:
        return const [
          Color(0xff86198F),
          Color(0xffC026D3),
          Color(0xff7C3AED),
        ];

      default:
        return const [
          Color(0xff4F46E5),
          Color(0xff06B6D4),
        ];
    }
  }
}