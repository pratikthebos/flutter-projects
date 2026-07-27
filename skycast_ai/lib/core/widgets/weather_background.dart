import 'package:flutter/material.dart';

class WeatherBackground extends StatelessWidget {
  final Widget child;

  const WeatherBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff0B1020),
            Color(0xff151A35),
            Color(0xff1B1630),
          ],
        ),
      ),
      child: child,
    );
  }
}