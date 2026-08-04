import 'package:flutter/material.dart';

class ScanLine extends StatefulWidget {

  final bool scanning;

  const ScanLine({
    super.key,
    required this.scanning,
  });

  @override
  State<ScanLine> createState() =>
      _ScanLineState();

}

class _ScanLineState extends State<ScanLine>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {

    super.initState();

    controller = AnimationController(

      vsync: this,

      duration: const Duration(seconds: 2),

    );

    if (widget.scanning) {

      controller.repeat(reverse: true);

    }

  }

  @override
  void didUpdateWidget(covariant ScanLine oldWidget) {

    super.didUpdateWidget(oldWidget);

    if (widget.scanning) {

      controller.repeat(reverse: true);

    } else {

      controller.stop();

    }

  }

  @override
  Widget build(BuildContext context) {

    return IgnorePointer(

      child: AnimatedOpacity(

        opacity: widget.scanning ? 1 : 0,

        duration: const Duration(milliseconds: 300),

        child: AnimatedBuilder(

          animation: controller,

          builder: (_, __) {

            return Transform.translate(

              offset: Offset(

                0,

                controller.value * 300,

              ),

              child: Container(

                width: 240,

                height: 5,

                decoration: BoxDecoration(

                  gradient: LinearGradient(

                    colors: [

                      Colors.transparent,

                      Colors.cyanAccent,

                      Colors.transparent,

                    ],

                  ),

                ),

              ),

            );

          },

        ),

      ),

    );

  }

  @override
  void dispose() {

    controller.dispose();

    super.dispose();

  }

}