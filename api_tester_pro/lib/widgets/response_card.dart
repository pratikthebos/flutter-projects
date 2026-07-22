import 'package:flutter/material.dart';

class ResponseCard extends StatelessWidget {
  final String body;

  const ResponseCard({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SelectableText(
          body,
          style: const TextStyle(
            fontFamily: "monospace",
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}