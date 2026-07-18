import 'dart:ui';

import 'package:flutter/material.dart';

class GlassButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final List<Color> gradient;

  const GlassButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.gradient,
  });

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => isPressed = true);
      },
      onTapUp: (_) {
        setState(() => isPressed = false);
        widget.onTap();
      },
      onTapCancel: () {
        setState(() => isPressed = false);
      },

      child: AnimatedScale(
        duration: const Duration(milliseconds: 180),
        scale: isPressed ? .96 : 1,

        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),

          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 18,
              sigmaY: 18,
            ),

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),

              height: 62,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),

                gradient: LinearGradient(
                  colors: widget.gradient,
                ),

                border: Border.all(
                  color: Colors.white.withOpacity(.20),
                ),

                boxShadow: [
                  BoxShadow(
                    color: widget.gradient.first.withOpacity(.45),
                    blurRadius: isPressed ? 12 : 30,
                    spreadRadius: isPressed ? 0 : 3,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    widget.icon,
                    color: Colors.white,
                    size: 26,
                  ),

                  const SizedBox(width: 12),

                  Text(
                    widget.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: .4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}