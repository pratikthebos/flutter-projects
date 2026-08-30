import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/nova_background.dart';

class AnimationScrollScreen extends StatefulWidget {
  const AnimationScrollScreen({
    super.key,
  });

  @override
  State<AnimationScrollScreen> createState() =>
      _AnimationScrollScreenState();
}

class _AnimationScrollScreenState
    extends State<AnimationScrollScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController introController;

  final ScrollController scrollController =
  ScrollController();

  double scrollOffset = 0;

  final List<_ScrollExperience> experiences = const [
    // ==============================================================
    // 01 — MOTION
    // ==============================================================

    _ScrollExperience(
      number: '01',
      title: 'MOTION',
      subtitle: 'PURE ANIMATION',
      description:
      'Fluid motion designed to create visual impact.',
      icon: Icons.auto_awesome_rounded,
      colors: [
        Color(0xff7C3AED),
        Color(0xffA855F7),
      ],
    ),

    // ==============================================================
    // 02 — COLOR
    // ==============================================================

    _ScrollExperience(
      number: '02',
      title: 'COLOR',
      subtitle: 'LIVING PALETTE',
      description:
      'Interactive colors that respond to your movement.',
      icon: Icons.palette_rounded,
      colors: [
        Color(0xffEC4899),
        Color(0xffF97316),
      ],
    ),

    // ==============================================================
    // 03 — FUTURE
    // ==============================================================

    _ScrollExperience(
      number: '03',
      title: 'FUTURE',
      subtitle: 'NEXT INTERACTION',
      description:
      'Interfaces built around touch and motion.',
      icon: Icons.bolt_rounded,
      colors: [
        Color(0xff06B6D4),
        Color(0xff2563EB),
      ],
    ),

    // ==============================================================
    // 04 — SPACE
    // ==============================================================

    _ScrollExperience(
      number: '04',
      title: 'SPACE',
      subtitle: 'BEYOND LIMITS',
      description:
      'Explore a world of depth, orbit and light.',
      icon: Icons.public_rounded,
      colors: [
        Color(0xff6366F1),
        Color(0xff8B5CF6),
      ],
    ),

    // ==============================================================
    // 05 — WAVE
    // ==============================================================

    _ScrollExperience(
      number: '05',
      title: 'WAVE',
      subtitle: 'FEEL THE FREQUENCY',
      description:
      'Motion translated into a living visual rhythm.',
      icon: Icons.graphic_eq_rounded,
      colors: [
        Color(0xff14B8A6),
        Color(0xff06B6D4),
      ],
    ),

    // ==============================================================
    // 06 — GLASS
    // ==============================================================

    _ScrollExperience(
      number: '06',
      title: 'GLASS',
      subtitle: 'CRYSTAL INTERFACE',
      description:
      'A futuristic glass interface built with depth and precision.',
      icon: Icons.blur_on_rounded,
      colors: [
        Color(0xff94A3B8),
        Color(0xffE2E8F0),
      ],
    ),

    // ==============================================================
    // 07 — AURA
    // ==============================================================

    _ScrollExperience(
      number: '07',
      title: 'AURA',
      subtitle: 'AMBIENT ENERGY',
      description:
      'A living interface inspired by light, atmosphere and energy.',
      icon: Icons.flare_rounded,
      colors: [
        Color(0xffD946EF),
        Color(0xff8B5CF6),
      ],
    ),

    // ==============================================================
    // 08 — NEON
    // ==============================================================

    _ScrollExperience(
      number: '08',
      title: 'NEON',
      subtitle: 'ELECTRIC MOTION',
      description:
      'High-energy interaction powered by futuristic neon movement.',
      icon: Icons.bolt_rounded,
      colors: [
        Color(0xffA3E635),
        Color(0xff22C55E),
      ],
    ),

    // ==============================================================
    // 09 — QUANTUM
    // ==============================================================

    _ScrollExperience(
      number: '09',
      title: 'QUANTUM',
      subtitle: 'DIGITAL PARTICLES',
      description:
      'Particles, depth and motion combine into a living digital world.',
      icon: Icons.hub_rounded,
      colors: [
        Color(0xff60A5FA),
        Color(0xff4F46E5),
      ],
    ),

    // ==============================================================
    // 10 — FLUX
    // ==============================================================

    _ScrollExperience(
      number: '10',
      title: 'FLUX',
      subtitle: 'FLOWING ENERGY',
      description:
      'Dynamic flowing motion designed to create powerful visual rhythm.',
      icon: Icons.water_drop_rounded,
      colors: [
        Color(0xffFB923C),
        Color(0xffEF4444),
      ],
    ),

    // ==============================================================
    // 11 — PULSE
    // ==============================================================

    _ScrollExperience(
      number: '11',
      title: 'PULSE',
      subtitle: 'RHYTHMIC MOTION',
      description:
      'A responsive visual pulse that transforms interaction into motion.',
      icon: Icons.favorite_rounded,
      colors: [
        Color(0xffF43F5E),
        Color(0xffE11D48),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();

    introController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1200,
      ),
    );

    introController.forward();

    scrollController.addListener(() {
      setState(() {
        scrollOffset =
            scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const NovaBackground(),

          SafeArea(
            child: Column(
              children: [
                _buildHeader(),

                Expanded(
                  child: Stack(
                    children: [
                      ListView.builder(
                        controller:
                        scrollController,
                        physics:
                        const BouncingScrollPhysics(),
                        padding:
                        const EdgeInsets.fromLTRB(
                          20,
                          25,
                          20,
                          100,
                        ),
                        itemCount:
                        experiences.length,
                        itemBuilder:
                            (context, index) {
                          return _buildAnimatedCard(
                            index,
                          );
                        },
                      ),

                      _buildScrollIndicator(),
                    ],
                  ),
                ),

                _buildBottomHint(),

                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        22,
        20,
        22,
        0,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(
                  alpha: .055,
                ),
                border: Border.all(
                  color: Colors.white.withValues(
                    alpha: .10,
                  ),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),

          const SizedBox(
            width: 14,
          ),

          const Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                '06 / 06',
                style: TextStyle(
                  color: AppColors.cyan,
                  fontSize: 10,
                  fontWeight:
                  FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'ANIMATION SCROLL',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 17,
                  fontWeight:
                  FontWeight.w900,
                  letterSpacing: .8,
                ),
              ),
            ],
          ),

          const Spacer(),

          Container(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 11,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(20),
              color: Colors.white
                  .withValues(alpha: .04),
              border: Border.all(
                color: Colors.white
                    .withValues(alpha: .10),
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.swipe_vertical_rounded,
                  size: 14,
                  color: AppColors.cyan,
                ),
                SizedBox(width: 5),
                Text(
                  'SCROLL',
                  style: TextStyle(
                    color: AppColors.silver,
                    fontSize: 9,
                    fontWeight:
                    FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ANIMATED CARD
  // ============================================================

  Widget _buildAnimatedCard(
      int index,
      ) {
    return LayoutBuilder(
      builder: (
          context,
          constraints,
          ) {
        final cardHeight =
        min(
          430.0,
          max(
            340.0,
            MediaQuery.of(context)
                .size
                .height *
                .52,
          ),
        );

        final itemExtent =
            cardHeight + 24;

        final cardPosition =
            index * itemExtent -
                scrollOffset;

        final screenCenter =
            MediaQuery.of(context)
                .size
                .height *
                .42;

        final distance =
        (cardPosition -
            screenCenter)
            .abs();

        final normalized =
        (distance / 400)
            .clamp(0.0, 1.0);

        final scale =
            1.0 -
                normalized * .14;

        final rotation =
        ((cardPosition -
            screenCenter) /
            900)
            .clamp(
          -.12,
          .12,
        );

        final verticalShift =
            (cardPosition -
                screenCenter) *
                .025;

        final opacity =
            1.0 -
                normalized * .35;

        return AnimatedBuilder(
          animation: introController,
          builder: (
              context,
              child,
              ) {
            final intro =
            Curves.easeOutCubic.transform(
              introController.value,
            );

            final entrance =
                80 *
                    (1 - intro);

            return Transform.translate(
              offset: Offset(
                0,
                entrance,
              ),
              child: Opacity(
                opacity:
                opacity * intro,
                child: Transform.translate(
                  offset: Offset(
                    0,
                    verticalShift,
                  ),
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: rotation,
                      child: child,
                    ),
                  ),
                ),
              ),
            );
          },
          child: _buildCard(
            experiences[index],
            index,
            cardHeight,
          ),
        );
      },
    );
  }

  // ============================================================
  // CARD
  // ============================================================

  Widget _buildCard(
      _ScrollExperience item,
      int index,
      double height,
      ) {
    return Container(
      height: height,
      margin:
      const EdgeInsets.only(
        bottom: 24,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(34),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            item.colors[0]
                .withValues(alpha: .92),
            item.colors[1]
                .withValues(alpha: .70),
            const Color(0xff101323),
          ],
          stops: const [
            0,
            .48,
            1,
          ],
        ),
        border: Border.all(
          color: Colors.white
              .withValues(alpha: .14),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: item.colors[0]
                .withValues(alpha: .22),
            blurRadius: 35,
            spreadRadius: 1,
            offset: const Offset(
              0,
              18,
            ),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius:
        BorderRadius.circular(34),
        child: Stack(
          children: [
            // ==================================================
            // DECORATIVE CIRCLES
            // ==================================================

            Positioned(
              right: -80,
              top: -90,
              child: Container(
                width: 230,
                height: 230,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white
                        .withValues(
                      alpha: .08,
                    ),
                    width: 1,
                  ),
                ),
              ),
            ),

            Positioned(
              right: -45,
              top: -55,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white
                        .withValues(
                      alpha: .06,
                    ),
                    width: 1,
                  ),
                ),
              ),
            ),

            Positioned(
              left: -100,
              bottom: -110,
              child: Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                      .withValues(
                    alpha: .025,
                  ),
                ),
              ),
            ),

            // ==================================================
            // NUMBER
            // ==================================================

            Positioned(
              top: 25,
              right: 25,
              child: Text(
                item.number,
                style: TextStyle(
                  color: Colors.white
                      .withValues(
                    alpha: .18,
                  ),
                  fontSize: 54,
                  fontWeight:
                  FontWeight.w900,
                ),
              ),
            ),

            // ==================================================
            // MAIN CONTENT
            // ==================================================

            Padding(
              padding:
              const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const Spacer(),

                  // ICON
                  Container(
                    width: 72,
                    height: 72,
                    decoration:
                    BoxDecoration(
                      borderRadius:
                      BorderRadius
                          .circular(22),
                      color: Colors.white
                          .withValues(
                        alpha: .10,
                      ),
                      border:
                      Border.all(
                        color: Colors.white
                            .withValues(
                          alpha: .18,
                        ),
                      ),
                    ),
                    child: Icon(
                      item.icon,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight:
                      FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  Text(
                    item.subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontWeight:
                      FontWeight.w800,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Text(
                    item.description,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(
                    height: 28,
                  ),

                  // PROGRESS LINE
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 3,
                          decoration:
                          BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .circular(
                              20,
                            ),
                            color: Colors.white
                                .withValues(
                              alpha: .12,
                            ),
                          ),
                          child:
                          FractionallySizedBox(
                            alignment:
                            Alignment
                                .centerLeft,
                            widthFactor:
                            (index + 1) /
                                experiences
                                    .length,
                            child: Container(
                              decoration:
                              BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                  20,
                                ),
                                gradient:
                                LinearGradient(
                                  colors:
                                  item.colors,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 12,
                      ),

                      Text(
                        '${index + 1}/${experiences.length}',
                        style:
                        const TextStyle(
                          color:
                          Colors.white54,
                          fontSize: 9,
                          fontWeight:
                          FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ==================================================
            // SMALL DECORATIVE DOT
            // ==================================================

            Positioned(
              right: 28,
              bottom: 30,
              child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.colors[0],
                  boxShadow: [
                    BoxShadow(
                      color: item.colors[0]
                          .withValues(
                        alpha: .7,
                      ),
                      blurRadius: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SCROLL INDICATOR
  // ============================================================

  Widget _buildScrollIndicator() {
    return Positioned(
      right: 7,
      top: 30,
      bottom: 30,
      child: Container(
        width: 3,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(10),
          color: Colors.white
              .withValues(alpha: .06),
        ),
        child: Align(
          alignment:
          Alignment.topCenter,
          child: FractionallySizedBox(
            heightFactor: .20,
            child: Container(
              decoration:
              BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                  10,
                ),
                gradient:
                const LinearGradient(
                  begin:
                  Alignment.topCenter,
                  end:
                  Alignment.bottomCenter,
                  colors: [
                    AppColors.purple,
                    AppColors.cyan,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // BOTTOM HINT
  // ============================================================

  Widget _buildBottomHint() {
    return AnimatedBuilder(
      animation: introController,
      builder: (context, child) {
        return Opacity(
          opacity: introController.value,
          child: child,
        );
      },
      child: const Column(
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Icon(
                Icons.keyboard_arrow_up_rounded,
                color: AppColors.cyan,
                size: 17,
              ),
              SizedBox(width: 3),
              Text(
                'SWIPE TO EXPLORE',
                style: TextStyle(
                  color: AppColors.silver,
                  fontSize: 10,
                  fontWeight:
                  FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(width: 3),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.cyan,
                size: 17,
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            'SCROLL THROUGH THE NOVA EXPERIENCES',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 8,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    introController.dispose();
    scrollController.dispose();

    super.dispose();
  }
}

// ================================================================
// MODEL
// ================================================================

class _ScrollExperience {
  final String number;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final List<Color> colors;

  const _ScrollExperience({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.colors,
  });
}