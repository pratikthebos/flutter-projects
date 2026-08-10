import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class FluidCardsDemo extends StatefulWidget {
  const FluidCardsDemo({
    super.key,
  });

  @override
  State<FluidCardsDemo> createState() =>
      _FluidCardsDemoState();
}

class _FluidCardsDemoState extends State<FluidCardsDemo>
    with TickerProviderStateMixin {

  late AnimationController bounceController;
  late AnimationController returnController;



  int activeCard = 0;

  Timer? sequenceTimer;


  double rotationX = 0;
  double rotationY = 0;

  Offset? lastPosition;

  bool isDragging = false;

  // ================================================================
  // PREMIUM METALLIC CARDS
  // ================================================================

  final List<_PremiumCardData> cards = const [
    // ==============================================================
    // 01 — ROYAL PURPLE
    // ==============================================================

    _PremiumCardData(
      title: 'ROYAL',
      subtitle: 'PURPLE METALLIC',
      number: '01',
      icon: Icons.diamond_rounded,

      colors: [
        Color(0xff16052C),
        Color(0xff32105C),
        Color(0xff5B21B6),
        Color(0xff8B5CF6),
        Color(0xffC4B5FD),
        Color(0xff6D28D9),
        Color(0xff241044),
      ],

      metallicLight: Color(0xffE9DDFF),

      accent: Color(0xff8B5CF6),
    ),

    // ==============================================================
    // 02 — ROSE PINK
    // ==============================================================

    _PremiumCardData(
      title: 'ROSE',
      subtitle: 'PINK METALLIC',
      number: '02',
      icon: Icons.auto_awesome_rounded,

      colors: [
        Color(0xff270817),
        Color(0xff4A0D2A),
        Color(0xff9D174D),
        Color(0xffDB2777),
        Color(0xffF9A8D4),
        Color(0xffBE185D),
        Color(0xff3A0B22),
      ],

      metallicLight: Color(0xffffdce9),

      accent: Color(0xffEC4899),
    ),

    // ==============================================================
    // 03 — EMERALD GREEN
    // ==============================================================

    _PremiumCardData(
      title: 'EMERALD',
      subtitle: 'GREEN METALLIC',
      number: '03',
      icon: Icons.workspace_premium_rounded,

      colors: [
        Color(0xff031B14),
        Color(0xff064E3B),
        Color(0xff047857),
        Color(0xff10B981),
        Color(0xff6EE7B7),
        Color(0xff059669),
        Color(0xff023B2D),
      ],

      metallicLight: Color(0xffD1FAE5),

      accent: Color(0xff10B981),
    ),

    // ==============================================================
    // 04 — SAPPHIRE BLUE
    // ==============================================================

    _PremiumCardData(
      title: 'SAPPHIRE',
      subtitle: 'BLUE METALLIC',
      number: '04',
      icon: Icons.layers_rounded,

      colors: [
        Color(0xff061329),
        Color(0xff0C2A5A),
        Color(0xff1D4ED8),
        Color(0xff3B82F6),
        Color(0xff93C5FD),
        Color(0xff2563EB),
        Color(0xff09204A),
      ],

      metallicLight: Color(0xffDBEAFE),

      accent: Color(0xff3B82F6),
    ),
  ];

  // ================================================================
  // FIXED POSITIONS
  // ================================================================

  static const List<_CardPosition> cardPositions = [
    _CardPosition(
      left: 45,
      top: 105,
    ),
    _CardPosition(
      left: 135,
      top: 135,
    ),
    _CardPosition(
      left: 45,
      top: 265,
    ),
    _CardPosition(
      left: 135,
      top: 295,
    ),
  ];

  // ================================================================
  // INIT
  // ================================================================

  @override
  void initState() {
    super.initState();

    // --------------------------------------------------------------
    // BOUNCE
    // --------------------------------------------------------------

    bounceController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 850,
      ),
    );

    // --------------------------------------------------------------
    // RETURN ROTATION
    // --------------------------------------------------------------

    returnController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 420,
      ),
    );

    // --------------------------------------------------------------
    // START AUTOMATIC ANIMATION
    // --------------------------------------------------------------

    Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
          () {
        if (!mounted) return;

        _activateCard(
          0,
          restartSequence: true,
        );
      },
    );
  }

  // ================================================================
  // AUTOMATIC SEQUENCE
  // ================================================================

  void _startSequence() {
    sequenceTimer?.cancel();

    sequenceTimer = Timer.periodic(
      const Duration(
        milliseconds: 1600,
      ),
          (_) {
        if (!mounted || isDragging) {
          return;
        }

        final next =
            (activeCard + 1) % cards.length;

        _activateCard(next);
      },
    );
  }

  // ================================================================
  // ACTIVATE CARD
  // ================================================================

  void _activateCard(
      int index, {
        bool restartSequence = false,
      }) {
    if (!mounted) return;

    setState(() {
      activeCard = index;

      rotationX = 0;
      rotationY = 0;
    });

    // --------------------------------------------------------------
    // BOUNCE
    // --------------------------------------------------------------

    bounceController.forward(
      from: 0,
    );

    if (restartSequence) {
      _startSequence();
    }
  }

  // ================================================================
  // BUILD
  // ================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xffFFFFFF,
      ),

      body: SafeArea(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            bounceController,
            returnController,
          ]),

          builder: (
              context,
              child,
              ) {
            return Stack(
              children: [
                // ====================================================
                // PURE WHITE BACKGROUND
                // ====================================================

                const Positioned.fill(
                  child: ColoredBox(
                    color: Color(
                      0xffFFFFFF,
                    ),
                  ),
                ),

                // ====================================================
                // VERY SUBTLE FLOOR SHADOW
                // ====================================================

                Positioned(
                  left: 45,
                  right: 45,
                  top: 220,

                  child: Container(
                    height: 300,

                    decoration:
                    const BoxDecoration(
                      gradient:
                      RadialGradient(
                        colors: [
                          Color(0x14000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ),

                // ====================================================
                // TITLE
                // ====================================================

                Positioned(
                  top: 24,
                  left: 0,
                  right: 0,

                  child:
                  _buildTitle(),
                ),

                // ====================================================
                // CARDS
                // ====================================================

                Center(
                  child: SizedBox(
                    width: 380,
                    height: 570,

                    child: Stack(
                      clipBehavior:
                      Clip.none,

                      children: [
                        for (
                        int i = 0;
                        i < cards.length;
                        i++
                        )
                          _buildCard(i),
                      ],
                    ),
                  ),
                ),

                // ====================================================
                // BOTTOM INDICATOR
                // ====================================================

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 18,

                  child:
                  _buildBottomIndicator(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ================================================================
  // TITLE
  // ================================================================

  Widget _buildTitle() {
    return Column(
      children: [
        const Text(
          'FLUID',

          style: TextStyle(
            color: Color(
              0xff111827,
            ),

            fontSize: 27,

            fontWeight:
            FontWeight.w900,

            letterSpacing: 5.5,
          ),
        ),

        const SizedBox(
          height: 4,
        ),

        const Text(
          'PREMIUM METALLIC MOTION',

          style: TextStyle(
            color: Color(
              0xff64748B,
            ),

            fontSize: 8,

            fontWeight:
            FontWeight.w800,

            letterSpacing: 2.6,
          ),
        ),
      ],
    );
  }

  // ================================================================
  // CARD
  // ================================================================

  Widget _buildCard(
      int index,
      ) {
    final card =
    cards[index];

    final bool isActive =
        index == activeCard;

    final position =
    cardPositions[index];

    // --------------------------------------------------------------
    // BOUNCE
    // --------------------------------------------------------------

    final double bounce =
    isActive
        ? sin(
      bounceController
          .value *
          pi,
    ) *
        17
        : 0;

    // --------------------------------------------------------------
    // SCALE
    // --------------------------------------------------------------

    final double scale =
    isActive
        ? 1 +
        sin(
          bounceController
              .value *
              pi,
        ) *
            .035
        : 1;

    // --------------------------------------------------------------
    // SMALL ROTATION
    // --------------------------------------------------------------

    final double bounceRotation =
    isActive
        ? sin(
      bounceController
          .value *
          pi,
    ) *
        .008
        : 0;

    // --------------------------------------------------------------
    // 3D ROTATION
    // --------------------------------------------------------------

    final double rx =
    isActive
        ? rotationX
        : 0;

    final double ry =
    isActive
        ? rotationY
        : 0;

    return Positioned(
      left: position.left,
      top: position.top,

      child:
      Transform.translate(
        offset: Offset(
          0,
          isActive
              ? -bounce
              : 0,
        ),

        child:
        Transform.scale(
          scale: scale,

          child:
          Transform.rotate(
            angle:
            bounceRotation,

            child: Transform(
              alignment:
              Alignment.center,

              transform:
              Matrix4.identity()
                ..setEntry(
                  3,
                  2,
                  .0016,
                )
                ..rotateX(rx)
                ..rotateY(ry),

              child:
              GestureDetector(
                behavior:
                HitTestBehavior
                    .opaque,

                // ==================================================
                // TAP
                // ==================================================

                onTap: () {
                  sequenceTimer
                      ?.cancel();

                  _activateCard(
                    index,
                  );

                  _startSequence();
                },

                // ==================================================
                // DRAG START
                // ==================================================

                onPanStart:
                    (details) {
                  if (!isActive) {
                    _activateCard(
                      index,
                    );
                  }

                  isDragging =
                  true;

                  sequenceTimer
                      ?.cancel();

                  lastPosition =
                      details
                          .localPosition;
                },

                // ==================================================
                // DRAG UPDATE
                // ==================================================

                onPanUpdate:
                    (details) {
                  if (!isActive) {
                    return;
                  }

                  if (lastPosition ==
                      null) {
                    lastPosition =
                        details
                            .localPosition;

                    return;
                  }

                  final delta =
                      details
                          .localPosition -
                          lastPosition!;

                  setState(() {
                    // Horizontal movement
                    // rotates Y.

                    rotationY +=
                        delta.dx *
                            .014;

                    // Vertical movement
                    // rotates X.

                    rotationX -=
                        delta.dy *
                            .011;

                    rotationX =
                        rotationX.clamp(
                          -.72,
                          .72,
                        );

                    rotationY =
                        rotationY.clamp(
                          -.72,
                          .72,
                        );
                  });

                  lastPosition =
                      details
                          .localPosition;
                },

                // ==================================================
                // DRAG END
                // ==================================================

                onPanEnd: (_) {
                  lastPosition =
                  null;

                  isDragging =
                  false;

                  _springBack();

                  _startSequence();
                },

                // ==================================================
                // CARD
                // ==================================================

                child:
                _buildPremiumCard(
                  card: card,
                  isActive:
                  isActive,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================================================================
  // SPRING BACK
  // ================================================================

  void _springBack() {
    final startX =
        rotationX;

    final startY =
        rotationY;

    returnController.reset();

    returnController.forward();

    void listener() {
      if (!mounted) {
        return;
      }

      final value =
      Curves.easeOutBack
          .transform(
        returnController
            .value,
      );

      setState(() {
        rotationX =
            startX *
                (1 - value);

        rotationY =
            startY *
                (1 - value);
      });

      if (returnController
          .isCompleted) {
        returnController
            .removeListener(
          listener,
        );
      }
    }

    returnController
        .addListener(
      listener,
    );
  }

  // ================================================================
  // PREMIUM METALLIC CARD
  // ================================================================

  Widget _buildPremiumCard({
    required _PremiumCardData card,
    required bool isActive,
  }) {
    return Container(
      width: 215,
      height: 270,

      decoration:
      BoxDecoration(
        borderRadius:
        BorderRadius.circular(
          32,
        ),

        // ==========================================================
        // PURE METALLIC GRADIENT
        // ==========================================================

        gradient:
        LinearGradient(
          begin:
          Alignment.topLeft,

          end:
          Alignment.bottomRight,

          colors: [
            card.colors[0],
            card.colors[1],
            card.colors[2],
            card.colors[3],
            card.metallicLight,
            card.colors[4],
            card.colors[5],
            card.colors[6],
          ],

          stops: const [
            0.00,
            .12,
            .26,
            .38,
            .48,
            .58,
            .78,
            1.00,
          ],
        ),

        // ==========================================================
        // METAL EDGE
        // ==========================================================

        border:
        Border.all(
          color: isActive
              ? card.metallicLight
              : card.metallicLight
              .withValues(
            alpha: .60,
          ),

          width:
          isActive
              ? 1.7
              : 1.0,
        ),

        // ==========================================================
        // NATURAL SHADOW
        // ==========================================================

        boxShadow: [
          BoxShadow(
            color:
            Colors.black
                .withValues(
              alpha:
              isActive
                  ? .25
                  : .16,
            ),

            blurRadius:
            isActive
                ? 30
                : 22,

            offset:
            const Offset(
              0,
              15,
            ),
          ),
        ],
      ),

      child: ClipRRect(
        borderRadius:
        BorderRadius.circular(
          32,
        ),

        child: Stack(
          children: [
            // ======================================================
            // CONTENT
            // ======================================================

            Padding(
              padding:
              const EdgeInsets.all(
                21,
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,

                children: [
                  // ==================================================
                  // TOP ROW
                  // ==================================================

                  Row(
                    children: [
                      // METALLIC ICON
                      Container(
                        width: 45,
                        height: 45,

                        decoration:
                        BoxDecoration(
                          borderRadius:
                          BorderRadius
                              .circular(
                            14,
                          ),

                          gradient:
                          LinearGradient(
                            begin:
                            Alignment
                                .topLeft,

                            end:
                            Alignment
                                .bottomRight,

                            colors: [
                              card
                                  .metallicLight,

                              card
                                  .colors[4],

                              card
                                  .colors[2],
                            ],
                          ),

                          border:
                          Border.all(
                            color:
                            card
                                .metallicLight
                                .withValues(
                              alpha: .75,
                            ),
                          ),
                        ),

                        child: Icon(
                          card.icon,

                          color:
                          card.colors[0],

                          size: 22,
                        ),
                      ),

                      const Spacer(),

                      // NUMBER
                      Container(
                        padding:
                        const EdgeInsets
                            .symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),

                        decoration:
                        BoxDecoration(
                          color:
                          card.colors[0],

                          borderRadius:
                          BorderRadius
                              .circular(
                            20,
                          ),

                          border:
                          Border.all(
                            color:
                            card
                                .metallicLight
                                .withValues(
                              alpha: .35,
                            ),
                          ),
                        ),

                        child: Text(
                          card.number,

                          style:
                          const TextStyle(
                            color:
                            Colors.white,

                            fontSize: 9,

                            fontWeight:
                            FontWeight
                                .w900,

                            letterSpacing:
                            1.5,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // ==================================================
                  // TITLE
                  // ==================================================

                  Text(
                    card.title,

                    style:
                    const TextStyle(
                      color:
                      Colors.white,

                      fontSize: 23,

                      fontWeight:
                      FontWeight
                          .w900,

                      letterSpacing:
                      1.6,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Text(
                    card.subtitle,

                    style:
                    TextStyle(
                      color:
                      card
                          .metallicLight,

                      fontSize: 7,

                      fontWeight:
                      FontWeight
                          .w800,

                      letterSpacing:
                      1.8,
                    ),
                  ),

                  const SizedBox(
                    height: 18,
                  ),

                  // ==================================================
                  // METALLIC DETAIL LINE
                  // ==================================================

                  Row(
                    children: [
                      Container(
                        width: 46,
                        height: 3,

                        decoration:
                        BoxDecoration(
                          borderRadius:
                          BorderRadius
                              .circular(
                            20,
                          ),

                          color:
                          card
                              .metallicLight,
                        ),
                      ),

                      const SizedBox(
                        width: 6,
                      ),

                      Container(
                        width: 8,
                        height: 3,

                        decoration:
                        BoxDecoration(
                          color:
                          card.accent,

                          borderRadius:
                          BorderRadius
                              .circular(
                            20,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  Text(
                    'MOTION • ENERGY • DESIGN',

                    style:
                    TextStyle(
                      color:
                      card
                          .metallicLight
                          .withValues(
                        alpha: .58,
                      ),

                      fontSize: 6.5,

                      fontWeight:
                      FontWeight
                          .w700,

                      letterSpacing:
                      1.1,
                    ),
                  ),
                ],
              ),
            ),

            // ======================================================
            // SIMPLE METALLIC EDGE
            // ======================================================

            if (isActive)
              Positioned.fill(
                child:
                IgnorePointer(
                  child:
                  Container(
                    decoration:
                    BoxDecoration(
                      borderRadius:
                      BorderRadius
                          .circular(
                        32,
                      ),

                      border:
                      Border.all(
                        color: card
                            .metallicLight
                            .withValues(
                          alpha: .90,
                        ),

                        width: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ================================================================
  // BOTTOM INDICATOR
  // ================================================================

  Widget _buildBottomIndicator() {
    final card =
    cards[activeCard];

    return Center(
      child: Container(
        padding:
        const EdgeInsets
            .symmetric(
          horizontal: 17,
          vertical: 9,
        ),

        decoration:
        BoxDecoration(
          color:
          Colors.white,

          borderRadius:
          BorderRadius.circular(
            30,
          ),

          border:
          Border.all(
            color:
            const Color(
              0xffE2E8F0,
            ),
          ),

          boxShadow: [
            BoxShadow(
              color:
              Colors.black
                  .withValues(
                alpha: .07,
              ),

              blurRadius: 18,

              offset:
              const Offset(
                0,
                7,
              ),
            ),
          ],
        ),

        child: Row(
          mainAxisSize:
          MainAxisSize.min,

          children: [
            Icon(
              Icons.touch_app_rounded,

              color:
              card.accent,

              size: 16,
            ),

            const SizedBox(
              width: 7,
            ),

            const Text(
              'TOUCH • TILT • EXPLORE',

              style:
              TextStyle(
                color:
                Color(
                  0xff334155,
                ),

                fontSize: 8.5,

                fontWeight:
                FontWeight.w800,

                letterSpacing:
                1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================================================================
  // DISPOSE
  // ================================================================

  @override
  void dispose() {
    sequenceTimer?.cancel();

    bounceController.dispose();
    returnController.dispose();

    super.dispose();
  }
}

// ==================================================================
// CARD POSITION
// ==================================================================

class _CardPosition {
  final double left;
  final double top;

  const _CardPosition({
    required this.left,
    required this.top,
  });
}

// ==================================================================
// CARD DATA
// ==================================================================

class _PremiumCardData {
  final String title;
  final String subtitle;
  final String number;

  final IconData icon;

  final List<Color> colors;

  final Color metallicLight;
  final Color accent;

  const _PremiumCardData({
    required this.title,
    required this.subtitle,
    required this.number,
    required this.icon,
    required this.colors,
    required this.metallicLight,
    required this.accent,
  });
}