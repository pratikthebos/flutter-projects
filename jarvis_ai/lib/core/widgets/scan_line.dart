import 'package:flutter/material.dart';

class ScanLine extends StatefulWidget {
  final bool scanning;

  const ScanLine({
    super.key,
    required this.scanning,
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
      duration: const Duration(milliseconds: 2500),
    );

    if (widget.scanning) {
      controller
        ..reset()
        ..repeat();
    }
  }

  @override
  void didUpdateWidget(covariant ScanLine oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.scanning && !oldWidget.scanning) {
      controller
        ..reset()
        ..repeat();
    }

    if (!widget.scanning && oldWidget.scanning) {
      controller
        ..stop()
        ..reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedOpacity(
        opacity: widget.scanning ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        child: SizedBox(
          width: 390,
          height: 540,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              final top = controller.value * 470;

              return Stack(
                children: [

                  //-------------------------------------------------
                  // Dark Overlay
                  //-------------------------------------------------

                  Container(
                    width: 390,
                    height: 540,
                    color: Colors.black.withOpacity(.18),
                  ),

                  //-------------------------------------------------
                  // Hologram Area
                  //-------------------------------------------------

                  Positioned(
                    top: top - 45,
                    left: 15,
                    right: 15,
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.cyanAccent.withOpacity(.05),
                            Colors.cyanAccent.withOpacity(.12),
                            Colors.cyanAccent.withOpacity(.22),
                            Colors.cyanAccent.withOpacity(.12),
                            Colors.cyanAccent.withOpacity(.05),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),

                  //-------------------------------------------------
                  // Main Laser
                  //-------------------------------------------------

                  Positioned(
                    top: top,
                    left: 15,
                    right: 15,
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.cyanAccent,
                            Colors.white,
                            Colors.cyanAccent,
                            Colors.transparent,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyanAccent.withOpacity(.9),
                            blurRadius: 18,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //-------------------------------------------------
                  // Bright Center Dot
                  //-------------------------------------------------

                  Positioned(
                    top: top - 6,
                    left: 185,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyanAccent,
                            blurRadius: 18,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //-------------------------------------------------
                  // Lower Glow
                  //-------------------------------------------------

                  Positioned(
                    top: top + 4,
                    left: 15,
                    right: 15,
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.cyanAccent.withOpacity(.18),
                            Colors.cyanAccent.withOpacity(.08),
                            Colors.transparent,
                          ],
                        ),
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