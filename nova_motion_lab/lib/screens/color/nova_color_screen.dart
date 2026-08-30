import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/nova_background.dart';

class NovaColorScreen extends StatefulWidget {
  const NovaColorScreen({
    super.key,
  });

  @override
  State<NovaColorScreen> createState() =>
      _NovaColorScreenState();
}

class _NovaColorScreenState
    extends State<NovaColorScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  double hue = .72;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 6,
      ),
    )..repeat();
  }

  Color get selectedColor {
    return HSVColor.fromAHSV(
      1,
      hue * 360,
      .75,
      1,
    ).toColor();
  }

  @override
  Widget build(BuildContext context) {
    final color = selectedColor;

    return Scaffold(
      body: Stack(
        children: [
          const NovaBackground(),

          SafeArea(
            child: Column(
              children: [
                _header(),

                Expanded(
                  child: SingleChildScrollView(
                    physics:
                    const BouncingScrollPhysics(),
                    padding:
                    const EdgeInsets.fromLTRB(
                      22,
                      25,
                      22,
                      35,
                    ),
                    child: Column(
                      children: [
                        _colorOrb(color),

                        const SizedBox(
                          height: 35,
                        ),

                        _colorInformation(color),

                        const SizedBox(
                          height: 30,
                        ),

                        _palette(color),

                        const SizedBox(
                          height: 28,
                        ),

                        _copyButton(color),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        22,
        20,
        22,
        0,
      ),
      child: Row(
        children: [
          _backButton(),

          const SizedBox(
            width: 14,
          ),

          const Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                '02 / 06',
                style: TextStyle(
                  color: AppColors.pink,
                  fontSize: 10,
                  fontWeight:
                  FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'NOVA COLOR',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight:
                  FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _backButton() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
              .withValues(alpha: .06),
          border: Border.all(
            color: Colors.white
                .withValues(alpha: .10),
          ),
        ),
        child: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget _colorOrb(Color color) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final scale =
            1 +
                sin(
                  controller.value *
                      pi *
                      2,
                ) *
                    .025;

        return Transform.scale(
          scale: scale,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                hue +=
                    details.delta.dx *
                        .003;

                hue = hue.clamp(
                  0.0,
                  1.0,
                );
              });
            },
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient:
                RadialGradient(
                  center:
                  const Alignment(
                    -.3,
                    -.3,
                  ),
                  colors: [
                    Colors.white
                        .withValues(
                      alpha: .35,
                    ),
                    color,
                    color.withValues(
                      alpha: .65,
                    ),
                    const Color(
                      0xff050711,
                    ),
                  ],
                  stops: const [
                    0,
                    .18,
                    .62,
                    1,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: color
                        .withValues(
                      alpha: .35,
                    ),
                    blurRadius: 70,
                    spreadRadius: 8,
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  width: 90,
                  height: 90,
                  decoration:
                  BoxDecoration(
                    shape:
                    BoxShape.circle,
                    color:
                    Colors.white
                        .withValues(
                      alpha: .08,
                    ),
                    border:
                    Border.all(
                      color: Colors.white
                          .withValues(
                        alpha: .25,
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.palette_rounded,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _colorInformation(
      Color color,
      ) {
    final hex = _hex(color);

    return Column(
      children: [
        const Text(
          'SELECTED COLOR',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 10,
            fontWeight:
            FontWeight.w800,
            letterSpacing: 2.5,
          ),
        ),

        const SizedBox(
          height: 8,
        ),

        Text(
          hex,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 32,
            fontWeight:
            FontWeight.w900,
            letterSpacing: 3,
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            _valueBox(
              'R',
              color.red,
            ),
            const SizedBox(width: 10),
            _valueBox(
              'G',
              color.green,
            ),
            const SizedBox(width: 10),
            _valueBox(
              'B',
              color.blue,
            ),
          ],
        ),
      ],
    );
  }

  Widget _valueBox(
      String label,
      int value,
      ) {
    return Container(
      width: 75,
      padding:
      const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(16),
        color: Colors.white
            .withValues(alpha: .05),
        border: Border.all(
          color: Colors.white
              .withValues(alpha: .08),
        ),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 9,
              fontWeight:
              FontWeight.w800,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            '$value',
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight:
              FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _palette(Color color) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection:
        Axis.horizontal,
        physics:
        const BouncingScrollPhysics(),
        itemCount: 9,
        itemBuilder:
            (context, index) {
          final paletteColor =
          HSVColor.fromAHSV(
            1,
            ((hue * 360) +
                index * 22) %
                360,
            .65,
            .95,
          ).toColor();

          return GestureDetector(
            onTap: () {
              setState(() {
                hue =
                    (((hue * 360) +
                        index * 22) %
                        360) /
                        360;
              });
            },
            child: Container(
              width: 55,
              margin:
              const EdgeInsets.only(
                right: 10,
              ),
              decoration:
              BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                  18,
                ),
                color: paletteColor,
                border: Border.all(
                  color: Colors.white
                      .withValues(
                    alpha: .20,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _copyButton(Color color) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          SnackBar(
            content: Text(
              '${_hex(color)} copied',
            ),
            duration:
            const Duration(
              milliseconds: 900,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [
              color,
              color.withValues(
                alpha: .65,
              ),
            ],
          ),
        ),
        child: const Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              Icons.copy_rounded,
              color: Colors.white,
              size: 18,
            ),
            SizedBox(width: 8),
            Text(
              'COPY COLOR',
              style: TextStyle(
                color: Colors.white,
                fontWeight:
                FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _hex(Color color) {
    return '#${color.red.toRadixString(16).padLeft(2, '0')}${color.green.toRadixString(16).padLeft(2, '0')}${color.blue.toRadixString(16).padLeft(2, '0')}'.toUpperCase();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}