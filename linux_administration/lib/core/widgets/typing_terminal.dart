import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class TypingTerminal extends StatelessWidget {
  final String text;

  const TypingTerminal({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      constraints: const BoxConstraints(
        minHeight: 420,
      ),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: AppColors.terminal,
        borderRadius: BorderRadius.circular(24),
      ),

      child: SingleChildScrollView(
        child: SelectableText(
          text,
          style: const TextStyle(
            fontFamily: "monospace",
            color: AppColors.terminalGreen,
            fontSize: 15,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}