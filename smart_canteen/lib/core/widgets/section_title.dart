import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {

  final String title;

  final String button;

  const SectionTitle({
    super.key,
    required this.title,
    this.button = "View All",
  });

  @override
  Widget build(BuildContext context) {

    return Row(

      children: [

        Expanded(

          child: Text(

            title,

            style: const TextStyle(

              fontSize: 22,

              fontWeight: FontWeight.bold,

            ),

          ),

        ),

        TextButton(

          onPressed: () {},

          child: Text(button),

        ),

      ],

    );

  }

}