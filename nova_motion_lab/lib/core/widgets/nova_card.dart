import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../../models/experience_model.dart';

class NovaCard extends StatefulWidget {
  const NovaCard({
    super.key,
    required this.experience,
    required this.onTap,
  });

  final ExperienceModel experience;
  final VoidCallback onTap;

  @override
  State<NovaCard> createState() => _NovaCardState();
}

class _NovaCardState extends State<NovaCard> {
  bool _pressed = false;

  // ==============================================================
  // CARD BACKGROUND COLORS
  // ==============================================================

  List<Color> _cardColors(int index) {
    switch (index) {
    // 01 — VIOLET
      case 0:
        return const [
          Color(0xff0B0718),
          Color(0xff160D2D),
          Color(0xff291452),
        ];

    // 02 — PINK
      case 1:
        return const [
          Color(0xff180711),
          Color(0xff2B0D1D),
          Color(0xff48132F),
        ];

    // 03 — ELECTRIC BLUE
      case 2:
        return const [
          Color(0xff050E19),
          Color(0xff0A1B31),
          Color(0xff0D3760),
        ];

    // 04 — CYAN
      case 3:
        return const [
          Color(0xff041315),
          Color(0xff08272C),
          Color(0xff0A4149),
        ];

    // 05 — EMERALD
      case 4:
        return const [
          Color(0xff04140F),
          Color(0xff08281D),
          Color(0xff0B4330),
        ];

    // 06 — GOLD
      case 5:
        return const [
          Color(0xff170E04),
          Color(0xff2A1A07),
          Color(0xff49300C),
        ];

      default:
        return const [
          Color(0xff0C0E15),
          Color(0xff161923),
          Color(0xff252A36),
        ];
    }
  }

  // ==============================================================
  // ACCENT COLORS
  // ==============================================================

  Color _accentColor(int index) {
    switch (index) {
      case 0:
        return const Color(0xffA78BFA);

      case 1:
        return const Color(0xffF472B6);

      case 2:
        return const Color(0xff38BDF8);

      case 3:
        return const Color(0xff22D3EE);

      case 4:
        return const Color(0xff34D399);

      case 5:
        return const Color(0xffFBBF24);

      default:
        return AppColors.cyan;
    }
  }

  // ==============================================================
  // SECONDARY COLORS
  // ==============================================================

  Color _secondaryColor(int index) {
    switch (index) {
      case 0:
        return const Color(0xff6366F1);

      case 1:
        return const Color(0xffDB2777);

      case 2:
        return const Color(0xff2563EB);

      case 3:
        return const Color(0xff0891B2);

      case 4:
        return const Color(0xff059669);

      case 5:
        return const Color(0xffD97706);

      default:
        return AppColors.purple;
    }
  }

  // ==============================================================
  // CATEGORY
  // ==============================================================

  String _categoryLabel(int index) {
    switch (index) {
      case 0:
        return 'MOTION';

      case 1:
        return 'COLOR';

      case 2:
        return 'INTERACTION';

      case 3:
        return 'SPACE';

      case 4:
        return 'WAVE';

      case 5:
        return 'SCROLL';

      default:
        return 'EXPERIMENT';
    }
  }

  // ==============================================================
  // BUILD
  // ==============================================================

