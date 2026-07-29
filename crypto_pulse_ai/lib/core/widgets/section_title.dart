import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {

  final String title;
  final String action;

  const SectionTitle({
    super.key,
    required this.title,
    this.action = "See All",
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Spacer(),

        Text(
          action,
          style: const TextStyle(
            color: Colors.deepPurpleAccent,
          ),
        ),
      ],
    );
  }
}