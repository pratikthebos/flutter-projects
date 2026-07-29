import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class SeatWidget extends StatelessWidget {
  final bool selected;
  final bool booked;
  final VoidCallback onTap;

  const SeatWidget({
    super.key,
    required this.selected,
    required this.booked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color color;

    if (booked) {
      color = AppColors.booked;
    } else if (selected) {
      color = AppColors.selected;
    } else {
      color = AppColors.available;
    }

    return GestureDetector(
      onTap: booked ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: booked
                ? Colors.grey
                : AppColors.primary,
          ),
          boxShadow: [
            if (selected)
              BoxShadow(
                color: AppColors.primary.withOpacity(.35),
                blurRadius: 10,
              ),
          ],
        ),
        child: Icon(
          Icons.event_seat,
          size: 18,
          color: booked
              ? Colors.white
              : selected
              ? Colors.white
              : AppColors.primary,
        ),
      ),
    );
  }
}