import 'package:flutter/material.dart';

import '../dashboard/dashboard_screen.dart';
import '../meals/meals_screen.dart';
import '../attendance/attendance_screen.dart';
import '../inventory/inventory_screen.dart';
import '../reports/reports_screen.dart';

import '../../core/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  final screens = const [
    DashboardScreen(),
    MealsScreen(),
    AttendanceScreen(),
    InventoryScreen(),
    ReportsScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: screens[currentIndex],
      ),

      bottomNavigationBar: NavigationBar(

        selectedIndex: currentIndex,

        indicatorColor: AppColors.primary.withOpacity(.15),

        onDestinationSelected: (index){

          setState(() {

            currentIndex = index;

          });

        },

        destinations: const [

          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),

          NavigationDestination(
            icon: Icon(Icons.restaurant_menu_outlined),
            selectedIcon: Icon(Icons.restaurant_menu),
            label: "Meals",
          ),

          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: "Attendance",
          ),

          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: "Inventory",
          ),

          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: "Reports",
          ),

        ],

      ),

    );

  }

}