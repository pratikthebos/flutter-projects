import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/widgets/custom_appbar.dart';
import '../../core/widgets/gradient_button.dart';
import '../../core/widgets/meal_card.dart';
import '../../core/widgets/section_title.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),

          children: [

            Row(
              children: [

                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),

                const Expanded(
                  child: CustomAppBar(
                    title: "Today's Meals",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: AppColors.orangeGradient,
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Monday, 10 August 2026",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Total Meals Planned : 425",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Today's Menu",
            ),

            const SizedBox(height: 18),

            MealCard(
              meal: "Breakfast",
              icon: AppIcons.breakfast,
              gradient: AppColors.orangeGradient,
              items: const [
                "Poha",
                "Tea",
                "Coffee",
                "Banana",
                "Boiled Egg",
              ],
            ),

            MealCard(
              meal: "Lunch",
              icon: AppIcons.lunch,
              gradient: AppColors.greenGradient,
              items: const [
                "Rice",
                "Dal Fry",
                "Chapati",
                "Paneer",
                "Salad",
                "Sweet",
              ],
            ),

            MealCard(
              meal: "Snacks",
              icon: AppIcons.snacks,
              gradient: AppColors.blueGradient,
              items: const [
                "Tea",
                "Coffee",
                "Samosa",
                "Sandwich",
              ],
            ),

            MealCard(
              meal: "Dinner",
              icon: AppIcons.dinner,
              gradient: AppColors.purpleGradient,
              items: const [
                "Chapati",
                "Rice",
                "Mixed Veg",
                "Dal",
                "Curd",
              ],
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Meal Summary",
            ),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),

              child: const Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("Breakfast"),
                      Text(
                        "120",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),

                  Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("Lunch"),
                      Text(
                        "150",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),

                  Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("Snacks"),
                      Text(
                        "60",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),

                  Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("Dinner"),
                      Text(
                        "95",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),

            const SizedBox(height: 35),

            GradientButton(
              title: "Edit Today's Menu",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Edit Menu (Demo)"),
                  ),
                );
              },
            ),

            const SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}