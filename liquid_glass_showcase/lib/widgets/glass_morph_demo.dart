import 'package:flutter/material.dart';

class GlassMorphDemo extends StatelessWidget {
  const GlassMorphDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      height: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color(0x33FFFFFF),
            Color(0x11FFFFFF),
          ],
        ),
      ),
      child: const Center(
        child: Text(
          "Glass Morph Demo\nComing Soon",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}