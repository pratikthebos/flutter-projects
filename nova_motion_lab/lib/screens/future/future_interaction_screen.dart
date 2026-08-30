import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/nova_background.dart';

class FutureInteractionScreen extends StatefulWidget {
  const FutureInteractionScreen({
    super.key,
  });

  @override
  State<FutureInteractionScreen> createState() =>
      _FutureInteractionScreenState();
}

class _FutureInteractionScreenState
    extends State<FutureInteractionScreen>
    with TickerProviderStateMixin {
  late AnimationController ambientController;
  late AnimationController pulseController;
  late AnimationController successController;

  Offset orbPosition = Offset.zero;

  bool interacting = false;
  bool activated = false;

  @override
  void initState() {
    super.initState();

    ambientController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    )..repeat();

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1500,
      ),
    )..repeat(
      reverse: true,
    );

    successController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 800,
      ),
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
                    onPanStart: (_) {
                      setState(() {
                        interacting = true;
                      });
                    },
                    onPanUpdate: (details) {
                      _moveOrb(details.localPosition);
                    },
                    onPanEnd: (_) {
                      _returnOrb();
                    },
                    child: Center(
                      child: AnimatedBuilder(
                        animation: Listenable.merge([
                          ambientController,
                          pulseController,
                          successController,
                        ]),
                        builder: (
                            context,
                            child,
                            ) {
                          return _buildInteractionScene();
                        },
                      ),
                    ),
                  ),
                ),

                _buildBottomPanel(),

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
                  alpha: .06,
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
                '03 / 06',
                style: TextStyle(
                  color: AppColors.cyan,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'FUTURE INTERACTION',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  letterSpacing: .8,
                ),
              ),
            ],
          ),

          const Spacer(),

          _liveIndicator(),
        ],
      ),
    );
  }

  Widget _liveIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.cyan.withValues(
          alpha: .06,
        ),
        border: Border.all(
          color: AppColors.cyan.withValues(
            alpha: .15,
          ),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.bolt_rounded,
            size: 14,
            color: AppColors.cyan,
          ),
          SizedBox(width: 5),
          Text(
            'LIVE',
            style: TextStyle(
              color: AppColors.cyan,
              fontSize: 9,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MAIN INTERACTION SCENE
  // ============================================================

  Widget _buildInteractionScene() {
    final t = ambientController.value * pi * 2;

    final pulse =
        1 +
            sin(
              pulseController.value * pi,
            ) *
                .035;

    final center = const Offset(
      0,
      0,
    );

    final interactionOffset =
    orbPosition == Offset.zero
        ? Offset(
      sin(t) * 5,
      cos(t) * 5,
    )
        : orbPosition;

    return SizedBox(
      width: 340,
      height: 470,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ======================================================
          // BACKGROUND GRID
          // ======================================================

          Positioned.fill(
            child: CustomPaint(
              painter: _InteractionGridPainter(
                color: AppColors.cyan.withValues(
                  alpha: .055,
                ),
              ),
            ),
          ),

          // ======================================================
          // OUTER ORBIT
          // ======================================================

          Transform.rotate(
            angle: t,
            child: Container(
              width: 310,
              height: 310,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.cyan.withValues(
                    alpha: .10,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -4,
                    left: 150,
                    child: _particle(
                      AppColors.cyan,
                      8,
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    right: 10,
                    child: _particle(
                      AppColors.purple,
                      6,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ======================================================
          // SECOND ORBIT
          // ======================================================

          Transform.rotate(
            angle: -t * .7,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.purple.withValues(
                    alpha: .12,
                  ),
                ),
              ),
            ),
          ),

          // ======================================================
          // MAGNETIC CONNECTION
          // ======================================================

          CustomPaint(
            size: const Size(
              340,
              470,
            ),
            painter: _ConnectionPainter(
              offset: interactionOffset,
              active: interacting,
            ),
          ),

          // ======================================================
          // INTERACTION ORB
          // ======================================================

          Transform.translate(
            offset: interactionOffset,
            child: Transform.scale(
              scale: pulse,
              child: GestureDetector(
                onTap: _activate,
                child: _buildOrb(),
              ),
            ),
          ),

          // ======================================================
          // MAGNETIC BUTTON
          // ======================================================

          Positioned(
            bottom: 20,
            child: GestureDetector(
              onTap: _activate,
              child: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 350,
                ),
                curve: Curves.easeOutBack,
                width: activated ? 210 : 190,
                height: 58,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(22),
                  gradient: LinearGradient(
                    colors: activated
                        ? const [
                      AppColors.cyan,
                      AppColors.blue,
                    ]
                        : const [
                      AppColors.purple,
                      AppColors.violet,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (activated
                          ? AppColors.cyan
                          : AppColors.purple)
                          .withValues(
                        alpha: .28,
                      ),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Icon(
                      activated
                          ? Icons.check_rounded
                          : Icons.touch_app_rounded,
                      color: Colors.white,
                      size: 19,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Text(
                      activated
                          ? 'CONNECTED'
                          : 'ACTIVATE',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight:
                        FontWeight.w900,
                        letterSpacing: 1.6,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ======================================================
          // SMALL LABELS
          // ======================================================

          Positioned(
            left: 15,
            top: 125,
            child: _dataLabel(
              'INPUT',
              interacting
                  ? 'ACTIVE'
                  : 'READY',
            ),
          ),

          Positioned(
            right: 15,
            top: 175,
            child: _dataLabel(
              'CORE',
              activated
                  ? 'ONLINE'
                  : 'IDLE',
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CENTRAL ORB
  // ============================================================

  Widget _buildOrb() {
    final color = activated
        ? AppColors.cyan
        : AppColors.purple;

    return Container(
      width: 125,
      height: 125,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: const Alignment(
            -.3,
            -.35,
          ),
          colors: [
            Colors.white.withValues(
              alpha: .55,
            ),
            color,
            color.withValues(
              alpha: .70,
            ),
            const Color(0xff10152A),
          ],
          stops: const [
            0,
            .15,
            .58,
            1,
          ],
        ),
        border: Border.all(
          color: Colors.white.withValues(
            alpha: .18,
          ),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(
              alpha: .38,
            ),
            blurRadius: 60,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(
            milliseconds: 300,
          ),
          child: Icon(
            activated
                ? Icons.bolt_rounded
                : Icons.fingerprint_rounded,
            key: ValueKey(activated),
            size: 48,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // DATA LABEL
  // ============================================================

  Widget _dataLabel(
      String title,
      String value,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(12),
        color: Colors.white.withValues(
          alpha: .035,
        ),
        border: Border.all(
          color: Colors.white.withValues(
            alpha: .08,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
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
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 9,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _particle(
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
            color: color.withValues(
              alpha: .65,
            ),
            blurRadius: 14,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOTTOM PANEL
  // ============================================================

  Widget _buildBottomPanel() {
    return AnimatedSwitcher(
      duration: const Duration(
        milliseconds: 350,
      ),
      child: Column(
        key: ValueKey(
          '$interacting$activated',
        ),
        children: [
          Text(
            activated
                ? 'SYSTEM CONNECTED'
                : interacting
                ? 'TRACKING INPUT'
                : 'TOUCH & MOVE',
            style: TextStyle(
              color: activated
                  ? AppColors.cyan
                  : AppColors.silver,
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.2,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            activated
                ? 'FUTURE INTERACTION ENABLED'
                : 'MOVE THE CORE WITH YOUR FINGER',
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 9,
              letterSpacing: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INTERACTION
  // ============================================================

  void _moveOrb(Offset position) {
    const center = Offset(
      170,
      235,
    );

    final difference =
        position - center;

    final limited = Offset(
      difference.dx.clamp(-80.0, 80.0),
      difference.dy.clamp(-80.0, 80.0),
    );

    setState(() {
      orbPosition = limited;
    });
  }

  void _returnOrb() {
    setState(() {
      interacting = false;
      orbPosition = Offset.zero;
    });
  }

  void _activate() {
    setState(() {
      activated = !activated;
    });

    successController.forward(
      from: 0,
    );
  }

  @override
  void dispose() {
    ambientController.dispose();
    pulseController.dispose();
    successController.dispose();
    super.dispose();
  }
}

// ================================================================
// GRID PAINTER
// ================================================================

class _InteractionGridPainter
    extends CustomPainter {
  final Color color;

  const _InteractionGridPainter({
    required this.color,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = .7;

    const spacing = 28.0;

    for (double x = 0;
    x <= size.width;
    x += spacing) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    for (double y = 0;
    y <= size.height;
    y += spacing) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant _InteractionGridPainter oldDelegate,
      ) {
    return oldDelegate.color != color;
  }
}

// ================================================================
// CONNECTION PAINTER
// ================================================================

class _ConnectionPainter
    extends CustomPainter {
  final Offset offset;
  final bool active;

  const _ConnectionPainter({
    required this.offset,
    required this.active,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    if (!active) return;

    final paint = Paint()
      ..color = AppColors.cyan
          .withValues(alpha: .16)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final center = Offset(
      size.width / 2,
      size.height / 2 - 5,
    );

    final end = center + offset;

    final path = Path();

    path.moveTo(
      center.dx,
      center.dy,
    );

    path.quadraticBezierTo(
      center.dx + offset.dx * .5,
      center.dy + offset.dy * .5,
      end.dx,
      end.dy,
    );

    canvas.drawPath(
      path,
      paint,
    );

    final dotPaint = Paint()
      ..color = AppColors.cyan
          .withValues(alpha: .45);

    canvas.drawCircle(
      end,
      5,
      dotPaint,
    );
  }

  @override
  bool shouldRepaint(
      covariant _ConnectionPainter oldDelegate,
      ) {
    return oldDelegate.offset != offset ||
        oldDelegate.active != active;
  }
}