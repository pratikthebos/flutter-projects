import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const GlassCard({
    super.key,
    required this.child,
    this.height = 180,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(

      borderRadius: BorderRadius.circular(30),

      child: BackdropFilter(

        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),

        child: Container(

          height: height,
          width: width,

          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(30),

            border: Border.all(
              color: Colors.white.withValues(alpha: .30),
              width: 1.8,
            ),

            gradient: LinearGradient(

              begin: Alignment.topLeft,

              end: Alignment.bottomRight,

              colors: [

                Colors.white.withValues(alpha: .22),

                Colors.white.withValues(alpha: .08),

              ],

            ),

            boxShadow: [

              BoxShadow(
                color: Colors.cyan.withValues(alpha: .20),
                blurRadius: 35,
                spreadRadius: 2,
              ),

            ],

          ),

          child: child,

        ),

      ),

    );

  }
}