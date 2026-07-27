import 'package:flutter/material.dart';

import '../constants/app_icons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Icon(
            AppIcons.location,
            color: Colors.white,
          ),
        ),

        const SizedBox(width: 15),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Location",
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 3),
              Text(
                "Mumbai",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Icon(
            AppIcons.notification,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}