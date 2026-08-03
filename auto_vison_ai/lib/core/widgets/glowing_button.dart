import 'package:flutter/material.dart';

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

    return InkWell(

      borderRadius: BorderRadius.circular(40),

      onTap: onPressed,

      child: Container(

        height: 60,

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(40),

          gradient: const LinearGradient(

            colors: [

              Color(0xff00E5FF),

              Color(0xff00BCD4),

            ],

          ),

          boxShadow: [

            BoxShadow(

              color: Colors.cyanAccent.withOpacity(.45),

              blurRadius: 25,

            ),

          ],

        ),

        child: const Center(

          child: Text(

            "LAUNCH AI SCANNER",

            style: TextStyle(

              color: Colors.black,

              fontWeight: FontWeight.bold,

              letterSpacing: 1.5,

            ),

          ),

        ),

      ),

    );

  }

}