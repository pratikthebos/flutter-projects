import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {

  final int value;

  final String title;

  const AnimatedCounter({
    super.key,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return TweenAnimationBuilder<int>(

      tween: IntTween(
        begin: 0,
        end: value,
      ),

      duration: const Duration(seconds: 2),

      builder: (_, val, __) {

        return Column(

          children: [

            Text(

              "$val",

              style: const TextStyle(

                fontWeight: FontWeight.bold,

                fontSize: 30,

              ),

            ),

            Text(title),

          ],

        );

      },

    );

  }

}