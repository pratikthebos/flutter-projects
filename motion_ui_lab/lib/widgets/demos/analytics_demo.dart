import 'dart:math';

import 'package:flutter/material.dart';

class AnalyticsDemo extends StatefulWidget {
  const AnalyticsDemo({
    super.key,
  });

  @override
  State<AnalyticsDemo> createState() =>
      _AnalyticsDemoState();
}

class _AnalyticsDemoState
    extends State<AnalyticsDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration:
      const Duration(seconds: 2),
    )..repeat(
      reverse: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Center(
          child: Container(
            width: 330,
            height: 360,
            padding:
            const EdgeInsets.all(24),
            decoration:
            BoxDecoration(
              borderRadius:
              BorderRadius.circular(
                32,
              ),
              color:
              Colors.white.withValues(
                alpha: .85,
              ),
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Text(
                  'Weekly Growth',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight:
                    FontWeight.w800,
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                const Text(
                  '+24.8%',
                  style: TextStyle(
                    color:
                    Color(
                      0xff10B981,
                    ),
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const Spacer(),

                SizedBox(
                  height: 180,
                  child: Row(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .end,
                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceAround,
                    children:
                    List.generate(
                      7,
                          (index) {
                        final height =
                            35 +
                                (sin(
                                  index *
                                      .8 +
                                      controller
                                          .value *
                                          pi,
                                ) +
                                    1) *
                                    55;

                        return Container(
                          width: 22,
                          height:
                          height,
                          decoration:
                          BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .circular(
                              12,
                            ),
                            gradient:
                            const LinearGradient(
                              begin:
                              Alignment
                                  .bottomCenter,
                              end:
                              Alignment
                                  .topCenter,
                              colors: [
                                Color(
                                  0xff10B981,
                                ),
                                Color(
                                  0xff06B6D4,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                const Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Text('Mon'),
                    Text('Tue'),
                    Text('Wed'),
                    Text('Thu'),
                    Text('Fri'),
                    Text('Sat'),
                    Text('Sun'),
                  ],
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