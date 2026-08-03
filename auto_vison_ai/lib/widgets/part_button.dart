import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/app_colors.dart';

class PartButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const PartButton({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  State<PartButton> createState() => _PartButtonState();
}

class _PartButtonState extends State<PartButton>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  late Animation<double> _scale;

  @override
  void initState() {

    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _scale = Tween<double>(
      begin: 1,
      end: 1.08,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    if (widget.selected) {
      _controller.repeat(reverse: true);
    }

  }

  @override
  void didUpdateWidget(covariant PartButton oldWidget) {

    super.didUpdateWidget(oldWidget);

    if (widget.selected) {

      _controller.repeat(reverse: true);

    } else {

      _controller.stop();

      _controller.reset();

    }

  }

  @override
  Widget build(BuildContext context) {

    return ScaleTransition(

      scale: _scale,

      child: GestureDetector(

        onTap: () {

          HapticFeedback.lightImpact();

          widget.onTap();

        },

        child: AnimatedContainer(

          duration: const Duration(milliseconds: 350),

          width: 74,

          height: 74,

          decoration: BoxDecoration(

            shape: BoxShape.circle,

            gradient: widget.selected

                ? const LinearGradient(

              colors: [

                Color(0xff00E5FF),

                Color(0xff00BCD4),

              ],

            )

                : null,

            color: widget.selected

                ? null
                : AppColors.card,

            border: Border.all(

              color: Colors.cyanAccent,

              width: 2,

            ),

            boxShadow: [

              BoxShadow(

                color: widget.selected

                    ? Colors.cyanAccent.withOpacity(.55)
                    : Colors.transparent,

                blurRadius: 25,

                spreadRadius: 2,

              ),

            ],

          ),

          child: Icon(

            widget.icon,

            size: 32,

            color: widget.selected

                ? Colors.black
                : Colors.cyanAccent,

          ),

        ),

      ),

    );

  }

  @override
  void dispose() {

    _controller.dispose();

    super.dispose();

  }

}