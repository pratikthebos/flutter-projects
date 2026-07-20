import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.onTap,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 250),
        scale: hovered ? 1.02 : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
              BoxShadow(
                color: AppColors.primary.withOpacity(
                  hovered ? .15 : .08,
                ),
                blurRadius: hovered ? 40 : 25,
                spreadRadius: hovered ? 2 : 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 25,
                sigmaY: 25,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onTap,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: widget.padding,
                    decoration: BoxDecoration(
                      gradient: AppColors.liquidGradient,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppColors.glassBorder,
                        width: 1.2,
                      ),
                    ),
                    child: Stack(
                      children: [
                        /// Reflection
                        Positioned(
                          top: -80,
                          left: -40,
                          child: Container(
                            width: 220,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.02),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// Inner Glow
                        Positioned.fill(
                          child: IgnorePointer(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.white.withOpacity(.06),
                                ),
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
          ),
        ),
      ),
    );
  }
}