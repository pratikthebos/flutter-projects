import 'dart:math';

import 'package:flutter/material.dart';

class MusicPlayerDemo extends StatefulWidget {
  const MusicPlayerDemo({
    super.key,
  });

  @override
  State<MusicPlayerDemo> createState() =>
      _MusicPlayerDemoState();
}

class _MusicPlayerDemoState
    extends State<MusicPlayerDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  bool playing = true;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration:
      const Duration(seconds: 2),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Center(
          child: Container(
            width: 320,
            padding:
            const EdgeInsets.all(25),
            decoration:
            BoxDecoration(
              borderRadius:
              BorderRadius.circular(
                35,
              ),
              color:
              Colors.white.withValues(
                alpha: .82,
              ),
              boxShadow: [
                BoxShadow(
                  color:
                  Colors.black.withValues(
                    alpha: .07,
                  ),
                  blurRadius: 35,
                ),
              ],
            ),
            child: Column(
              mainAxisSize:
              MainAxisSize.min,
              children: [
                Transform.rotate(
                  angle:
                  controller.value *
                      pi *
                      2,
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration:
                    const BoxDecoration(
                      shape:
                      BoxShape.circle,
                      gradient:
                      LinearGradient(
                        colors: [
                          Color(
                            0xffF59E0B,
                          ),
                          Color(
                            0xffEC4899,
                          ),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.music_note,
                      size: 65,
                      color:
                      Colors.white,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                const Text(
                  'Midnight Motion',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight:
                    FontWeight.w800,
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                const Text(
                  'MotionUI Artist',
                  style: TextStyle(
                    color:
                    Color(
                      0xff687386,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                ClipRRect(
                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                  child:
                  LinearProgressIndicator(
                    value:
                    controller.value,
                    minHeight: 6,
                    backgroundColor:
                    const Color(
                      0xffECEEF5,
                    ),
                    valueColor:
                    const AlwaysStoppedAnimation(
                      Color(
                        0xffEC4899,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      playing =
                      !playing;
                    });
                  },
                  child: Container(
                    width: 58,
                    height: 58,
                    decoration:
                    const BoxDecoration(
                      shape:
                      BoxShape.circle,
                      color:
                      Color(
                        0xffEC4899,
                      ),
                    ),
                    child: Icon(
                      playing
                          ? Icons.pause
                          : Icons.play_arrow,
                      color:
                      Colors.white,
                    ),
                  ),
                ),
              ],
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