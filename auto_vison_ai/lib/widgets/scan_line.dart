import 'package:flutter/material.dart';

class ScanLine extends StatefulWidget {
  final bool scanning;
  final double height;

  const ScanLine({
    super.key,
    required this.scanning,
    this.height = 320,
  });

  @override
  State<ScanLine> createState() => _ScanLineState();
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

        duration: const Duration(milliseconds: 400),

        child: SizedBox(

          height: widget.height,

          width: 280,

          child: AnimatedBuilder(

            animation: controller,

            builder: (_, __) {

              return Stack(

                children: [

                  Positioned(

                    top: controller.value *
                        (widget.height - 8),

                    left: 0,

                    right: 0,

                    child: Container(

                      height: 8,

                      decoration: BoxDecoration(

                        gradient: LinearGradient(

                          colors: [

                            Colors.transparent,

                            Colors.cyanAccent.withOpacity(.15),

                            Colors.cyanAccent,

                            Colors.cyanAccent.withOpacity(.15),

                            Colors.transparent,

                          ],

                        ),

                        boxShadow: [

                          BoxShadow(

                            color: Colors.cyanAccent
                                .withOpacity(.8),

                            blurRadius: 18,

                            spreadRadius: 2,

                          ),

                        ],

                      ),

                    ),

                  ),

                ],

              );

            },

          ),

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