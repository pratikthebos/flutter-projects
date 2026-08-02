import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class GradientButton extends StatelessWidget {

  final String title;

  final VoidCallback onTap;

  const GradientButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(

      onTap: onTap,

      borderRadius: BorderRadius.circular(18),

      child: Ink(

        height: 58,

        decoration: BoxDecoration(

          gradient: AppColors.orangeGradient,

          borderRadius: BorderRadius.circular(18),

        ),

        child: const Center(

          child: Text(

            "Continue",

            style: TextStyle(

              color: Colors.white,

              fontWeight: FontWeight.bold,

              fontSize: 18,

            ),

          ),

        ),

      ),

    );

  }

}