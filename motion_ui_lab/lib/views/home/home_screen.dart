import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../app/routes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/animated_background.dart';
import '../../core/widgets/demo_card.dart';
import '../../core/widgets/gradient_text.dart';
import '../../viewmodels/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xffF7F9FF),

      body: Stack(
        children: [
          // =========================================================
          // BACKGROUND
          // =========================================================

          const AnimatedBackground(),

          // =========================================================
          // AMBIENT COLOR GLOWS
          // =========================================================

          Positioned(
            top: -100,
            right: -80,
            child: _GlowOrb(
              size: 260,
              color: const Color(0xff7C3AED),
            ),
          ),

          Positioned(
            top: 260,
            left: -120,
            child: _GlowOrb(
              size: 230,
              color: const Color(0xff06B6D4),
            ),
          ),

          Positioned(
            bottom: -100,
            right: -80,
            child: _GlowOrb(
              size: 260,
              color: const Color(0xffEC4899),
            ),
          ),

          // =========================================================
          // CONTENT
          // =========================================================

          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),

              slivers: [
                // ===================================================
                // HEADER
                // ===================================================

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      18,
                      20,
                      18,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        // ------------------------------------------------
                        // TOP BAR
                        // ------------------------------------------------

                        Row(
                          children: [
                            // APP LOGO
                            Container(
                              width: 54,
                              height: 54,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(18),

                                gradient:
                                const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff7C3AED),
                                    Color(0xff6366F1),
                                    Color(0xff06B6D4),
                                  ],
                                ),

                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xff6366F1,
                                    ).withValues(
                                      alpha: .28,
                                    ),
                                    blurRadius: 22,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.auto_awesome_rounded,
                                color: Colors.white,
                                size: 27,
                              ),
                            )
                                .animate()
                                .scale(
                              begin:
                              const Offset(.7, .7),
                              end:
                              const Offset(1, 1),
                              duration: 600.ms,
                              curve:
                              Curves.easeOutBack,
                            ),

                            const SizedBox(width: 12),

                            // APP NAME
                            const Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'MotionUI',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.w900,
                                    color:
                                    Color(0xff172033),
                                  ),
                                ),
                                Text(
                                  'LAB',
                                  style: TextStyle(
                                    fontSize: 10,
                                    letterSpacing: 3,
                                    fontWeight:
                                    FontWeight.w800,
                                    color:
                                    Color(0xff6366F1),
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(),

                            // FLUTTER BADGE
                            Container(
                              padding:
                              const EdgeInsets.symmetric(
                                horizontal: 13,
                                vertical: 9,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white
                                    .withValues(
                                  alpha: .78,
                                ),
                                borderRadius:
                                BorderRadius.circular(
                                  20,
                                ),
                                border: Border.all(
                                  color: Colors.white
                                      .withValues(
                                    alpha: .9,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withValues(
                                      alpha: .035,
                                    ),
                                    blurRadius: 15,
                                  ),
                                ],
                              ),
                              child: const Row(
                                mainAxisSize:
                                MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.flutter_dash,
                                    size: 18,
                                    color:
                                    Color(0xff2979FF),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Flutter',
                                    style: TextStyle(
                                      fontWeight:
                                      FontWeight.w800,
                                      color:
                                      Color(0xff172033),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        // ------------------------------------------------
                        // HERO TITLE
                        // ------------------------------------------------

                        const GradientText(
                          text:
                          AppStrings.exploreTitle,
                          fontSize: 38,
                        )
                            .animate()
                            .fadeIn(
                          duration: 500.ms,
                        )
                            .slideX(
                          begin: -.08,
                          end: 0,
                          duration: 500.ms,
                        ),

                        const SizedBox(height: 9),

                        const Text(
                          AppStrings.exploreSubtitle,
                          style: TextStyle(
                            color: Color(0xff687386),
                            fontSize: 15,
                            height: 1.45,
                            fontWeight:
                            FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 18),

                        // ------------------------------------------------
                        // EXPERIENCE COUNT
                        // ------------------------------------------------

                        Row(
                          children: [
                            _InfoChip(
                              icon:
                              Icons.auto_awesome_rounded,
                              label:
                              '${vm.demos.length} Experiences',
                              color:
                              const Color(0xff7C3AED),
                            ),

                            const SizedBox(width: 9),

                            const _InfoChip(
                              icon:
                              Icons.touch_app_rounded,
                              label: 'Interactive',
                              color:
                              Color(0xff06B6D4),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // ===================================================
                // SECTION TITLE
                // ===================================================

                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                    const EdgeInsets.fromLTRB(
                      20,
                      2,
                      20,
                      14,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 5,
                          height: 23,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(10),
                            gradient:
                            const LinearGradient(
                              begin:
                              Alignment.topCenter,
                              end:
                              Alignment.bottomCenter,
                              colors: [
                                Color(0xff7C3AED),
                                Color(0xff06B6D4),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        const Text(
                          'Explore Demos',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight:
                            FontWeight.w900,
                            color:
                            Color(0xff172033),
                          ),
                        ),

                        const Spacer(),

                        Text(
                          'SWIPE',
                          style: TextStyle(
                            fontSize: 9,
                            letterSpacing: 1.5,
                            fontWeight:
                            FontWeight.w800,
                            color: Colors.grey
                                .shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ===================================================
                // DEMO CARDS
                // ===================================================

                SliverPadding(
                  padding:
                  const EdgeInsets.fromLTRB(
                    20,
                    0,
                    20,
                    45,
                  ),
                  sliver: SliverList(
                    delegate:
                    SliverChildBuilderDelegate(
                          (context, index) {
                        final demo =
                        vm.demos[index];

                        return Padding(
                          padding:
                          const EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: DemoCard(
                            demo: demo,
                            onTap: () {
                              vm.selectDemo(demo);

                              Navigator.pushNamed(
                                context,
                                Routes.demo,
                              );
                            },
                          )
                              .animate(
                            delay:
                            Duration(
                              milliseconds:
                              index * 80,
                            ),
                          )
                              .fadeIn(
                            duration:
                            500.ms,
                          )
                              .slideY(
                            begin: .08,
                            end: 0,
                            duration:
                            500.ms,
                            curve:
                            Curves.easeOutCubic,
                          ),
                        );
                      },
                      childCount:
                      vm.demos.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// INFO CHIP
// ============================================================

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(
          alpha: .72,
        ),
        borderRadius:
        BorderRadius.circular(18),
        border: Border.all(
          color: color.withValues(
            alpha: .15,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(
                alpha: .12,
              ),
            ),
            child: Icon(
              icon,
              size: 14,
              color: color,
            ),
          ),

          const SizedBox(width: 7),

          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
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
                alpha: .12,
              ),
              blurRadius: 110,
              spreadRadius: 25,
            ),
          ],
        ),
      ),
    );
  }
}