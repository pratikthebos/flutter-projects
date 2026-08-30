import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/nova_background.dart';

class NovaSpaceScreen extends StatefulWidget {
  const NovaSpaceScreen({
    super.key,
  });

  @override
  State<NovaSpaceScreen> createState() =>
      _NovaSpaceScreenState();
}

class _NovaSpaceScreenState
    extends State<NovaSpaceScreen>
    with TickerProviderStateMixin {
  // ============================================================
  // ANIMATION CONTROLLERS
  // ============================================================

  late AnimationController planetController;
  late AnimationController orbitController;
  late AnimationController atmosphereController;
  late AnimationController pulseController;
  late AnimationController starController;

  // ============================================================
  // MANUAL PLANET ROTATION
  // ============================================================

  double manualRotation = 0.0;

  Offset? lastPosition;

  bool selected = false;

  @override
  void initState() {
    super.initState();

    // ==========================================================
    // PLANET ROTATION
    // ==========================================================

    planetController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 6,
      ),
    )..repeat();

    // ==========================================================
    // ORBIT ANIMATION
    // ==========================================================

    orbitController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 12,
      ),
    )..repeat();

    // ==========================================================
    // ATMOSPHERE
    // ==========================================================

    atmosphereController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    )..repeat();

    // ==========================================================
    // PLANET BREATHING
    // ==========================================================

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2200,
      ),
    )..repeat(
      reverse: true,
    );

    // ==========================================================
    // STARS
    // ==========================================================

    starController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 7,
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
                    behavior: HitTestBehavior.opaque,

                    // ==================================================
                    // TOUCH START
                    // ==================================================

                    onPanStart: (details) {
                      lastPosition =
                          details.localPosition;
                    },

                    // ==================================================
                    // TOUCH / DRAG
                    // ==================================================

                    onPanUpdate: (details) {
                      if (lastPosition == null) {
                        lastPosition =
                            details.localPosition;
                        return;
                      }

                      final Offset delta =
                          details.localPosition -
                              lastPosition!;

                      setState(() {
                        // Drag horizontally to rotate
                        // planet faster.
                        manualRotation +=
                            delta.dx * 0.025;
                      });

                      lastPosition =
                          details.localPosition;
                    },

                    // ==================================================
                    // TOUCH END
                    // ==================================================

                    onPanEnd: (_) {
                      lastPosition = null;
                    },

                    child: Center(
                      child: AnimatedBuilder(
                        animation: Listenable.merge([
                          planetController,
                          orbitController,
                          atmosphereController,
                          pulseController,
                          starController,
                        ]),
                        builder: (
                            context,
                            child,
                            ) {
                          return _buildSpaceScene();
                        },
                      ),
                    ),
                  ),
                ),

                _buildBottomInformation(),

                const SizedBox(
                  height: 28,
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
                  alpha: 0.055,
                ),
                border: Border.all(
                  color: Colors.white.withValues(
                    alpha: 0.10,
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
                '04 / 06',
                style: TextStyle(
                  color: AppColors.purple,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'NOVA SPACE',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
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
              color: AppColors.purple.withValues(
                alpha: 0.08,
              ),
              border: Border.all(
                color: AppColors.purple
                    .withValues(
                  alpha: 0.18,
                ),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.public_rounded,
                  size: 14,
                  color: AppColors.purple,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'SPACE',
                  style: TextStyle(
                    color: AppColors.silver,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
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
  // SPACE SCENE
  // ============================================================

  Widget _buildSpaceScene() {
    // Automatic planet rotation.
    final double automaticRotation =
        planetController.value *
            pi *
            2;

    // Automatic + manual rotation.
    final double totalRotation =
        automaticRotation +
            manualRotation;

    // Main orbit.
    final double orbit =
        orbitController.value *
            pi *
            2;

    // Atmosphere.
    final double atmosphere =
        atmosphereController.value *
            pi *
            2;

    // Stars.
    final double starMotion =
        starController.value *
            pi *
            2;

    // Planet breathing.
    final double breathing =
        1.0 +
            sin(
              pulseController.value *
                  pi,
            ) *
                0.018;

    return LayoutBuilder(
      builder: (
          context,
          constraints,
          ) {
        final double width = min(
          constraints.maxWidth,
          380.0,
        );

        final double height = min(
          constraints.maxHeight,
          510.0,
        );

        return SizedBox(
          width: width,
          height: height,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // ==================================================
              // STARS
              // ==================================================

              ..._buildStars(
                starMotion,
                width,
                height,
              ),

              // ==================================================
              // SPACE GLOW
              // ==================================================

              Container(
                width: width * 0.90,
                height: width * 0.90,
                decoration:
                const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0x1A3B82F6),
                      Color(0x0F8B5CF6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              // ==================================================
              // ORBIT 1
              // ==================================================

              Transform.rotate(
                angle: orbit,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(0.70),
                  child: _buildOrbitRing(
                    size: width * 0.82,
                    color: AppColors.cyan,
                    dotColor: AppColors.cyan,
                    dotSize: 9,
                  ),
                ),
              ),

              // ==================================================
              // ORBIT 2
              // ==================================================

              Transform.rotate(
                angle: -orbit * 0.70,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(0.55),
                  child: _buildOrbitRing(
                    size: width * 0.68,
                    color: AppColors.purple,
                    dotColor: AppColors.pink,
                    dotSize: 7,
                  ),
                ),
              ),

              // ==================================================
              // ORBIT 3
              // ==================================================

              Transform.rotate(
                angle: orbit * 1.35,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(0.42),
                  child: _buildOrbitRing(
                    size: width * 0.55,
                    color: AppColors.pink,
                    dotColor: AppColors.pink,
                    dotSize: 6,
                  ),
                ),
              ),

              // ==================================================
              // SATELLITE 1
              // ==================================================

              Transform.rotate(
                angle: orbit,
                child: Transform.translate(
                  offset: Offset(
                    0,
                    -width * 0.41,
                  ),
                  child: Transform.rotate(
                    angle: -orbit,
                    child: _buildSatellite(
                      type: 1,
                      size: 31,
                    ),
                  ),
                ),
              ),

              // ==================================================
              // SATELLITE 2
              // ==================================================

              Transform.rotate(
                angle: -orbit * 0.70,
                child: Transform.translate(
                  offset: Offset(
                    0,
                    -width * 0.34,
                  ),
                  child: Transform.rotate(
                    angle: orbit * 0.70,
                    child: _buildSatellite(
                      type: 2,
                      size: 27,
                    ),
                  ),
                ),
              ),

              // ==================================================
              // SATELLITE 3
              // ==================================================

              Transform.rotate(
                angle: orbit * 1.35,
                child: Transform.translate(
                  offset: Offset(
                    0,
                    -width * 0.275,
                  ),
                  child: Transform.rotate(
                    angle: -orbit * 1.35,
                    child: _buildSatellite(
                      type: 3,
                      size: 24,
                    ),
                  ),
                ),
              ),

              // ==================================================
              // ATMOSPHERE
              // ==================================================

              Transform.scale(
                scale: breathing,
                child: _buildAtmosphere(
                  atmosphere,
                ),
              ),

              // ==================================================
              // PLANET
              // ==================================================

              Transform.scale(
                scale: breathing,
                child: GestureDetector(
                  behavior:
                  HitTestBehavior.opaque,
                  onTap: _togglePlanet,
                  child: _buildPlanet(),
                ),
              ),

              // ==================================================
              // ROTATING PLANET SURFACE
              // ==================================================

              Transform.scale(
                scale: breathing,
                child: IgnorePointer(
                  child:
                  _buildRotatingPlanet(
                    totalRotation,
                  ),
                ),
              ),

              // ==================================================
              // PLANET HIGHLIGHT
              // ==================================================

              _buildPlanetHighlight(),

              // ==================================================
              // ROTATION INDICATOR
              // ==================================================

              Positioned(
                top: height * 0.08,
                child:
                _rotationIndicator(
                  totalRotation,
                ),
              ),

              // ==================================================
              // SECTOR
              // ==================================================

              Positioned(
                left: 8,
                bottom: height * 0.15,
                child: _dataBox(
                  'SECTOR',
                  'NOVA-04',
                ),
              ),

              // ==================================================
              // STATUS
              // ==================================================

              Positioned(
                right: 8,
                bottom: height * 0.21,
                child: _dataBox(
                  'STATUS',
                  selected
                      ? 'ACTIVE'
                      : 'STABLE',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ============================================================
  // PLANET
  // ============================================================

  Widget _buildPlanet() {
    final Color mainColor =
    selected
        ? AppColors.cyan
        : AppColors.purple;

    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        gradient:
        const RadialGradient(
          center: Alignment(
            -0.30,
            -0.32,
          ),
          radius: 0.82,
          colors: [
            Color(0xffF2FDFF),
            Color(0xffA5F3FC),
            Color(0xff22D3EE),
            Color(0xff3B82F6),
            Color(0xff6366F1),
            Color(0xff31165F),
            Color(0xff070714),
          ],
          stops: [
            0.0,
            0.10,
            0.22,
            0.38,
            0.58,
            0.80,
            1.0,
          ],
        ),

        border: Border.all(
          color: Colors.white.withValues(
            alpha: 0.18,
          ),
          width: 1.2,
        ),

        boxShadow: [
          BoxShadow(
            color: mainColor.withValues(
              alpha: selected
                  ? 0.42
                  : 0.25,
            ),
            blurRadius: selected
                ? 60
                : 45,
            spreadRadius: selected
                ? 8
                : 2,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ROTATING PLANET SURFACE
  // ============================================================

  Widget _buildRotatingPlanet(
      double rotation,
      ) {
    return SizedBox(
      width: 170,
      height: 170,
      child: ClipOval(
        child: CustomPaint(
          painter:
          _RotatingPlanetPainter(
            rotation: rotation,
            selected: selected,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ATMOSPHERE
  // ============================================================

  Widget _buildAtmosphere(
      double progress,
      ) {
    final double pulse =
        (sin(progress) + 1) / 2;

    final double opacity =
        0.16 + pulse * 0.12;

    final double scale =
        1.0 + pulse * 0.025;

    return Transform.scale(
      scale: scale,
      child: SizedBox(
        width: 204,
        height: 204,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 202,
              height: 202,
              decoration:
              BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.cyan
                      .withValues(
                    alpha: opacity,
                  ),
                  width: 2.3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.cyan
                        .withValues(
                      alpha: 0.14,
                    ),
                    blurRadius: 28,
                    spreadRadius: 3,
                  ),
                ],
              ),
            ),

            Container(
              width: 190,
              height: 190,
              decoration:
              BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.purple
                      .withValues(
                    alpha: 0.20,
                  ),
                  width: 1.5,
                ),
              ),
            ),

            Transform.rotate(
              angle: progress,
              child: CustomPaint(
                size: const Size(
                  204,
                  204,
                ),
                painter:
                _AtmosphereArcPainter(
                  color:
                  AppColors.cyan,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // PLANET HIGHLIGHT
  // ============================================================

  Widget _buildPlanetHighlight() {
    return IgnorePointer(
      child: SizedBox(
        width: 170,
        height: 170,
        child: ClipOval(
          child: Stack(
            children: [
              Positioned(
                left: 27,
                top: 20,
                child: Container(
                  width: 45,
                  height: 23,
                  decoration:
                  BoxDecoration(
                    borderRadius:
                    BorderRadius
                        .circular(
                      50,
                    ),
                    color:
                    Colors.white
                        .withValues(
                      alpha: 0.13,
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 18,
                bottom: 20,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration:
                  const BoxDecoration(
                    shape:
                    BoxShape.circle,
                    gradient:
                    RadialGradient(
                      colors: [
                        Colors.transparent,
                        Color(
                          0x66000000,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ORBIT RING
  // ============================================================

  Widget _buildOrbitRing({
    required double size,
    required Color color,
    required Color dotColor,
    required double dotSize,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior:
        Clip.none,
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter:
              _OrbitPainter(
                color:
                color.withValues(
                  alpha: 0.18,
                ),
              ),
            ),
          ),

          Positioned(
            top:
            -dotSize / 2,
            left:
            size / 2 -
                dotSize / 2,
            child: _spaceDot(
              dotColor,
              dotSize,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SATELLITES
  // ============================================================

  Widget _buildSatellite({
    required int type,
    required double size,
  }) {
    Color primary;
    Color secondary;
    IconData icon;

    switch (type) {
      case 1:
        primary =
        const Color(0xffE2E8F0);
        secondary =
        const Color(0xff64748B);
        icon =
            Icons.satellite_alt_rounded;
        break;

      case 2:
        primary =
        const Color(0xffC4B5FD);
        secondary =
        const Color(0xff7C3AED);
        icon =
            Icons.rocket_launch_rounded;
        break;

      default:
        primary =
        const Color(0xffA5F3FC);
        secondary =
        const Color(0xff0891B2);
        icon =
            Icons.satellite_alt_rounded;
    }

    return Container(
      width: size,
      height: size * 0.72,
      decoration:
      BoxDecoration(
        borderRadius:
        BorderRadius.circular(
          6,
        ),
        gradient:
        LinearGradient(
          begin:
          Alignment.topLeft,
          end:
          Alignment.bottomRight,
          colors: [
            primary,
            secondary,
            const Color(
              0xff20242B,
            ),
          ],
        ),
        border:
        Border.all(
          color:
          Colors.white.withValues(
            alpha: 0.42,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color:
            secondary.withValues(
              alpha: 0.45,
            ),
            blurRadius: 13,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Icon(
        icon,
        color:
        const Color(
          0xff151922,
        ),
        size: size * 0.48,
      ),
    );
  }

  // ============================================================
  // STARS
  // ============================================================

  List<Widget> _buildStars(
      double motion,
      double width,
      double height,
      ) {
    const List<Offset>
    positions = [
      Offset(28, 55),
      Offset(80, 25),
      Offset(150, 65),
      Offset(275, 45),
      Offset(320, 105),
      Offset(25, 165),
      Offset(305, 205),
      Offset(55, 300),
      Offset(285, 330),
      Offset(110, 390),
      Offset(230, 410),
      Offset(165, 450),
    ];

    const List<Color>
    colors = [
      AppColors.white,
      AppColors.cyan,
      AppColors.purple,
      AppColors.pink,
    ];

    final List<Widget> stars =
    [];

    for (int i = 0;
    i < positions.length;
    i++) {
      final double opacity =
          0.20 +
              sin(
                motion +
                    i * 0.8,
              ).abs() *
                  0.75;

      final double size =
      i % 3 == 0
          ? 4.0
          : 2.5;

      final double left =
          positions[i].dx /
              350 *
              width;

      final double top =
          positions[i].dy /
              470 *
              height;

      final Color color =
      colors[
      i %
          colors.length];

      stars.add(
        Positioned(
          left: left,
          top: top,
          child: Opacity(
            opacity:
            opacity.clamp(
              0.0,
              1.0,
            ),
            child:
            Container(
              width: size,
              height: size,
              decoration:
              BoxDecoration(
                shape:
                BoxShape.circle,
                color: color,
                boxShadow: [
                  BoxShadow(
                    color:
                    color.withValues(
                      alpha: 0.60,
                    ),
                    blurRadius: 9,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return stars;
  }

  // ============================================================
  // SPACE DOT
  // ============================================================

  Widget _spaceDot(
      Color color,
      double size,
      ) {
    return Container(
      width: size,
      height: size,
      decoration:
      BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color:
            color.withValues(
              alpha: 0.70,
            ),
            blurRadius: 16,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ROTATION INDICATOR
  // ============================================================

  Widget _rotationIndicator(
      double rotation,
      ) {
    double degrees =
        (rotation * 180 / pi) %
            360;

    if (degrees < 0) {
      degrees += 360;
    }

    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 8,
      ),
      decoration:
      BoxDecoration(
        borderRadius:
        BorderRadius.circular(
          20,
        ),
        color:
        Colors.black.withValues(
          alpha: 0.20,
        ),
        border:
        Border.all(
          color:
          Colors.white.withValues(
            alpha: 0.10,
          ),
        ),
      ),
      child: Row(
        mainAxisSize:
        MainAxisSize.min,
        children: [
          const Icon(
            Icons.rotate_right_rounded,
            size: 14,
            color:
            AppColors.cyan,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            '${degrees.toInt()}°',
            style:
            const TextStyle(
              color:
              AppColors.white,
              fontSize: 10,
              fontWeight:
              FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DATA BOX
  // ============================================================

  Widget _dataBox(
      String title,
      String value,
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
          12,
        ),
        color:
        Colors.white.withValues(
          alpha: 0.035,
        ),
        border:
        Border.all(
          color:
          Colors.white.withValues(
            alpha: 0.08,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
            const TextStyle(
              color:
              AppColors.muted,
              fontSize: 7,
              fontWeight:
              FontWeight.w800,
              letterSpacing: 1.4,
            ),
          ),

          const SizedBox(
            height: 3,
          ),

          Text(
            value,
            style:
            const TextStyle(
              color:
              AppColors.white,
              fontSize: 9,
              fontWeight:
              FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOTTOM INFORMATION
  // ============================================================

  Widget _buildBottomInformation() {
    return AnimatedSwitcher(
      duration:
      const Duration(
        milliseconds: 300,
      ),
      child: Column(
        key: ValueKey(
          selected,
        ),
        children: [
          Text(
            selected
                ? 'PLANET SELECTED'
                : 'NOVA-04 // DEEP SPACE',
            style: TextStyle(
              color: selected
                  ? AppColors.cyan
                  : AppColors.silver,
              fontSize: 12,
              fontWeight:
              FontWeight.w900,
              letterSpacing: 2.2,
            ),
          ),

          const SizedBox(
            height: 8,
          ),

          Text(
            selected
                ? 'EXPLORATION MODE ENABLED'
                : 'DRAG PLANET • ROTATE 360° • EXPLORE',
            style:
            const TextStyle(
              color:
              AppColors.muted,
              fontSize: 9,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PLANET TAP
  // ============================================================

  void _togglePlanet() {
    setState(() {
      selected = !selected;
    });
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    planetController.dispose();
    orbitController.dispose();
    atmosphereController.dispose();
    pulseController.dispose();
    starController.dispose();

    super.dispose();
  }
}

// =================================================================
// ORBIT PAINTER
// =================================================================

class _OrbitPainter
    extends CustomPainter {
  final Color color;

  const _OrbitPainter({
    required this.color,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final Paint paint =
    Paint()
      ..color = color
      ..style =
          PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final Rect rect =
    Rect.fromCircle(
      center: Offset(
        size.width / 2,
        size.height / 2,
      ),
      radius:
      size.width / 2 - 1,
    );

    canvas.drawOval(
      rect,
      paint,
    );
  }

  @override
  bool shouldRepaint(
      covariant _OrbitPainter
      oldDelegate,
      ) {
    return oldDelegate.color !=
        color;
  }
}

// =================================================================
// ATMOSPHERE ARC PAINTER
// =================================================================

class _AtmosphereArcPainter
    extends CustomPainter {
  final Color color;

  const _AtmosphereArcPainter({
    required this.color,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final Paint paint =
    Paint()
      ..color = color
      ..style =
          PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap =
          StrokeCap.round;

    final Rect rect =
    Rect.fromCircle(
      center: Offset(
        size.width / 2,
        size.height / 2,
      ),
      radius:
      size.width / 2 - 3,
    );

    canvas.drawArc(
      rect,
      -pi * 0.35,
      pi * 0.80,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(
      covariant _AtmosphereArcPainter
      oldDelegate,
      ) {
    return oldDelegate.color !=
        color;
  }
}

// =================================================================
// ROTATING PLANET PAINTER
// =================================================================

class _RotatingPlanetPainter
    extends CustomPainter {
  final double rotation;
  final bool selected;

  const _RotatingPlanetPainter({
    required this.rotation,
    required this.selected,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final double cx =
        size.width / 2;

    final double cy =
        size.height / 2;

    final Paint linePaint =
    Paint()
      ..style =
          PaintingStyle.stroke
      ..strokeWidth = 1.2;

    // ============================================================
    // LONGITUDE LINES
    // ============================================================

    for (int i = -7;
    i <= 7;
    i++) {
      final double phase =
          rotation +
              i * 0.42;

      final double wave =
      sin(phase);

      final double ellipseWidth =
          size.width *
              (0.10 +
                  wave.abs() *
                      0.82);

      final double offsetX =
          wave *
              size.width *
              0.16;

      linePaint.color =
          Colors.white.withValues(
            alpha:
            0.055 +
                wave.abs() *
                    0.075,
          );

      final Rect longitude =
      Rect.fromCenter(
        center: Offset(
          cx + offsetX,
          cy,
        ),
        width:
        ellipseWidth,
        height:
        size.height * 0.91,
      );

      canvas.drawOval(
        longitude,
        linePaint,
      );
    }

    // ============================================================
    // LATITUDE LINES
    // ============================================================

    for (int i = -3;
    i <= 3;
    i++) {
      final double y =
          cy +
              i *
                  size.height *
                  0.125;

      linePaint.color =
          Colors.white.withValues(
            alpha: 0.045,
          );

      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(
            cx,
            y,
          ),
          width:
          size.width * 0.80,
          height:
          size.height * 0.20,
        ),
        linePaint,
      );
    }

    // ============================================================
    // MOVING CONTINENTS
    // ============================================================

    final double shift =
        sin(rotation) *
            size.width *
            0.24;

    final double shift2 =
        cos(rotation) *
            size.width *
            0.18;

    final Color continentColor =
    selected
        ? AppColors.cyan
        : Colors.white;

    final Paint continentPaint =
    Paint()
      ..style =
          PaintingStyle.fill
      ..color =
      continentColor
          .withValues(
        alpha: 0.15,
      );

    _drawContinent(
      canvas,
      continentPaint,
      Offset(
        cx - 42 + shift,
        cy - 35,
      ),
      36,
      20,
    );

    _drawContinent(
      canvas,
      continentPaint,
      Offset(
        cx + 30 - shift2,
        cy + 4,
      ),
      31,
      17,
    );

    _drawContinent(
      canvas,
      continentPaint,
      Offset(
        cx - 5 + shift2,
        cy + 43,
      ),
      23,
      12,
    );

    // ============================================================
    // MOVING MARKER
    // ============================================================

    final double markerX =
        cx +
            cos(rotation) *
                32;

    final double markerY =
        cy +
            sin(rotation) *
                18;

    final Paint markerPaint =
    Paint()
      ..color =
      selected
          ? AppColors.cyan
          : AppColors.purple;

    canvas.drawCircle(
      Offset(
        markerX,
        markerY,
      ),
      3.5,
      markerPaint,
    );
  }

  // ============================================================
  // CONTINENT
  // ============================================================

  void _drawContinent(
      Canvas canvas,
      Paint paint,
      Offset center,
      double width,
      double height,
      ) {
    final Path path =
    Path();

    path.moveTo(
      center.dx -
          width * 0.50,
      center.dy,
    );

    path.quadraticBezierTo(
      center.dx -
          width * 0.30,
      center.dy -
          height,
      center.dx +
          width * 0.05,
      center.dy -
          height * 0.55,
    );

    path.quadraticBezierTo(
      center.dx +
          width * 0.62,
      center.dy -
          height * 0.20,
      center.dx +
          width * 0.42,
      center.dy +
          height * 0.40,
    );

    path.quadraticBezierTo(
      center.dx +
          width * 0.12,
      center.dy +
          height,
      center.dx -
          width * 0.32,
      center.dy +
          height * 0.50,
    );

    path.close();

    canvas.drawPath(
      path,
      paint,
    );
  }

  @override
  bool shouldRepaint(
      covariant _RotatingPlanetPainter
      oldDelegate,
      ) {
    return oldDelegate.rotation !=
        rotation ||
        oldDelegate.selected !=
            selected;
  }
}