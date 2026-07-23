import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AlphabetCard extends StatelessWidget {
  final String letter;
  final Color color1;
  final Color color2;
  final VoidCallback onTap;

  const AlphabetCard({
    super.key,
    required this.letter,
    required this.color1,
    required this.color2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color1,
              color2,
            ],
          ),
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: color1.withOpacity(.35),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Center(
          child: Text(
            letter,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 500.ms)
        .scale(
      begin: const Offset(.7, .7),
      curve: Curves.elasticOut,
    );
  }
}