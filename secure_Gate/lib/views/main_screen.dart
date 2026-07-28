import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import 'dashboard/dashboard_screen.dart';
import 'history/history_screen.dart';
import 'visitor/visitor_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    DashboardScreen(),
    VisitorScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              blurRadius: 20,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BottomNavigationBar(
            currentIndex: currentIndex,

            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },

            backgroundColor: AppColors.surface,

            elevation: 0,

            type: BottomNavigationBarType.fixed,

            selectedItemColor: AppColors.primary,

            unselectedItemColor: Colors.white54,

            items: const [

              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_rounded),
                label: "Dashboard",
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt_1_rounded),
                label: "Visitor",
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.history_rounded),
                label: "History",
              ),
            ],
          ),
        ),
      ),
    );
  }
}