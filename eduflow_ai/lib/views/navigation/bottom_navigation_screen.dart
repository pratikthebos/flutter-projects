import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../timetable/timetable_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() =>
      _BottomNavigationScreenState();
}

class _BottomNavigationScreenState
    extends State<BottomNavigationScreen> {

  int currentIndex = 0;

  final pages = const [

    HomeScreen(),

    TimetableScreen(),

    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: NavigationBar(

        selectedIndex: currentIndex,

        height: 75,

        elevation: 10,

        backgroundColor: Colors.white,

        indicatorColor:
        const Color(0xff4F46E5).withOpacity(.15),

        onDestinationSelected: (index) {

          setState(() {

            currentIndex = index;

          });

        },

        destinations: const [

          NavigationDestination(

            icon: Icon(Icons.home_outlined),

            selectedIcon: Icon(Icons.home),

            label: "Home",

          ),

          NavigationDestination(

            icon: Icon(Icons.calendar_month_outlined),

            selectedIcon: Icon(Icons.calendar_month),

            label: "Timetable",

          ),

          NavigationDestination(

            icon: Icon(Icons.person_outline),

            selectedIcon: Icon(Icons.person),

            label: "Profile",

          ),

        ],

      ),

    );

  }
}