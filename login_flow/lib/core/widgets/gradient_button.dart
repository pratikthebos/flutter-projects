import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class GradientButton extends StatelessWidget {

  final String text;

  final bool loading;

  final VoidCallback onTap;

  const GradientButton({

    super.key,

    required this.text,

    required this.loading,

    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: 58,

      width: double.infinity,

      child: ElevatedButton(

        style: ElevatedButton.styleFrom(

          padding: EdgeInsets.zero,

          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(18),

          ),

        ),

        onPressed: loading ? null : onTap,

        child: Ink(

          decoration: const BoxDecoration(

            gradient: AppColors.primaryGradient,

            borderRadius: BorderRadius.all(

              Radius.circular(18),

            ),

          ),

          child: Center(

            child: loading

                ? const CircularProgressIndicator(

              color: Colors.white,

            )

                : Text(

              text,

              style: const TextStyle(

                fontSize: 18,

                color: Colors.white,

                fontWeight: FontWeight.bold,

              ),

            ),

          ),

        ),

      ),

    );

  }

}