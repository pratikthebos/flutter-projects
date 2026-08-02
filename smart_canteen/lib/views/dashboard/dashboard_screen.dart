import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_canteen/core/widgets/attendance_card.dart';
import 'package:smart_canteen/core/widgets/meal_card.dart';
import 'package:smart_canteen/widgets/meal_chart.dart';
import 'package:smart_canteen/widgets/today_summary.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';

import '../../core/widgets/custom_appbar.dart';
import '../../core/widgets/section_title.dart';
import '../../core/widgets/dashboard_card.dart';

import '../../viewmodels/dashboard_viewmodel.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<DashboardViewModel>(context);

    return Scaffold(

      backgroundColor: AppColors.background,

      body: SafeArea(

        child: ListView(

          padding: const EdgeInsets.all(20),

          children: [

            const CustomAppBar(
              title: "Good Morning, Admin",
            ),

            const SizedBox(height: 25),

            //--------------------------------------------------

            TodaySummary(
              date: vm.today,
              totalMeals: vm.totalMeals,
              staff: 18,
              inventory: 96,
              cleaning: 92,
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Today's Meals",
            ),

            const SizedBox(height: 18),

            //--------------------------------------------------
            /// Meals Statistics
            //--------------------------------------------------

            Row(
              children: [

                MealChart(
                  title: "Breakfast",
                  count: vm.breakfast.toString(),
                  icon: Icons.free_breakfast,
                  color: Colors.orange,
                ),

                const SizedBox(width: 15),

                MealChart(
                  title: "Lunch",
                  count: vm.lunch.toString(),
                  icon: Icons.lunch_dining,
                  color: Colors.green,
                ),

              ],
            ),

            const SizedBox(height: 15),

            Row(

              children: [

                Expanded(
                  child: _mealStat(
                    "Snacks",
                    vm.snacks.toString(),
                    Icons.local_cafe,
                    Colors.deepPurple,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: _mealStat(
                    "Dinner",
                    vm.dinner.toString(),
                    Icons.restaurant_menu,
                    Colors.blue,
                  ),
                ),

              ],

            ),

            const SizedBox(height: 35),

            const SectionTitle(
              title: "Management Modules",
            ),

            const SizedBox(height: 20),

            //--------------------------------------------------
            /// GRID
            //--------------------------------------------------

            GridView.count(

              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 18,
              crossAxisSpacing: 18,
              childAspectRatio: .82,

              children: [

                DashboardCard(
                  icon: AppIcons.breakfast,
                  title: "Breakfast",
                  subtitle: "Manage breakfast menu",
                  gradient: AppColors.orangeGradient,
                  onTap: () {},
                ),

                DashboardCard(
                  icon: AppIcons.lunch,
                  title: "Lunch",
                  subtitle: "Manage lunch menu",
                  gradient: AppColors.greenGradient,
                  onTap: () {},
                ),

                DashboardCard(
                  icon: AppIcons.dinner,
                  title: "Dinner",
                  subtitle: "Dinner Schedule",
                  gradient: AppColors.blueGradient,
                  onTap: () {},
                ),

                DashboardCard(
                  icon: AppIcons.attendance,
                  title: "Attendance",
                  subtitle: "Staff Attendance",
                  gradient: AppColors.purpleGradient,
                  onTap: () {},
                ),

              ],

            ),

            const SizedBox(height: 35),

            const SectionTitle(
              title: "Today's Meal Schedule",
            ),

            const SizedBox(height: 18),

            MealCard(
              meal: "Breakfast",
              icon: AppIcons.breakfast,
              gradient: AppColors.orangeGradient,
              items: [
                "Poha",
                "Tea",
                "Banana",
                "Boiled Egg",
              ],
            ),

            MealCard(
              meal: "Lunch",
              icon: AppIcons.lunch,
              gradient: AppColors.greenGradient,
              items: [
                "Rice",
                "Dal",
                "Paneer",
                "Chapati",
                "Salad",
              ],
            ),

            MealCard(
              meal: "Snacks",
              icon: AppIcons.snacks,
              gradient: AppColors.blueGradient,
              items: [
                "Samosa",
                "Tea",
                "Coffee",
              ],
            ),

            MealCard(
              meal: "Dinner",
              icon: AppIcons.dinner,
              gradient: AppColors.purpleGradient,
              items: [
                "Rice",
                "Chapati",
                "Mixed Veg",
                "Curd",
              ],
            ),

            const SizedBox(height: 35),

            const SectionTitle(
              title: "Today's Attendance",
            ),

            const SizedBox(height: 15),

            const AttendanceCard(
              present: 18,
              absent: 2,
              leave: 1,
            ),

            const SizedBox(height: 40),





            const SizedBox(height: 40),

          ],

        ),

      ),

    );

  }

  Widget _summaryCard(

      String title,

      String value,

      IconData icon,

      ) {

    return Expanded(

      child: Container(

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(

          color: Colors.white.withOpacity(.18),

          borderRadius: BorderRadius.circular(20),

        ),

        child: Column(

          children: [

            Icon(

              icon,

              color: Colors.white,

              size: 30,

            ),

            const SizedBox(height: 10),

            Text(

              value,

              style: const TextStyle(

                color: Colors.white,

                fontSize: 24,

                fontWeight: FontWeight.bold,

              ),

            ),

            Text(

              title,

              style: const TextStyle(

                color: Colors.white70,

              ),

            ),

          ],

        ),

      ),

    );

  }

  Widget _mealStat(

      String title,

      String value,

      IconData icon,

      Color color,

      ) {

    return Container(

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(22),

        boxShadow: const [

          BoxShadow(

            color: AppColors.shadow,

            blurRadius: 12,

            offset: Offset(0,5),

          ),

        ],

      ),

      child: Column(

        children: [

          CircleAvatar(

            radius: 28,

            backgroundColor: color.withOpacity(.15),

            child: Icon(

              icon,

              color: color,

              size: 28,

            ),

          ),

          const SizedBox(height: 15),

          Text(

            value,

            style: const TextStyle(

              fontWeight: FontWeight.bold,

              fontSize: 28,

            ),

          ),

          const SizedBox(height: 6),

          Text(title),

        ],

      ),

    );

  }

}