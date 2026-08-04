import 'package:flutter/material.dart';

class ModuleButton extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const ModuleButton({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  IconData _iconForModule() {
    switch (title) {
      case "Helmet":
        return Icons.shield;

      case "Left Shoulder":
      case "Right Shoulder":
        return Icons.accessibility_new;

      case "Repulsor":
        return Icons.pan_tool;

      case "AI Core":
        return Icons.memory;

      case "Arc Reactor":
        return Icons.bolt;

      case "Left Leg":
      case "Right Leg":
        return Icons.directions_walk;

      case "Flight":
        return Icons.flight;

      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),

        width: 56,
        height: 56,

        decoration: BoxDecoration(
          shape: BoxShape.circle,

          color: selected
              ? Colors.cyanAccent
              : const Color(0xFF101010),

          border: Border.all(
            color: Colors.cyanAccent,
            width: 2,
          ),

          boxShadow: [

            BoxShadow(
              color: Colors.cyanAccent.withOpacity(
                selected ? .70 : .25,
              ),
              blurRadius: selected ? 28 : 12,
              spreadRadius: selected ? 3 : 0,
            ),

          ],
        ),

        child: Icon(
          _iconForModule(),
          color: selected
              ? Colors.black
              : Colors.cyanAccent,
          size: 28,
        ),
      ),
    );
  }
}