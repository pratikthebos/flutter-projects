import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/card_stack.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,

        title: const Text(
          "Smart Home",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),

        actions: [
          Container(
            margin: const EdgeInsets.only(right: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.08),
                  blurRadius: 10,
                ),
              ],
            ),

            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 15),

              //----------------------------------------
              // Greeting
              //----------------------------------------

              const Text(
                "Welcome Back 👋",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Monitor all smart devices in one place",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              //----------------------------------------
              // Search Bar
              //----------------------------------------

              Container(
                height: 58,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 12,
                    ),
                  ],
                ),

                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,

                    prefixIcon: Icon(
                      Icons.search,
                    ),

                    hintText: "Search devices...",

                    contentPadding: EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              //----------------------------------------
              // Card Stack
              //----------------------------------------

              const CardStack(),

              const Spacer(),

              //----------------------------------------
              // Swipe Hint
              //----------------------------------------

              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.06),
                        blurRadius: 12,
                      ),
                    ],
                  ),

                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Icon(
                        Icons.swipe,
                        color: Colors.deepPurple,
                      ),

                      SizedBox(width: 8),

                      Text(
                        "Swipe Left / Right",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),


    );
  }
}