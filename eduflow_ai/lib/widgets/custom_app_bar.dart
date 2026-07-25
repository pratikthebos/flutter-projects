import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  String _greeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    final today = DateFormat("EEEE, dd MMM").format(DateTime.now());

    return Row(
      children: [

        Hero(
          tag: "student_avatar",
          child: Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff4F46E5),
                  Color(0xff06B6D4),
                ],
              ),
            ),
            child: const Icon(
              Icons.school,
              color: Colors.white,
              size: 32,
            ),
          ),
        )
            .animate()
            .scale(duration: 700.ms)
            .fade(),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                _greeting(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "Tarkesh Gurav",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                today,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
            .animate()
            .slideX(begin: -.3)
            .fade(),

        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.06),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            children: [

              Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_rounded,
                    color: Color(0xff4F46E5),
                  ),
                ),
              ),

              Positioned(
                top: 12,
                right: 14,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
        )
            .animate()
            .scale(delay: 500.ms),
      ],
    );
  }
}