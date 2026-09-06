import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_colors.dart';
import '../viewmodels/home_viewmodel.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  static const icons = [
    Icons.auto_awesome,
    Icons.explore_outlined,
    Icons.psychology_outlined,
    Icons.memory_outlined,
    Icons.favorite_border,
    Icons.person_outline,
  ];

  static const labels = [
    'Discover',
    'Explore',
    'AI',
    'Tech',
    'Life',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF0B0B10),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: Colors.white.withOpacity(.08),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.5),
              blurRadius: 30,
            ),
          ],
        ),
        child: Row(
          children: List.generate(
            icons.length,
                (index) {
              final selected =
                  vm.selectedIndex == index;

              return Expanded(
                child: GestureDetector(
                  onTap: () => vm.changeTab(index),
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration:
                    const Duration(milliseconds: 280),
                    curve: Curves.easeOut,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.purple
                          .withOpacity(.16)
                          : Colors.transparent,
                      borderRadius:
                      BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedScale(
                          scale: selected ? 1.1 : 1,
                          duration: const Duration(
                            milliseconds: 250,
                          ),
                          child: Icon(
                            icons[index],
                            size: 21,
                            color: selected
                                ? AppColors.cyan
                                : AppColors.muted,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: selected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: selected
                                ? Colors.white
                                : AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}