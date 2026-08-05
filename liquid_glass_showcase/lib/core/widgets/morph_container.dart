import 'dart:ui';
import 'package:flutter/material.dart';

class MorphContainer extends StatefulWidget {

  final Widget child;

  const MorphContainer({
    super.key,
    required this.child,
  });

  @override
  State<MorphContainer> createState() =>
      _MorphContainerState();

}

class _MorphContainerState
    extends State<MorphContainer>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {

    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: controller,

      builder: (_, __) {

        double radius =
            20 + controller.value * 25;

        return ClipRRect(

          borderRadius:
          BorderRadius.circular(radius),

          child: BackdropFilter(

            filter: ImageFilter.blur(
              sigmaX: 18,
              sigmaY: 18,
            ),

            child: AnimatedContainer(

              duration: const Duration(
                milliseconds: 400,
              ),

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                borderRadius:
                BorderRadius.circular(radius),

                color: Colors.white.withOpacity(.08),

                border: Border.all(

                  color:
                  Colors.white.withOpacity(.18),

                ),

              ),

              child: widget.child,

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