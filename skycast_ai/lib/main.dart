import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/splash/splash_screen.dart';
import 'views/home/home_screen.dart';
import 'views/forecast/forecast_screen.dart';
import 'views/analytics/analytics_screen.dart';

import 'viewmodels/home_viewmodel.dart';
import 'viewmodels/forecast_viewmodel.dart';
import 'viewmodels/analytics_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ForecastViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => AnalyticsViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndex = 0;

  final pages = const [
    HomeScreen(),
    ForecastScreen(),
    AnalyticsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        backgroundColor: const Color(0xff151A35),

        selectedItemColor: const Color(0xff7C3AED),

        unselectedItemColor: Colors.white60,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: "Forecast",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: "Analytics",
          ),

        ],
      ),
    );
  }
}