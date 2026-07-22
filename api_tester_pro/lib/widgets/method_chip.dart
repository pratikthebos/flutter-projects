import 'package:flutter/material.dart';

class MethodChip extends StatelessWidget {
  final String method;
  final bool selected;
  final VoidCallback onTap;

  const MethodChip({
    super.key,
    required this.method,
    required this.selected,
    required this.onTap,
  });

  Color get color {
    switch (method) {
      case "GET":
        return Colors.blue;

      case "POST":
        return Colors.green;

      case "PUT":
        return Colors.orange;

      case "PATCH":
        return Colors.purple;

      case "DELETE":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(method),
      selected: selected,
      selectedColor: color,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: selected ? Colors.white : color,
        fontWeight: FontWeight.bold,
      ),
      onSelected: (_) => onTap(),
    );
  }
}