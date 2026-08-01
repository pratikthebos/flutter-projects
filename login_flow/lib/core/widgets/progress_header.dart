import 'package:flutter/material.dart';

class ProgressHeader extends StatelessWidget {
  const ProgressHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: const [

        Text(
          "Authentication Flow",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 8),

        Text(
          "Watch how a successful login works inside a software company.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),

      ],

    );

  }

}