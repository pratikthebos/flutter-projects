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
  late final AnimationController _floatController;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..repeat();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _rotationController,
        _floatController,
      ]),
      builder: (_, __) {
        return Stack(
          children: [

            // Background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.background,
                    Color(0xff0A0F24),
                    Color(0xff101A34),
                  ],
                ),
              ),
            ),

            // Purple Blob
            _blob(
              top: -120 +
                  sin(_floatController.value * 2 * pi) * 40,
              left: -80,
              size: 280,
              colors: const [
                Color(0xff8B5CF6),
                Color(0xff6366F1),
              ],
              rotation: _rotationController.value,
            ),

            // Cyan Blob
            _blob(
              top: 220,
              right: -90 +
                  cos(_floatController.value * 2 * pi) * 35,
              size: 260,
              colors: const [
                Color(0xff06B6D4),
                Color(0xff3B82F6),
              ],
              rotation: -_rotationController.value,
            ),

            // Pink Blob
            _blob(
              bottom: -120,
              left: 80 +
                  sin(_floatController.value * 2 * pi) * 45,
              size: 240,
              colors: const [
                Color(0xffEC4899),
                Color(0xffF43F5E),
              ],
              rotation: _rotationController.value * 1.5,
            ),

            // Soft Overlay
            Container(
              color: Colors.black.withOpacity(.25),
            ),

            widget.child,
          ],
        );
      },
    );
  }

  Widget _blob({
    double? top,
    double? left,
    double? right,
    double? bottom,
    required double size,
    required List<Color> colors,
    required double rotation,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Transform.rotate(
        angle: rotation * 2 * pi,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size),
            gradient: RadialGradient(
              colors: [
                colors.first.withOpacity(.55),
                colors.last.withOpacity(.15),
                Colors.transparent,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: colors.first.withOpacity(.25),
                blurRadius: 80,
                spreadRadius: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}