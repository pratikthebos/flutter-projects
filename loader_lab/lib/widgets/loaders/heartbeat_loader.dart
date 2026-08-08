import 'package:flutter/material.dart';

class HeartbeatLoader extends StatefulWidget {
  const HeartbeatLoader({
    super.key,
  });

  @override
  State<HeartbeatLoader> createState() =>
      _HeartbeatLoaderState();
}

class _HeartbeatLoaderState
    extends State<HeartbeatLoader>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 900,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,

      builder: (_, __) {
        final value = controller.value;

        final scale = value < .35
            ? 1 + value * .9
            : value < .55
            ? 1.3 - (value - .35) * 1.5
            : 1.0;

        return Transform.scale(
          scale: scale,

          child: Container(
            width: 65,
            height: 65,

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              color: const Color(
                0xffff4F9A,
              ).withValues(
                alpha: .12,
              ),

              boxShadow: [
                BoxShadow(
                  color:
                  const Color(
                    0xffff4F9A,
                  ).withValues(
                    alpha: .25,
                  ),

                  blurRadius: 25,
                ),
              ],
            ),

            child: const Icon(
              Icons.favorite_rounded,

              color: Color(
                0xffff4F9A,
              ),

              size: 36,
            ),
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