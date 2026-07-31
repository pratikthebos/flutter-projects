import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CyberButton extends StatefulWidget {
  final VoidCallback onTap;

  final IconData icon;

  final String title;

  final List<Color> colors;

  const CyberButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.colors,
  });

  @override
  State<CyberButton> createState() => _CyberButtonState();
}

class _CyberButtonState extends State<CyberButton> {

  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTapDown: (_) {
        setState(() {
          scale = .95;
        });
      },

      onTapUp: (_) {
        setState(() {
          scale = 1;
        });

        widget.onTap();
      },

      onTapCancel: () {
        setState(() {
          scale = 1;
        });
      },

      child: AnimatedScale(
        duration: const Duration(milliseconds: 160),

        scale: scale,

        child: Container(

          height: 60,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(22),

            gradient: LinearGradient(
              colors: widget.colors,
            ),

            boxShadow: [

              BoxShadow(
                color: widget.colors.first.withOpacity(.40),
                blurRadius: 22,
                spreadRadius: 1,
              ),

            ],
          ),

          child: Row(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Icon(
                widget.icon,
                color: Colors.white,
              ),

              const SizedBox(width: 12),

              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}