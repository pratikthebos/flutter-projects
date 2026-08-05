import 'dart:ui';
import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {

  final String text;

  final VoidCallback onPressed;

  const GlassButton({

    super.key,

    required this.text,

    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(

      borderRadius: BorderRadius.circular(30),

      child: BackdropFilter(

        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),

        child: Container(

          height: 58,

          decoration: BoxDecoration(

            borderRadius:
            BorderRadius.circular(30),

            gradient: LinearGradient(

              colors: [

                Colors.white.withOpacity(.12),

                Colors.white.withOpacity(.05),

              ],

            ),

            border: Border.all(

              color: Colors.white24,

            ),

          ),

          child: Material(

            color: Colors.transparent,

            child: InkWell(

              borderRadius:
              BorderRadius.circular(30),

              onTap: onPressed,

              child: Center(

                child: Text(

                  text,

                  style: const TextStyle(

                    color: Colors.white,

                    fontWeight: FontWeight.bold,

                    fontSize: 18,

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