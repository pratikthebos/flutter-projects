import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/animated_background.dart';
import '../../viewmodels/home_viewmodel.dart';

import '../../widgets/demos/analytics_demo.dart';
import '../../widgets/demos/credit_card_demo.dart';
import '../../widgets/demos/fluid_cards_demo.dart';
import '../../widgets/demos/liquid_glass_demo.dart';
import '../../widgets/demos/music_player_demo.dart';
import '../../widgets/demos/neon_controls_demo.dart';
import '../../widgets/demos/parallax_profile_demo.dart';
import '../../widgets/demos/security_scanner_demo.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeVM = context.watch<HomeViewModel>();

    final demo = homeVM.selectedDemo;

    // ------------------------------------------------------
    // No demo selected
    // ------------------------------------------------------

    if (demo == null) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffF7F5FF),
                Color(0xffEEF9FF),
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'No demo selected',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xff172033),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // =================================================
          // BACKGROUND
          // =================================================

          const AnimatedBackground(),

          // =================================================
          // COLOR GLOW
          // =================================================

          Positioned(
            top: 80,
            right: -80,
            child: _GlowOrb(
              size: 220,
              color: demo.color,
            ),
          ),

          Positioned(
            bottom: 80,
            left: -100,
            child: _GlowOrb(
              size: 240,
              color: const Color(0xff00C6FF),
            ),
          ),

          // =================================================
          // MAIN CONTENT
          // =================================================

          SafeArea(
            child: Column(
              children: [
                // =================================================
                // HEADER
                // =================================================

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    18,
                    16,
                    18,
                    12,
                  ),
                  child: Row(
                    children: [
                      // ------------------------------------------------
                      // BACK BUTTON
                      // ------------------------------------------------

                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(
                              alpha: .82,
                            ),
                            border: Border.all(
                              color: Colors.white.withValues(
                                alpha: .95,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(
                                  alpha: .06,
                                ),
                                blurRadius: 18,
                                offset: const Offset(
                                  0,
                                  7,
                                ),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            color: Color(0xff172033),
                            size: 23,
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      // ------------------------------------------------
                      // TITLE
                      // ------------------------------------------------

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              demo.title,
                              maxLines: 1,
                              overflow:
                              TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -.4,
                                color: Color(0xff172033),
                              ),
                            ),

                            const SizedBox(height: 3),

                            Text(
                              demo.subtitle,
                              maxLines: 1,
                              overflow:
                              TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xff687386),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      // ------------------------------------------------
                      // CATEGORY
                      // ------------------------------------------------

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              demo.color.withValues(
                                alpha: .18,
                              ),
                              demo.color.withValues(
                                alpha: .07,
                              ),
                            ],
                          ),
                          border: Border.all(
                            color: demo.color.withValues(
                              alpha: .25,
                            ),
                          ),
                        ),
                        child: Text(
                          demo.category,
                          style: TextStyle(
                            color: demo.color,
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // =================================================
                // DEMO AREA
                // =================================================

                Expanded(
                  child: Center(
                    child: _DemoContainer(
                      color: demo.color,
                      child: _buildDemo(demo.index),
                    ),
                  ),
                ),

                // =================================================
                // BOTTOM INFO
                // =================================================

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    8,
                    20,
                    22,
                  ),
                  child: _BottomHint(
                    color: demo.color,
                    icon: demo.icon,
                    category: demo.category,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // DEMO SWITCH
  // ==========================================================

  Widget _buildDemo(int index) {
    switch (index) {
      case 0:
        return const LiquidGlassDemo();

      case 1:
        return const FluidCardsDemo();

      case 2:
        return const CreditCardDemo();

      case 3:
        return const ParallaxProfileDemo();

      case 4:
        return const MusicPlayerDemo();

      case 5:
        return const AnalyticsDemo();

      case 6:
        return const SecurityScannerDemo();

      case 7:
        return const NeonControlsDemo();

      default:
        return const LiquidGlassDemo();
    }
  }
}

// ============================================================
// DEMO CONTAINER
// ============================================================

class _DemoContainer extends StatelessWidget {
  final Widget child;
  final Color color;

  const _DemoContainer({
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(
              alpha: .82,
            ),
            Colors.white.withValues(
              alpha: .55,
            ),
          ],
        ),
        border: Border.all(
          color: Colors.white.withValues(
            alpha: .95,
          ),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(
              alpha: .12,
            ),
            blurRadius: 45,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.black.withValues(
              alpha: .04,
            ),
            blurRadius: 30,
            offset: const Offset(
              0,
              15,
            ),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(38),
        child: child,
      ),
    )
        .animate()
        .fadeIn(
      duration: 450.ms,
    )
        .scale(
      begin: const Offset(.96, .96),
      end: const Offset(1, 1),
      duration: 500.ms,
      curve: Curves.easeOutBack,
    );
  }
}

// ============================================================
// GLOW ORB
// ============================================================

class _GlowOrb extends StatelessWidget {
  final double size;
  final Color color;

  const _GlowOrb({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withValues(
                alpha: .14,
              ),
              blurRadius: 100,
              spreadRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// BOTTOM HINT
// ============================================================

class _BottomHint extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String category;

  const _BottomHint({
    required this.color,
    required this.icon,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(
          alpha: .72,
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white.withValues(
            alpha: .9,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  color,
                  color.withValues(
                    alpha: .65,
                  ),
                ],
              ),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 19,
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Text(
              'Interactive Flutter UI • Explore the motion',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xff687386),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Icon(
            Icons.touch_app_rounded,
            color: color,
            size: 20,
          ),
        ],
      ),
    );
  }
}