import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../widgets/custom_bottom_nav.dart';

import '../discover/discover_screen.dart';
import '../explore/explore_screen.dart';
import '../ai/ai_screen.dart';
import '../tech/tech_screen.dart';
import '../lifestyle/lifestyle_screen.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const screens = [
    DiscoverScreen(),
    ExploreScreen(),
    AiScreen(),
    TechScreen(),
    LifestyleScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: IndexedStack(
          index: vm.selectedIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar:
      const CustomBottomNav(),
    );
  }
}