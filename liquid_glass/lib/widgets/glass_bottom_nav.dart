import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBottomNav extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const GlassBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<GlassBottomNav> createState() => _GlassBottomNavState();
}

class _GlassBottomNavState extends State<GlassBottomNav> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),

          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 22,
              sigmaY: 22,
            ),

            child: Container(
              height: 78,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),

                border: Border.all(
                  color: Colors.white.withOpacity(.18),
                ),

                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(.20),
                    Colors.white.withOpacity(.08),
                  ],
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.18),
                    blurRadius: 25,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [

                  _item(
                    0,
                    Icons.home_rounded,
                    "Home",
                  ),

                  _item(
                    1,
                    Icons.grid_view_rounded,
                    "Apps",
                  ),

                  _item(
                    2,
                    Icons.favorite_rounded,
                    "Favorite",
                  ),

                  _item(
                    3,
                    Icons.person_rounded,
                    "Profile",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _item(
      int index,
      IconData icon,
      String label,
      ) {
    final bool selected = widget.currentIndex == index;

    return GestureDetector(
      onTap: () => widget.onTap(index),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),

        padding: EdgeInsets.symmetric(
          horizontal: selected ? 16 : 10,
          vertical: 10,
        ),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          gradient: selected
              ? const LinearGradient(
            colors: [
              Color(0xff4F46E5),
              Color(0xff7C3AED),
            ],
          )
              : null,

          color: selected
              ? null
              : Colors.transparent,
        ),

        child: Row(
          children: [

            Icon(
              icon,
              color: Colors.white,
              size: 26,
            ),

            if (selected) ...[
              const SizedBox(width: 8),

              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}