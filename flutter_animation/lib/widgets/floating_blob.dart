import 'dart:math';

import 'package:flutter/material.dart';

class FloatingBlob extends StatefulWidget {
  final double size;
  final List<Color> colors;
  final Alignment alignment;
  final Duration duration;

  const FloatingBlob({
    super.key,
    required this.size,
    required this.colors,
    this.alignment = Alignment.center,
    this.duration = const Duration(seconds: 8),
  });

  @override
  State<FloatingBlob> createState() => _FloatingBlobState();
}

class _FloatingBlobState extends State<FloatingBlob>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          final value = _controller.value;

          final dx = sin(value * pi * 2) * 25;
          final dy = cos(value * pi * 2) * 18;
          final scale = 0.95 + (value * 0.12);
          final rotation = value * pi / 8;

          return Align(
            alignment: widget.alignment,
            child: Transform.translate(
              offset: Offset(dx, dy),
              child: Transform.rotate(
                angle: rotation,
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          widget.colors.first.withOpacity(.65),
                          widget.colors.last.withOpacity(.25),
                          Colors.transparent,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: widget.colors.first.withOpacity(.30),
                          blurRadius: 90,
                          spreadRadius: 25,
                        ),
                        BoxShadow(
                          color: widget.colors.last.withOpacity(.20),
                          blurRadius: 120,
                          spreadRadius: 35,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}