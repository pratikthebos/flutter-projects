import 'dart:math';

import 'package:flutter/material.dart';

class CreditCardDemo extends StatefulWidget {
  const CreditCardDemo({
    super.key,
  });

  @override
  State<CreditCardDemo> createState() =>
      _CreditCardDemoState();
}

class _CreditCardDemoState
    extends State<CreditCardDemo> {
  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            y += details.delta.dx * .008;
            x -= details.delta.dy * .008;
          });
        },
        onPanEnd: (_) {
          setState(() {
            x = 0;
            y = 0;
          });
        },
        child: Transform(
          alignment:
          Alignment.center,
          transform:
          Matrix4.identity()
            ..setEntry(
              3,
              2,
              .001,
            )
            ..rotateX(x)
            ..rotateY(y),
          child: Container(
            width: 330,
            height: 205,
            padding:
            const EdgeInsets.all(25),
            decoration:
            BoxDecoration(
              borderRadius:
              BorderRadius.circular(
                28,
              ),
              gradient:
              const LinearGradient(
                begin:
                Alignment.topLeft,
                end:
                Alignment.bottomRight,
                colors: [
                  Color(0xff172033),
                  Color(0xff40358F),
                  Color(0xff6C63FF),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(
                    0xff6C63FF,
                  ).withValues(
                    alpha: .30,
                  ),
                  blurRadius: 35,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons
                          .contactless_rounded,
                      color:
                      Colors.white,
                    ),
                    Spacer(),
                    Text(
                      'MOTION',
                      style:
                      TextStyle(
                        color:
                        Colors.white,
                        fontWeight:
                        FontWeight
                            .w800,
                        letterSpacing:
                        2,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                const Text(
                  '••••  ••••  ••••  4821',
                  style: TextStyle(
                    color:
                    Colors.white,
                    fontSize: 18,
                    letterSpacing:
                    2,
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                const Text(
                  'PRATIK KAMBALE',
                  style: TextStyle(
                    color:
                    Colors.white70,
                    fontSize: 11,
                    letterSpacing:
                    1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}