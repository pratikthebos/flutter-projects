import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedBackground> createState() =>
      _AnimatedBackgroundState();
}

class _AnimatedBackgroundState
    extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(
                -1 + controller.value,
                -1,
              ),
              end: Alignment(
                1,
                1 - controller.value,
              ),
              colors: const [
                AppColors.background,
                Color(0xff102548),
                Color(0xff081122),
              ],
            ),
          ),
          child: Stack(
            children: [

              Positioned(
                top: -60,
                right: -40,
                child: _circle(
                  220,
                  AppColors.primary.withOpacity(.18),
                ),
              ),

              Positioned(
                bottom: -80,
                left: -60,
                child: _circle(
                  260,
                  AppColors.secondary.withOpacity(.15),
                ),
              ),

              Positioned(
                top: 220,
                left: 40,
                child: _circle(
                  120,
                  Colors.white.withOpacity(.05),
                ),
              ),

              widget.child,
            ],
          ),
        );
      },
    );
  }

  Widget _circle(
      double size,
      Color color,
      ) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}