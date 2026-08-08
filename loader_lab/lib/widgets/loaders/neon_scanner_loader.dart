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