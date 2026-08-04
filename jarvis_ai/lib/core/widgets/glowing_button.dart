import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class GlowingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GlowingButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: const Color(0xFF111111), // Dark background
        borderRadius: BorderRadius.circular(35),

        border: Border.all(
          color: Colors.cyanAccent,
          width: 2,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(.45),
            blurRadius: 25,
            spreadRadius: 2,
          ),
        ],
      ),

      child: Material(
        color: Colors.transparent,

        child: InkWell(
          borderRadius: BorderRadius.circular(35),
          onTap: onPressed,

          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.cyanAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}