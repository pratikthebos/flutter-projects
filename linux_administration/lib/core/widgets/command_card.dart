import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CommandCard extends StatelessWidget {

  final String command;

  const CommandCard({
    super.key,
    required this.command,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: AppColors.terminal,

        borderRadius: BorderRadius.circular(22),

      ),

      child: RichText(

        text: TextSpan(

          children: [

            const TextSpan(

              text: "\$ ",

              style: TextStyle(

                color: AppColors.terminalGreen,

                fontSize: 18,

                fontWeight: FontWeight.bold,

              ),

            ),

            TextSpan(

              text: command,

              style: const TextStyle(

                color: Colors.white,

                fontSize: 18,

                fontFamily: "monospace",

              ),

            ),

          ],

        ),

      ),

    );

  }

}