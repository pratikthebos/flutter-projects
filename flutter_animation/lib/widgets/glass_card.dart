import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final double borderRadius;
  final List<Color>? gradient;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.borderRadius = 28,
    this.gradient,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 180),
      scale: _pressed ? 0.97 : 1,
      curve: Curves.easeOut,
      child: GestureDetector(
        onTapDown: (_) {
          setState(() => _pressed = true);
        },
        onTapCancel: () {
          setState(() => _pressed = false);
        },
        onTapUp: (_) {
          setState(() => _pressed = false);

          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 18,
              sigmaY: 18,
            ),
            child: Container(
              padding: widget.padding ??
                  const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(widget.borderRadius),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: widget.gradient ??
                      [
                        Colors.white.withOpacity(.14),
                        Colors.white.withOpacity(.05),
                      ],
                ),
                border: Border.all(
                  color: Colors.white.withOpacity(.18),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.18),
                    blurRadius: 35,
                    spreadRadius: 1,
                    offset: const Offset(0, 18),
                  ),
                ],
              ),
              child: Stack(
                children: [

                  // Glass Highlight
                  Positioned(
                    top: -40,
                    left: -10,
                    right: -10,
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(.18),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),

                  widget.child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}