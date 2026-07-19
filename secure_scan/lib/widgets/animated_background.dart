import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late final AnimationController _rotationController;
  late final AnimationController _floatingController;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();

    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  Widget _glowCircle({
    required double size,
    required List<Color> colors,
    required Alignment alignment,
    required double dx,
    required double dy,
  }) {
    return AnimatedBuilder(
      animation: _floatingController,
      builder: (_, __) {
        final offset = sin(_floatingController.value * 2 * pi);

        return Align(
          alignment: alignment,
          child: Transform.translate(
            offset: Offset(
              dx * offset,
              dy * offset,
            ),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    colors.first.withOpacity(.45),
                    colors.last.withOpacity(.02),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _ring(double size) {
    return AnimatedBuilder(
      animation: _rotationController,
      builder: (_, __) {
        return Transform.rotate(
          angle: _rotationController.value * 2 * pi,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white10,
                width: 1,
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _particles() {
    return List.generate(
      40,
          (index) {
        final random = Random(index);

        final left = random.nextDouble();
        final top = random.nextDouble();
        final size = random.nextDouble() * 3 + 1;

        return AnimatedBuilder(
          animation: _floatingController,
          builder: (_, __) {
            final move =
            sin((_floatingController.value * 2 * pi) + index);

            return Positioned(
              left: left * MediaQuery.of(context).size.width,
              top: top * MediaQuery.of(context).size.height +
                  move * 8,
              child: Container(
                width: size,
                height: size,
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.background,
            Color(0xFF08132A),
            Color(0xFF04060F),
          ],
        ),
      ),
      child: Stack(
        children: [

          _glowCircle(
            size: 280,
            colors: AppColors.cyber,
            alignment: Alignment.topLeft,
            dx: 25,
            dy: 18,
          ),

          _glowCircle(
            size: 230,
            colors: AppColors.shield,
            alignment: Alignment.bottomRight,
            dx: -20,
            dy: -18,
          ),

          _glowCircle(
            size: 180,
            colors: AppColors.royal,
            alignment: Alignment.centerLeft,
            dx: 15,
            dy: -20,
          ),

          Center(child: _ring(420)),
          Center(child: _ring(300)),
          Center(child: _ring(180)),

          ..._particles(),

          SafeArea(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}