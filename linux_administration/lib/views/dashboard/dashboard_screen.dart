import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/dashboard_card.dart';
import '../../core/widgets/section_title.dart';

import '../../viewmodels/dashboard_viewmodel.dart';

import '../terminal/terminal_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  IconData getIcon(String icon) {
    switch (icon) {
      case "health":
        return AppIcons.health;

      case "service":
        return AppIcons.service;

      case "logs":
        return AppIcons.logs;

      case "users":
        return AppIcons.users;

      case "password":
        return AppIcons.password;

      case "firewall":
        return AppIcons.firewall;

      case "network":
        return AppIcons.network;

      case "backup":
        return AppIcons.backup;

      case "vm":
        return AppIcons.vm;

      case "audit":
        return AppIcons.audit;

      case "docker":
        return AppIcons.docker;

      case "kubernetes":
        return AppIcons.kubernetes;

      default:
        return Icons.terminal;
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DashboardViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const CustomAppBar(),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(26),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Linux Server Overview",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Ubuntu 24.04 LTS\nServer Status : Healthy",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Administration Modules",
            ),

            const SizedBox(height: 20),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: vm.modules.length,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: .65,
              ),

              itemBuilder: (context, index) {
                final module = vm.modules[index];

                return DashboardCard(
                  icon: getIcon(module.icon),

                  title: module.title,

                  subtitle: module.command,

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TerminalScreen(
                          module: module,
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}