  @override
  Widget build(BuildContext context) {
    final int index = widget.experience.index;

    final List<Color> colors =
    _cardColors(index);

    final Color accent =
    _accentColor(index);

    final Color secondary =
    _secondaryColor(index);

    final String category =
    _categoryLabel(index);

    final String number =
    (index + 1)
        .toString()
        .padLeft(2, '0');

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      // ============================================================
      // TOUCH DOWN
      // ============================================================

      onTapDown: (_) {
        setState(() {
          _pressed = true;
        });
      },

      // ============================================================
      // TOUCH UP
      // ============================================================

      onTapUp: (_) {
        setState(() {
          _pressed = false;
        });

        widget.onTap();
      },

      // ============================================================
      // TOUCH CANCEL
      // ============================================================

      onTapCancel: () {
        setState(() {
          _pressed = false;
        });
      },

      // ============================================================
      // CARD SCALE
      // ============================================================

      child: AnimatedScale(
        scale: _pressed ? 0.975 : 1.0,
        duration: const Duration(
          milliseconds: 140,
        ),
        curve: Curves.easeOut,

        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 180,
          ),
          curve: Curves.easeOutCubic,

          height: 205,

          // IMPORTANT:
          // Extra left/right space keeps the icon
          // completely away from the rounded card edge.
          padding:
          const EdgeInsets.fromLTRB(
            23,
            18,
            20,
            17,
          ),

          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(28),

            // ======================================================
            // PREMIUM DARK GRADIENT
            // ======================================================

            gradient: LinearGradient(
              begin:
              Alignment.topLeft,
              end:
              Alignment.bottomRight,
              colors: colors,
              stops: const [
                0.0,
                0.48,
                1.0,
              ],
            ),

            // ======================================================
            // BORDER
            // ======================================================

            border: Border.all(
              color: accent.withValues(
                alpha:
                _pressed ? 0.55 : 0.22,
              ),
              width:
              _pressed ? 1.4 : 1.0,
            ),

            // ======================================================
            // SHADOW
            // ======================================================

            boxShadow: [
              BoxShadow(
                color: accent.withValues(
                  alpha:
                  _pressed ? 0.20 : 0.08,
                ),
                blurRadius:
                _pressed ? 32 : 24,
                spreadRadius:
                _pressed ? 2 : 0,
                offset:
                const Offset(0, 10),
              ),

              BoxShadow(
                color:
                Colors.black.withValues(
                  alpha: 0.35,
                ),
                blurRadius: 22,
                offset:
                const Offset(0, 12),
              ),
            ],
          ),

          // ========================================================
          // CARD CONTENT
          // ========================================================

          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // ====================================================
              // TOP RIGHT ACCENT
              // ====================================================

