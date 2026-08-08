import 'package:flutter/material.dart';
import 'package:loader_lab/widgets/loaders/bouncing_ball_loader.dart';
import 'package:loader_lab/widgets/loaders/circular_dots_loader.dart';
import 'package:loader_lab/widgets/loaders/heartbeat_loader.dart';
import 'package:loader_lab/widgets/loaders/rotating_squares_loader.dart';

import 'loaders/circular_loader.dart';
import 'loaders/linear_loader.dart';
import 'loaders/dots_loader.dart';
import 'loaders/pulse_loader.dart';
import 'loaders/rotating_ring_loader.dart';
import 'loaders/wave_loader.dart';
import 'loaders/orbit_loader.dart';
import 'loaders/shimmer_loader.dart';
import 'loaders/dual_ring_loader.dart';
import 'loaders/gradient_spinner.dart';
import 'package:flutter/material.dart';

class NeonScannerLoader extends StatefulWidget {
  const NeonScannerLoader({
    super.key,
  });

  @override
  State<NeonScannerLoader> createState() =>
      _NeonScannerLoaderState();
}

class _NeonScannerLoaderState
    extends State<NeonScannerLoader>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1300,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,

      builder: (_, __) {
        final position =
            controller.value;

        return SizedBox(
          width: 190,
          height: 65,

          child: Stack(
            alignment: Alignment.center,

            children: [
              Container(
                width: 180,
                height: 4,

                decoration: BoxDecoration(
                  color:
                  const Color(
                    0xff00C6FF,
                  ).withValues(
                    alpha: .12,
                  ),

                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                ),
              ),

              Positioned(
                left:
                5 +
                    position * 170,

                child: Container(
                  width: 35,
                  height: 6,

                  decoration:
                  BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(
                      20,
                    ),

                    gradient:
                    const LinearGradient(
                      colors: [
                        Colors.transparent,
                        Color(0xff00C6FF),
                        Color(0xff6C63FF),
                      ],
                    ),

                    boxShadow: [
                      BoxShadow(
                        color:
                        const Color(
                          0xff00C6FF,
                        ).withValues(
                          alpha: .7,
                        ),

                        blurRadius: 18,

                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                child: Text(
                  "SCANNING...",
                  style: TextStyle(
                    color:
                    const Color(
                      0xff2979FF,
                    ).withValues(
                      alpha: .7,
                    ),

                    fontSize: 11,

                    fontWeight:
                    FontWeight.bold,

                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class LoaderPreview extends StatelessWidget {
  final int index;

  const LoaderPreview({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    switch (index) {
    // 1. Most visually attractive
      case 0:
        return const GradientSpinner();

    // 2. Premium layered animation
      case 1:
        return const DualRingLoader();

    // 3. Orbiting particles
      case 2:
        return const OrbitLoader();

    // 4. Futuristic scanner
      case 3:
        return const NeonScannerLoader();

    // 5. Eye-catching pulse
      case 4:
        return const HeartbeatLoader();

    // 6. Smooth expanding animation
      case 5:
        return const PulseLoader();

    // 7. Circular particle animation
      case 6:
        return const CircularDotsLoader();

    // 8. Dynamic wave
      case 7:
        return const WaveLoader();

    // 9. Geometric animation
      case 8:
        return const RotatingSquaresLoader();

    // 10. Playful physics animation
      case 9:
        return const BouncingBallLoader();

    // 11. Modern rotating ring
      case 10:
        return const RotatingRingLoader();

    // 12. Skeleton loading
      case 11:
        return const ShimmerLoader();

    // 13. Minimal dots
      case 12:
        return const DotsLoader();

    // 14. Progress animation
      case 13:
        return const LinearLoader();

    // 15. Classic Flutter loader
      case 14:
        return const CircularLoader();

      default:
        return const GradientSpinner();
    }
  }
}