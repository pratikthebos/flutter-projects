import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_app_bar.dart';

import '../../viewmodels/dashboard_viewmodel.dart';

import '../../widgets/dashboard_card.dart';
import '../../widgets/code_viewer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final vm = context.watch<DashboardViewModel>();

    return Scaffold(

      backgroundColor: AppColors.background,

      body: SafeArea(

        child: ListView(

          padding: const EdgeInsets.all(20),

          children: [

            const CustomAppBar(),

            const SizedBox(height: 25),

            Container(

              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(

                gradient: AppColors.primaryGradient,

                borderRadius: BorderRadius.circular(30),

              ),

              child: const Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(

                    "Welcome Back 👋",

                    style: TextStyle(
                      color: Colors.white70,
                    ),

                  ),

                  SizedBox(height: 8),

                  Text(

                    "Student",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 30,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  SizedBox(height: 10),

                  Text(

                    "Authentication completed successfully.",

                    style: TextStyle(

                      color: Colors.white,

                    ),

                  ),

                ],

              ),

            ),

            const SizedBox(height: 30),

            const Text(

              "System Status",

              style: TextStyle(

                fontSize: 24,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 20),

            GridView.builder(

              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              itemCount: vm.cards.length,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 2,

                crossAxisSpacing: 16,

                mainAxisSpacing: 16,

                childAspectRatio: .95,

              ),

              itemBuilder: (_, index) {

                final item = vm.cards[index];

                return DashboardCard(

                  icon: item.icon,

                  title: item.title,

                  value: item.value,

                  color: item.color,

                );

              },

            ),

            const SizedBox(height: 35),

            const Text(

              "API Response",

              style: TextStyle(

                fontSize: 24,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 18),

            const CodeViewer(),

            const SizedBox(height: 40),

          ],

        ),

      ),

    );

  }

}