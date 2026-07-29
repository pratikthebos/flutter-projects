import 'package:flutter/material.dart';

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 210,

      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(28),

        gradient: const LinearGradient(
          colors: [
            Color(0xff7C3AED),
            Color(0xffA855F7),
          ],
        ),

      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text(
            "Total Portfolio",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),

          const Spacer(),

          const Text(
            "\$124,895.67",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text("+4.82%"),
          ),
        ],
      ),
    );
  }
}