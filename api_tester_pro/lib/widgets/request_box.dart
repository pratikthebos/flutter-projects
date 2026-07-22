import 'package:flutter/material.dart';

class RequestBox extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int lines;

  const RequestBox({
    super.key,
    required this.controller,
    required this.hint,
    this.lines = 6,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: lines,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}