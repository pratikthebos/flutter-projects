import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/nova_background.dart';

class NovaWaveScreen extends StatefulWidget {
  const NovaWaveScreen({
    super.key,
  });

  @override
  State<NovaWaveScreen> createState() =>
      _NovaWaveScreenState();
}

class _NovaWaveScreenState extends State<NovaWaveScreen>
    with TickerProviderStateMixin {
  late AnimationController waveController;
  late AnimationController rotationController;
  late AnimationController pulseController;

  bool playing = true;
  bool touching = false;

  double touchX = 0;

  @override
  void initState() {
    super.initState();

    // Main waveform animation.
    waveController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1100,
      ),
    )..repeat();

    // Slow rotating rings.
    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 14,
      ),
    )..repeat();

    // Center core breathing animation.
    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1700,
      ),
    )..repeat(
      reverse: true,
    );
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

                    onPanStart: (details) {
                      setState(() {
                        touching = true;
                        touchX =
                            details.localPosition.dx;
                      });
                    },

                    onPanUpdate: (details) {
                      setState(() {
                        touchX =
                            details.localPosition.dx;
                      });
                    },

                    onPanEnd: (_) {
                      setState(() {
                        touching = false;
                      });
                    },

                    child: Center(
                      child: AnimatedBuilder(
                        animation: Listenable.merge([
                          waveController,
                          rotationController,
                          pulseController,
                        ]),
                        builder: (
                            context,
                            child,
                            ) {
                          return _buildWaveScene();
                        },
                      ),
                    ),
                  ),
                ),

                _buildBottomControls(),

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
                '05 / 06',
                style: TextStyle(
                  color: AppColors.pink,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'NOVA WAVE',
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
            padding: const EdgeInsets.symmetric(
              horizontal: 11,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(20),
              color: AppColors.pink.withValues(
                alpha: 0.06,
              ),
              border: Border.all(
                color: AppColors.pink.withValues(
                  alpha: 0.15,
                ),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.graphic_eq_rounded,
                  size: 14,
                  color: AppColors.pink,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'AUDIO',
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
  // MAIN WAVE SCENE
  // ============================================================

  Widget _buildWaveScene() {
    final double waveProgress =
        waveController.value * pi * 2;

    final double rotation =
        rotationController.value * pi * 2;

    final double pulse =
        1.0 +
            sin(
              pulseController.value * pi,
            ) *
                0.045;

    return LayoutBuilder(
      builder: (
          context,
          constraints,
          ) {
        final double width = min(
          constraints.maxWidth,
          370.0,
        );

        final double availableHeight =
            constraints.maxHeight;

        final double height = min(
          availableHeight,
          500.0,
        );

        return SizedBox(
          width: width,
          height: height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // ==================================================
              // AMBIENT GLOW
              // ==================================================

              Container(
                width: width * 0.82,
                height: width * 0.82,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.purple.withValues(
                        alpha: 0.10,
                      ),
                      AppColors.pink.withValues(
                        alpha: 0.035,
                      ),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              // ==================================================
              // OUTER PULSE RING
              // ==================================================

              _buildWaveRing(
                size: width * 0.72,
                progress: waveProgress,
                color: AppColors.purple,
              ),

              // ==================================================
              // CYAN RING
              // ==================================================

              _buildWaveRing(
                size: width * 0.58,
                progress:
                waveProgress +
                    pi * 0.7,
                color: AppColors.cyan,
              ),

              // ==================================================
              // PINK RING
              // ==================================================

              _buildWaveRing(
                size: width * 0.45,
                progress:
                waveProgress +
                    pi * 1.3,
                color: AppColors.pink,
              ),

              // ==================================================
              // ROTATING CYAN ARC
              // ==================================================

              Transform.rotate(
                angle: rotation,
                child: SizedBox(
                  width: width * 0.70,
                  height: width * 0.70,
                  child: CustomPaint(
                    painter: _WaveArcPainter(
                      color: AppColors.cyan
                          .withValues(
                        alpha: 0.25,
                      ),
                    ),
                  ),
                ),
              ),

              // ==================================================
              // ROTATING PINK ARC
              // ==================================================

              Transform.rotate(
                angle: -rotation * 0.7,
                child: SizedBox(
                  width: width * 0.57,
                  height: width * 0.57,
                  child: CustomPaint(
                    painter: _WaveArcPainter(
                      color: AppColors.pink
                          .withValues(
                        alpha: 0.22,
                      ),
                    ),
                  ),
                ),
              ),

              // ==================================================
              // WAVEFORM
              // ==================================================

              Positioned(
                left: width * 0.05,
                right: width * 0.05,
                top: height * 0.40,
                child: SizedBox(
                  height: 100,
                  child: CustomPaint(
                    painter: _WaveformPainter(
                      progress: waveProgress,
                      touchX: touchX,
                      width: width,
                      active: playing,
                      touching: touching,
                    ),
                  ),
                ),
              ),

              // ==================================================
              // CENTER AUDIO CORE
              // ==================================================

              Transform.scale(
                scale: pulse,
                child: GestureDetector(
                  behavior:
                  HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      playing = !playing;
                    });
                  },
                  child: _buildAudioCore(),
                ),
              ),

              // ==================================================
              // STATUS
              // ==================================================

              Positioned(
                top: height * 0.08,
                child: _statusLabel(),
              ),

              // ==================================================
              // METRICS
              // ==================================================

              Positioned(
                bottom: height * 0.07,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _metric(
                      'BPM',
                      playing ? '128' : '000',
                    ),

                    const SizedBox(
                      width: 12,
                    ),

                    _metric(
                      'HZ',
                      playing ? '44.1K' : '00.0',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ============================================================
  // AUDIO CORE
  // ============================================================

  Widget _buildAudioCore() {
    return Container(
      width: 125,
      height: 125,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        gradient: const RadialGradient(
          center: Alignment(
            -0.30,
            -0.35,
          ),
          colors: [
            Color(0xffFFFFFF),
            Color(0xff67E8F9),
            Color(0xff6366F1),
            Color(0xffA855F7),
            Color(0xff24124F),
          ],
          stops: [
            0.0,
            0.12,
            0.35,
            0.68,
            1.0,
          ],
        ),

        boxShadow: [
          BoxShadow(
            color: AppColors.purple
                .withValues(
              alpha: 0.35,
            ),
            blurRadius: 55,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: AppColors.cyan
                .withValues(
              alpha: 0.18,
            ),
            blurRadius: 80,
          ),
        ],
      ),

      child: Center(
        child: Container(
          width: 62,
          height: 62,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withValues(
              alpha: 0.18,
            ),
            border: Border.all(
              color: Colors.white.withValues(
                alpha: 0.25,
              ),
            ),
          ),
          child: Icon(
            playing
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // PULSE RING
  // ============================================================

  Widget _buildWaveRing({
    required double size,
    required double progress,
    required Color color,
  }) {
    final double normalized =
        (sin(progress) + 1) / 2;

    final double scale =
        0.88 + normalized * 0.14;

    final double opacity =
        0.05 + normalized * 0.12;

    return Transform.scale(
      scale: scale,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: color.withValues(
              alpha: opacity,
            ),
            width: 1.3,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // STATUS LABEL
  // ============================================================

  Widget _statusLabel() {
    final Color statusColor = playing
        ? AppColors.cyan
        : AppColors.muted;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(20),
        color: Colors.white.withValues(
          alpha: 0.035,
        ),
        border: Border.all(
          color: Colors.white.withValues(
            alpha: 0.08,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: statusColor,
              boxShadow: [
                if (playing)
                  BoxShadow(
                    color: AppColors.cyan
                        .withValues(
                      alpha: 0.65,
                    ),
                    blurRadius: 10,
                  ),
              ],
            ),
          ),

          const SizedBox(
            width: 7,
          ),

          Text(
            playing
                ? 'LIVE WAVE'
                : 'PAUSED',
            style: const TextStyle(
              color: AppColors.silver,
              fontSize: 9,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // METRIC
  // ============================================================

  Widget _metric(
      String title,
      String value,
      ) {
    return Container(
      width: 82,
      padding: const EdgeInsets.symmetric(
        vertical: 9,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(14),
        color: Colors.white.withValues(
          alpha: 0.035,
        ),
        border: Border.all(
          color: Colors.white.withValues(
            alpha: 0.08,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 7,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.4,
            ),
          ),

          const SizedBox(
            height: 3,
          ),

          Text(
            value,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOTTOM CONTROLS
  // ============================================================

  Widget _buildBottomControls() {
    final String title;

    if (!playing) {
      title = 'WAVE PAUSED';
    } else if (touching) {
      title = 'INTERACTIVE WAVE';
    } else {
      title = 'NOVA FREQUENCY';
    }

    final String subtitle = playing
        ? 'TOUCH • MOVE • FEEL THE FREQUENCY'
        : 'TAP THE CORE TO RESUME';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            color: playing
                ? AppColors.cyan
                : AppColors.muted,
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 2.2,
          ),
        ),

        const SizedBox(
          height: 7,
        ),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 9,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    waveController.dispose();
    rotationController.dispose();
    pulseController.dispose();

    super.dispose();
  }
}

// =================================================================
// WAVEFORM PAINTER
// =================================================================

class _WaveformPainter extends CustomPainter {
  final double progress;
  final double touchX;
  final double width;
  final bool active;
  final bool touching;

  const _WaveformPainter({
    required this.progress,
    required this.touchX,
    required this.width,
    required this.active,
    required this.touching,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    const int barCount = 41;

    final double spacing =
        width / (barCount - 1);

    for (int i = 0;
    i < barCount;
    i++) {
      final double x = i * spacing;

      final double normalized =
          i / (barCount - 1);

      final double distance =
      (x - touchX).abs();

      double touchEffect = 0;

      if (touching) {
        touchEffect = max(
          0.0,
          1.0 - distance / 120.0,
        );
      }

      final double wave = sin(
        progress +
            i * 0.48,
      ).abs();

      final double secondary = sin(
        progress * 2 +
            i * 0.19,
      ).abs();

      double barHeight =
          15 +
              wave * 48 +
              secondary * 16;

      if (touching) {
        barHeight +=
            touchEffect * 35;
      }

      if (!active) {
        barHeight *= 0.25;
      }

      final double centerY =
          size.height / 2;

      final double top =
          centerY -
              barHeight / 2;

      final double bottom =
          centerY +
              barHeight / 2;

      paint.color =
          _barColor(normalized);

      canvas.drawLine(
        Offset(x, top),
        Offset(x, bottom),
        paint,
      );
    }
  }

  Color _barColor(
      double position,
      ) {
    if (position < 0.33) {
      return Color.lerp(
        AppColors.purple,
        AppColors.pink,
        position * 3,
      )!;
    }

    if (position < 0.66) {
      return Color.lerp(
        AppColors.pink,
        AppColors.cyan,
        (position - 0.33) * 3,
      )!;
    }

    return Color.lerp(
      AppColors.cyan,
      AppColors.blue,
      (position - 0.66) * 3,
    )!;
  }

  @override
  bool shouldRepaint(
      covariant _WaveformPainter oldDelegate,
      ) {
    return oldDelegate.progress !=
        progress ||
        oldDelegate.touchX != touchX ||
        oldDelegate.active != active ||
        oldDelegate.touching != touching;
  }
}

// =================================================================
// ARC PAINTER
// =================================================================

class _WaveArcPainter extends CustomPainter {
  final Color color;

  const _WaveArcPainter({
    required this.color,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final Rect rect = Rect.fromCircle(
      center: Offset(
        size.width / 2,
        size.height / 2,
      ),
      radius: size.width / 2 - 2,
    );

    // First arc.
    canvas.drawArc(
      rect,
      -pi * 0.15,
      pi * 0.72,
      false,
      paint,
    );

    // Second arc.
    canvas.drawArc(
      rect,
      pi * 0.95,
      pi * 0.30,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(
      covariant _WaveArcPainter oldDelegate,
      ) {
    return oldDelegate.color != color;
  }
}