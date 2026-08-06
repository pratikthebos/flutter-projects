import 'package:flutter/material.dart';

class SelectionBorder extends StatelessWidget {
  final bool selected;
  final Widget child;

  const SelectionBorder({
    super.key,
    required this.selected,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // No border shown when selected
    return child;
  }
}