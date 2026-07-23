import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BigLetter extends StatelessWidget {
  final String letter;
  final Color color1;
  final Color color2;

  const BigLetter({
    super.key,
    required this.letter,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 230,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color1,
            color2,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: color1.withOpacity(0.35),
            blurRadius: 25,
            spreadRadius: 5,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        letter,
        style: const TextStyle(
          fontSize: 120,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .scale(
      begin: const Offset(0.92, 0.92),
      end: const Offset(1.05, 1.05),
      duration: const Duration(milliseconds: 900),
    );
  }
}