              Positioned(
                right: -70,
                top: -75,
                child: IgnorePointer(
                  child: Container(
                    width: 185,
                    height: 185,
                    decoration:
                    BoxDecoration(
                      shape:
                      BoxShape.circle,
                      gradient:
                      RadialGradient(
                        colors: [
                          accent.withValues(
                            alpha: 0.16,
                          ),
                          accent.withValues(
                            alpha: 0.04,
                          ),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // ====================================================
              // BOTTOM LEFT ACCENT
              // ====================================================

              Positioned(
                left: -90,
                bottom: -120,
                child: IgnorePointer(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration:
                    BoxDecoration(
                      shape:
                      BoxShape.circle,
                      gradient:
                      RadialGradient(
                        colors: [
                          secondary
                              .withValues(
                            alpha: 0.10,
                          ),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // ====================================================
              // METALLIC TOP LINE
              // ====================================================

              Positioned(
                top: 0,
                left: 5,
                right: 5,
                child: Container(
                  height: 1,
                  decoration:
                  BoxDecoration(
                    gradient:
                    LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.white
                            .withValues(
                          alpha: 0.22,
                        ),
                        accent.withValues(
                          alpha: 0.30,
                        ),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              // ====================================================
              // MAIN CONTENT
              // ====================================================

              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  // =================================================
                  // TOP ROW
                  // =================================================

                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      // =============================================
                      // PREMIUM ICON CONTAINER
                      // =============================================

                      Container(
                        width: 54,
                        height: 54,
                        alignment:
                        Alignment.center,

                        decoration:
                        BoxDecoration(
                          borderRadius:
                          BorderRadius
                              .circular(
                            16,
                          ),

                          gradient:
                          LinearGradient(
                            begin:
                            Alignment.topLeft,
                            end:
                            Alignment.bottomRight,
                            colors: [
                              accent.withValues(
                                alpha: 0.25,
                              ),
                              secondary
                                  .withValues(
                                alpha: 0.10,
                              ),
                            ],
                          ),

                          border:
                          Border.all(
                            color: accent
                                .withValues(
                              alpha: 0.34,
                            ),
                            width: 1,
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: accent
                                  .withValues(
                                alpha: 0.12,
                              ),
                              blurRadius: 16,
                              spreadRadius: 1,
                            ),
                          ],
                        ),

                        // IMPORTANT:
                        // Icon is centered and has enough
                        // space on every side.
                        child: Icon(
                          widget
                              .experience
                              .icon,
                          color: accent,
                          size: 25,
                        ),
                      ),

                      const Spacer(),

                      // =============================================
                      // EXPERIENCE NUMBER
                      // =============================================

                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .end,
                        children: [
                          Text(
                            'EXPERIENCE',
                            style:
                            TextStyle(
                              color: Colors
                                  .white
                                  .withValues(
                                alpha: 0.35,
                              ),
                              fontSize: 7,
                              fontWeight:
                              FontWeight
                                  .w800,
                              letterSpacing:
                              1.5,
                            ),
                          ),

                          const SizedBox(
                            height: 3,
                          ),

                          Text(
                            number,
                            style:
                            TextStyle(
                              color: accent,
                              fontSize: 18,
                              fontWeight:
                              FontWeight
                                  .w900,
                              letterSpacing:
                              1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // =================================================
                  // SPACE AFTER ICON
                  // =================================================

                  const SizedBox(
                    height: 13,
                  ),

                  // =================================================
                  // CATEGORY
                  // =================================================

                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 2,
                        decoration:
                        BoxDecoration(
                          borderRadius:
                          BorderRadius
                              .circular(
                            20,
                          ),
                          color: accent,
                          boxShadow: [
                            BoxShadow(
                              color: accent
                                  .withValues(
                                alpha: 0.40,
                              ),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        width: 8,
                      ),

                      Text(
                        category,
                        style:
                        TextStyle(
                          color: accent
                              .withValues(
                            alpha: 0.90,
                          ),
                          fontSize: 8,
                          fontWeight:
                          FontWeight
                              .w900,
                          letterSpacing:
                          1.7,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  // =================================================
                  // TITLE
                  // =================================================

                  Text(
                    widget
                        .experience
                        .title,
                    maxLines: 1,
                    overflow:
                    TextOverflow.ellipsis,
                    style:
                    const TextStyle(
                      color:
                      AppColors.white,
                      fontSize: 19,
                      fontWeight:
                      FontWeight.w900,
                      letterSpacing: 0.4,
                    ),
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  // =================================================
                  // DESCRIPTION
                  // =================================================

                  Text(
                    widget
                        .experience
                        .description,
                    maxLines: 2,
                    overflow:
                    TextOverflow.ellipsis,
                    style:
                    TextStyle(
                      color: Colors.white
                          .withValues(
                        alpha: 0.56,
                      ),
                      fontSize: 11,
                      height: 1.35,
                    ),
                  ),

                  const Spacer(),

                  // =================================================
                  // BOTTOM ACTION
                  // =================================================

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 2,
                          decoration:
                          BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .circular(
                              20,
                            ),
                            gradient:
                            LinearGradient(
                              colors: [
                                accent,
                                secondary,
                                Colors
                                    .transparent,
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 10,
                      ),

                      Container(
                        width: 27,
                        height: 27,
                        alignment:
                        Alignment.center,
                        decoration:
                        BoxDecoration(
                          shape:
                          BoxShape.circle,
                          color: accent
                              .withValues(
                            alpha: 0.10,
                          ),
                          border:
                          Border.all(
                            color: accent
                                .withValues(
                              alpha: 0.20,
                            ),
                          ),
                        ),
                        child: Icon(
                          Icons
                              .arrow_forward_rounded,
                          size: 14,
                          color: accent,
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
    );
  }
}