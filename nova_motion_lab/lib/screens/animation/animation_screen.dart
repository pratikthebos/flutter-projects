import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/nova_background.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({
    super.key,
  });

  @override
  State<AnimationScreen> createState() =>
      _AnimationScreenState();
}

class _AnimationScreenState
    extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController rotationController;
  late AnimationController pulseController;
  late AnimationController particleController;

  bool activated = false;

  @override
  void initState() {
    super.initState();

    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 8,
      ),
    )..repeat();

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1800,
      ),
    )..repeat(
      reverse: true,
    );

    particleController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    )..repeat();
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
                  child: GestureDetector(
                    behavior:
                    HitTestBehavior.opaque,
                    onTap: _activate,
                    child: Center(
                      child: AnimatedBuilder(
                        animation: Listenable.merge([
                          rotationController,
                          pulseController,
                          particleController,
                        ]),
                        builder: (
                            context,
                            child,
                            ) {
                          return _buildScene();
                        },
                      ),
                    ),
                  ),
                ),

                _buildBottomText(),

                const SizedBox(
                  height: 30,
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
          _iconButton(
            Icons.arrow_back_rounded,
                () => Navigator.pop(context),
          ),

          const SizedBox(
            width: 14,
          ),

          const Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                '01 / 06',
                style: TextStyle(
                  color: AppColors.purple,
                  fontSize: 10,
                  fontWeight:
                  FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'ANIMATION UI',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight:
                  FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),

          const Spacer(),

          Container(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white
                    .withValues(alpha: .10),
              ),
              color: Colors.white
                  .withValues(alpha: .04),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.auto_awesome_rounded,
                  size: 14,
                  color: AppColors.cyan,
                ),
                SizedBox(width: 5),
                Text(
                  'MOTION',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight:
                    FontWeight.w800,
                    letterSpacing: 1.2,
                    color:
                    AppColors.silver,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconButton(
      IconData icon,
      VoidCallback onTap,
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
              .withValues(alpha: .06),
          border: Border.all(
            color: Colors.white
                .withValues(alpha: .10),
          ),
        ),
        child: Icon(
          icon,
          size: 20,
          color: AppColors.white,
        ),
      ),
    );
  }

  // ============================================================
  // MAIN ANIMATION
  // ============================================================

  Widget _buildScene() {
    final rotation =
        rotationController.value * pi * 2;

    final pulse =
        1 +
            sin(
              pulseController.value * pi,
            ) *
                .06;

    return SizedBox(
      width: 330,
      height: 420,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ------------------------------------------------------
          // PARTICLES
          // ------------------------------------------------------

          ..._buildParticles(),

          // ------------------------------------------------------
          // OUTER ROTATING RING
          // ------------------------------------------------------

          Transform.rotate(
            angle: rotation,
            child: Container(
              width: 285,
              height: 285,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.purple
                      .withValues(alpha: .22),
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -5,
                    left: 140,
                    child: _ringDot(
                      AppColors.cyan,
                      10,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 12,
                    child: _ringDot(
                      AppColors.pink,
                      7,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ------------------------------------------------------
          // SECOND RING
          // ------------------------------------------------------

          Transform.rotate(
            angle: -rotation * .65,
            child: Container(
              width: 230,
              height: 230,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.cyan
                      .withValues(alpha: .18),
                  width: 1.2,
                ),
              ),
            ),
          ),

          // ------------------------------------------------------
          // DASHED-STYLE INNER RING
          // ------------------------------------------------------

          Transform.rotate(
            angle: rotation * .35,
            child: SizedBox(
              width: 190,
              height: 190,
              child: CustomPaint(
                painter:
                _DashedRingPainter(
                  color: AppColors.pink
                      .withValues(alpha: .35),
                ),
              ),
            ),
          ),

          // ------------------------------------------------------
          // CENTRAL OBJECT
          // ------------------------------------------------------

          Transform.scale(
            scale: pulse,
            child: GestureDetector(
              onTap: _activate,
              child: AnimatedContainer(
                duration:
                const Duration(
                  milliseconds: 500,
                ),
                curve:
                Curves.easeOutBack,
                width:
                activated ? 135 : 120,
                height:
                activated ? 135 : 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin:
                    Alignment.topLeft,
                    end:
                    Alignment.bottomRight,
                    colors: activated
                        ? const [
                      AppColors.pink,
                      AppColors.purple,
                      AppColors.cyan,
                    ]
                        : const [
                      AppColors.purple,
                      AppColors.violet,
                      AppColors.blue,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.purple
                          .withValues(
                        alpha:
                        activated
                            ? .45
                            : .25,
                      ),
                      blurRadius:
                      activated
                          ? 60
                          : 40,
                      spreadRadius:
                      activated ? 8 : 2,
                    ),
                  ],
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration:
                    const Duration(
                      milliseconds: 350,
                    ),
                    child: Icon(
                      activated
                          ? Icons.check_rounded
                          : Icons
                          .auto_awesome_rounded,
                      key: ValueKey(
                        activated,
                      ),
                      size:
                      activated
                          ? 55
                          : 48,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ------------------------------------------------------
          // SMALL ORBITING DOT
          // ------------------------------------------------------

          Transform.rotate(
            angle: rotation * 1.5,
            child: Transform.translate(
              offset:
              const Offset(0, -160),
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                  AppColors.cyan,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.cyan
                          .withValues(
                        alpha: .55,
                      ),
                      blurRadius: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PARTICLES
  // ============================================================

  List<Widget> _buildParticles() {
    final particles = <Widget>[];

    final positions = [
      const Offset(40, 80),
      const Offset(275, 90),
      const Offset(25, 230),
      const Offset(300, 250),
      const Offset(75, 345),
      const Offset(255, 350),
      const Offset(155, 30),
      const Offset(165, 385),
    ];

    final colors = [
      AppColors.purple,
      AppColors.cyan,
      AppColors.pink,
      AppColors.emerald,
    ];

    for (int i = 0;
    i < positions.length;
    i++) {
      final phase =
          particleController.value *
              pi *
              2;

      final movement =
          sin(phase + i) * 8;

      particles.add(
        Positioned(
          left:
          positions[i].dx + movement,
          top:
          positions[i].dy +
              cos(phase + i) * 6,
          child: Opacity(
            opacity:
            .35 +
                sin(
                  phase + i,
                ).abs() *
                    .5,
            child: Container(
              width: i.isEven ? 5 : 3,
              height: i.isEven ? 5 : 3,
              decoration:
              BoxDecoration(
                shape:
                BoxShape.circle,
                color:
                colors[i % colors.length],
                boxShadow: [
                  BoxShadow(
                    color:
                    colors[i %
                        colors.length]
                        .withValues(
                      alpha: .5,
                    ),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return particles;
  }

  Widget _ringDot(
      Color color,
      double size,
      ) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color:
            color.withValues(
              alpha: .6,
            ),
            blurRadius: 14,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOTTOM INFORMATION
  // ============================================================

  Widget _buildBottomText() {
    return AnimatedSwitcher(
      duration:
      const Duration(milliseconds: 400),
      child: Column(
        key: ValueKey(activated),
        children: [
          Text(
            activated
                ? 'MOTION ACTIVATED'
                : 'TOUCH THE CORE',
            style: TextStyle(
              color: activated
                  ? AppColors.cyan
                  : AppColors.silver,
              fontSize: 12,
              fontWeight:
              FontWeight.w800,
              letterSpacing: 2.5,
            ),
          ),

          const SizedBox(
            height: 8,
          ),

          Text(
            activated
                ? 'INTERACTION COMPLETE'
                : 'EXPLORE THE MOTION',
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 10,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // TAP
  // ============================================================

  void _activate() {
    setState(() {
      activated = !activated;
    });
  }

  @override
  void dispose() {
    rotationController.dispose();
    pulseController.dispose();
    particleController.dispose();
    super.dispose();
  }
}

// ================================================================
// DASHED RING PAINTER
// ================================================================

class _DashedRingPainter
    extends CustomPainter {
  final Color color;

  const _DashedRingPainter({
    required this.color,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius =
        size.width / 2 - 2;

    const dashCount = 32;

    for (int i = 0;
    i < dashCount;
    i++) {
      final start =
          (i / dashCount) *
              pi *
              2;

      final end =
          start +
              pi / 24;

      canvas.drawArc(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
        start,
        end - start,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant _DashedRingPainter oldDelegate,
      ) {
    return oldDelegate.color != color;
  }
}