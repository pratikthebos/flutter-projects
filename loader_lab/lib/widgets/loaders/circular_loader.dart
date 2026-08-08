import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 55,
      height: 55,
      child: CircularProgressIndicator(
        strokeWidth: 5,
        valueColor: AlwaysStoppedAnimation(
          Color(0xff6C63FF),
        ),
      ),
    );
  }
}