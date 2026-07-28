import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/widgets/animated_background.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/section_title.dart';
import '../../viewmodels/dashboard_viewmodel.dart';
import '../../widgets/dashboard_card.dart';
import '../../widgets/quick_action_card.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/visitor_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<DashboardViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AnimatedBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [

              const CustomAppBar(),

              const SizedBox(height: 24),

              const DashboardCard(),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Today's Activity",
              ),

              const SizedBox(height: 18),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: vm.stats.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final item = vm.stats[index];

                  return StatCard(
                    icon: item.icon,
                    title: item.title,
                    value: item.value,
                    color: item.color,
                  );
                },
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Quick Actions",
              ),

              const SizedBox(height: 18),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,
                children: [

                  QuickActionCard(
                    icon: AppIcons.addVisitor,
                    title: "New Visitor",
                    color: AppColors.primary,
                    onTap: () {},
                  ),

                  QuickActionCard(
                    icon: AppIcons.cab,
                    title: "Cab Entry",
                    color: AppColors.warning,
                    onTap: () {},
                  ),

                  QuickActionCard(
                    icon: AppIcons.delivery,
                    title: "Delivery",
                    color: AppColors.secondary,
                    onTap: () {},
                  ),

                  QuickActionCard(
                    icon: AppIcons.staff,
                    title: "Staff Entry",
                    color: AppColors.success,
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Recent Visitors",
              ),

              const SizedBox(height: 18),

              ...vm.visitors.map(
                    (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: VisitorCard(visitor: e),
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