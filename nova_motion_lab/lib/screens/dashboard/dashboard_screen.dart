import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../app/routes.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/nova_background.dart';
import '../../core/widgets/nova_card.dart';
import '../../core/widgets/nova_logo.dart';
import '../../viewmodels/home_viewmodel.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState
    extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController glowController;

  @override
  void initState() {
    super.initState();

    glowController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 4,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: const Color(
        0xff05060B,
      ),
      body: Stack(
        children: [
          // ==========================================================
          // BACKGROUND
          // ==========================================================

          const NovaBackground(),

          // ==========================================================
          // PREMIUM AMBIENT GLOW
          // ==========================================================

          AnimatedBuilder(
            animation: glowController,
            builder: (
                context,
                child,
                ) {
              return IgnorePointer(
                child: Stack(
                  children: [
                    Positioned(
                      top: -100 +
                          sin(
                            glowController.value *
                                pi *
                                2,
                          ) *
                              25,
                      right: -80,
                      child: _ambientGlow(
                        color:
                        AppColors.purple,
                        size: 240,
                      ),
                    ),

                    Positioned(
                      top: 270 +
                          cos(
                            glowController.value *
                                pi *
                                2,
                          ) *
                              35,
                      left: -100,
                      child: _ambientGlow(
                        color:
                        AppColors.cyan,
                        size: 210,
                      ),
                    ),

                    Positioned(
                      bottom: -120,
                      right: 10,
                      child: _ambientGlow(
                        color:
                        AppColors.pink,
                        size: 220,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // ==========================================================
          // MAIN CONTENT
          // ==========================================================

          SafeArea(
            child: CustomScrollView(
              physics:
              const BouncingScrollPhysics(),

              slivers: [
                // ====================================================
                // HEADER
                // ====================================================

                SliverToBoxAdapter(
                  child: _buildHeader(
                    vm,
                  ),
                ),

                // ====================================================
                // HERO
                // ====================================================

                SliverToBoxAdapter(
                  child: _buildHero(
                    vm,
                  ),
                ),

                // ====================================================
                // EXPERIENCE HEADER
                // ====================================================

                SliverToBoxAdapter(
                  child:
                  _buildExperienceHeader(
                    vm,
                  ),
                ),

                // ====================================================
                // EXPERIENCE CARDS
                // ====================================================

                SliverPadding(
                  padding:
                  const EdgeInsets.fromLTRB(
                    20,
                    4,
                    20,
                    45,
                  ),
                  sliver: SliverList(
                    delegate:
                    SliverChildBuilderDelegate(
                          (
                          context,
                          index,
                          ) {
                        final experience =
                        vm.experiences[
                        index];

                        return Padding(
                          padding:
                          const EdgeInsets.only(
                            bottom: 18,
                          ),
                          child: NovaCard(
                            experience:
                            experience,
                            onTap: () {
                              vm.selectExperience(
                                experience,
                              );

                              final routes = [
                                Routes.animation,
                                Routes.color,
                                Routes.future,
                                Routes.space,
                                Routes.wave,
                                Routes.scroll,
                              ];

                              Navigator.pushNamed(
                                context,
                                routes[index],
                              );
                            },
                          )
                              .animate()
                              .fadeIn(
                            duration:
                            500.ms,
                            delay:
                            (index * 80).ms,
                          )
                              .slideY(
                            begin: .12,
                            end: 0,
                            duration:
                            550.ms,
                            curve:
                            Curves.easeOutCubic,
                            delay:
                            (index * 80).ms,
                          ),
                        );
                      },
                      childCount:
                      vm.experiences.length,
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

  // ================================================================
  // HEADER
  // ================================================================

  Widget _buildHeader(
      HomeViewModel vm,
      ) {
    return Padding(
      padding:
      const EdgeInsets.fromLTRB(
        22,
        20,
        22,
        0,
      ),
      child: Row(
        children: [
          // ========================================================
          // LOGO
          // ========================================================

          Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(
                18,
              ),
              boxShadow: [
                BoxShadow(
                  color:
                  AppColors.purple
                      .withValues(
                    alpha: .25,
                  ),
                  blurRadius: 25,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: const NovaLogo(
              size: 48,
            ),
          ),

          const SizedBox(
            width: 13,
          ),

          // ========================================================
          // BRAND
          // ========================================================

          const Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                'NOVA',
                style: TextStyle(
                  color:
                  AppColors.white,
                  fontSize: 20,
                  fontWeight:
                  FontWeight.w900,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'MOTION LAB',
                style: TextStyle(
                  color:
                  AppColors.muted,
                  fontSize: 8,
                  fontWeight:
                  FontWeight.w700,
                  letterSpacing: 2.2,
                ),
              ),
            ],
          ),

          const Spacer(),

          // ========================================================
          // EXPERIENCE COUNT
          // ========================================================

          Container(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 9,
            ),
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(
                18,
              ),
              color:
              Colors.white.withValues(
                alpha: .045,
              ),
              border:
              Border.all(
                color:
                Colors.white.withValues(
                  alpha: .10,
                ),
              ),
            ),
            child: Row(
              mainAxisSize:
              MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration:
                  const BoxDecoration(
                    shape:
                    BoxShape.circle,
                    color:
                    AppColors.cyan,
                    boxShadow: [
                      BoxShadow(
                        color:
                        AppColors.cyan,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  width: 7,
                ),

                Text(
                  '${vm.experiences.length}'
                      .padLeft(2, '0'),
                  style:
                  const TextStyle(
                    color:
                    AppColors.silver,
                    fontSize: 11,
                    fontWeight:
                    FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
      duration: 700.ms,
    )
        .slideY(
      begin: -.08,
      end: 0,
      duration: 700.ms,
    );
  }

  // ================================================================
  // HERO SECTION
  // ================================================================

  Widget _buildHero(
      HomeViewModel vm,
      ) {
    return Padding(
      padding:
      const EdgeInsets.fromLTRB(
        22,
        45,
        22,
        35,
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          // ========================================================
          // EYEBROW
          // ========================================================

          Row(
            children: [
              Container(
                width: 28,
                height: 1,
                color:
                AppColors.cyan,
              ),

              const SizedBox(
                width: 9,
              ),

              const Text(
                'DIGITAL EXPERIENCES',
                style: TextStyle(
                  color:
                  AppColors.cyan,
                  fontSize: 9,
                  fontWeight:
                  FontWeight.w900,
                  letterSpacing: 2.8,
                ),
              ),
            ],
          )
              .animate()
              .fadeIn(
            duration: 700.ms,
          )
              .slideX(
            begin: -.08,
            end: 0,
            duration: 700.ms,
          ),

          const SizedBox(
            height: 15,
          ),

          // ========================================================
          // MAIN TITLE
          // ========================================================

          const Text(
            'FUTURE',
            style: TextStyle(
              fontSize: 48,
              height: .95,
              fontWeight:
              FontWeight.w900,
              letterSpacing: -1.5,
              color:
              AppColors.white,
            ),
          )
              .animate()
              .fadeIn(
            duration: 800.ms,
            delay: 100.ms,
          )
              .slideX(
            begin: -.10,
            end: 0,
            duration: 800.ms,
            delay: 100.ms,
            curve:
            Curves.easeOutCubic,
          ),

          // ========================================================
          // GRADIENT TITLE
          // ========================================================

          ShaderMask(
            shaderCallback:
                (bounds) {
              return const LinearGradient(
                begin:
                Alignment.centerLeft,
                end:
                Alignment.centerRight,
                colors: [
                  AppColors.cyan,
                  AppColors.purple,
                  AppColors.pink,
                ],
              ).createShader(
                bounds,
              );
            },
            child: const Text(
              'Interfaces.',
              style: TextStyle(
                fontSize: 48,
                height: .98,
                fontWeight:
                FontWeight.w900,
                letterSpacing: -1.5,
                color:
                Colors.white,
              ),
            ),
          )
              .animate()
              .fadeIn(
            duration: 850.ms,
            delay: 180.ms,
          )
              .slideX(
            begin: -.10,
            end: 0,
            duration: 850.ms,
            delay: 180.ms,
            curve:
            Curves.easeOutCubic,
          ),

          const SizedBox(
            height: 18,
          ),

          // ========================================================
          // DESCRIPTION
          // ========================================================

          const SizedBox(
            width: 340,
            child: Text(
              'Six interactive motion concepts designed to turn modern UI into visual experiences.',
              style: TextStyle(
                color:
                AppColors.muted,
                fontSize: 14,
                height: 1.55,
                letterSpacing: .1,
              ),
            ),
          )
              .animate()
              .fadeIn(
            duration: 700.ms,
            delay: 300.ms,
          )
              .slideY(
            begin: .08,
            end: 0,
            duration: 700.ms,
            delay: 300.ms,
          ),

          const SizedBox(
            height: 22,
          ),

          // ========================================================
          // STATUS ROW
          // ========================================================

          Row(
            children: [
              _statusChip(
                Icons.auto_awesome_rounded,
                '06 EXPERIENCES',
                AppColors.purple,
              ),

              const SizedBox(
                width: 8,
              ),

              _statusChip(
                Icons.touch_app_rounded,
                'INTERACTIVE',
                AppColors.cyan,
              ),
            ],
          )
              .animate()
              .fadeIn(
            duration: 700.ms,
            delay: 400.ms,
          )
              .slideY(
            begin: .08,
            end: 0,
            duration: 700.ms,
            delay: 400.ms,
          ),
        ],
      ),
    );
  }

  // ================================================================
  // EXPERIENCE HEADER
  // ================================================================

  Widget _buildExperienceHeader(
      HomeViewModel vm,
      ) {
    final int count =
        vm.experiences.length;

    return Padding(
      padding:
      const EdgeInsets.fromLTRB(
        22,
        0,
        22,
        17,
      ),
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.end,
        children: [
          const Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                'THE LAB',
                style: TextStyle(
                  color:
                  AppColors.silver,
                  fontSize: 10,
                  fontWeight:
                  FontWeight.w900,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Explore experiments',
                style: TextStyle(
                  color:
                  AppColors.white,
                  fontSize: 17,
                  fontWeight:
                  FontWeight.w800,
                ),
              ),
            ],
          ),

          const Spacer(),

          // ========================================================
          // PROGRESS
          // ========================================================

          Column(
            crossAxisAlignment:
            CrossAxisAlignment.end,
            children: [
              Text(
                '01 / ${count.toString().padLeft(2, '0')}',
                style:
                const TextStyle(
                  color:
                  AppColors.muted,
                  fontSize: 9,
                  fontWeight:
                  FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(
                height: 7,
              ),

              Container(
                width: 65,
                height: 3,
                decoration:
                BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                  color:
                  Colors.white.withValues(
                    alpha: .08,
                  ),
                ),
                child: FractionallySizedBox(
                  alignment:
                  Alignment.centerLeft,
                  widthFactor:
                  count == 0
                      ? 0
                      : 1 / count,
                  child: Container(
                    decoration:
                    BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(
                        20,
                      ),
                      gradient:
                      const LinearGradient(
                        colors: [
                          AppColors.cyan,
                          AppColors.purple,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================================================================
  // STATUS CHIP
  // ================================================================

  Widget _statusChip(
      IconData icon,
      String text,
      Color color,
      ) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 8,
      ),
      decoration:
      BoxDecoration(
        borderRadius:
        BorderRadius.circular(
          14,
        ),
        color:
        color.withValues(
          alpha: .06,
        ),
        border:
        Border.all(
          color:
          color.withValues(
            alpha: .14,
          ),
        ),
      ),
      child: Row(
        mainAxisSize:
        MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 13,
            color: color,
          ),

          const SizedBox(
            width: 6,
          ),

          Text(
            text,
            style: TextStyle(
              color:
              color.withValues(
                alpha: .90,
              ),
              fontSize: 8,
              fontWeight:
              FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // AMBIENT GLOW
  // ================================================================

  Widget _ambientGlow({
    required Color color,
    required double size,
  }) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration:
        BoxDecoration(
          shape:
          BoxShape.circle,
          gradient:
          RadialGradient(
            colors: [
              color.withValues(
                alpha: .13,
              ),
              color.withValues(
                alpha: .04,
              ),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }

  // ================================================================
  // DISPOSE
  // ================================================================

  @override
  void dispose() {
    glowController.dispose();
    super.dispose();
  }
}