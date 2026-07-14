import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),


                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.82,
                children: [
                  DashboardCard(
                    icon: Icons.shopping_bag_rounded,
                    title: "125",
                    subtitle: "Orders",
                    color: const Color(0xFF5B8DEF), // Royal Blue
                  ),

                  DashboardCard(
                    icon: Icons.inventory_2_rounded,
                    title: "320",
                    subtitle: "Products",
                    color: const Color(0xFFFF8A65), // Coral Orange
                  ),

                  DashboardCard(
                    icon: Icons.currency_rupee_rounded,
                    title: "₹85K",
                    subtitle: "Revenue",
                    color: const Color(0xFF00C853), // Emerald Green
                  ),

                  DashboardCard(
                    icon: Icons.people_alt_rounded,
                    title: "1,250",
                    subtitle: "Customers",
                    color: const Color(0xFF7E57C2), // Deep Purple
                  ),

                  DashboardCard(
                    icon: Icons.local_shipping_rounded,
                    title: "48",
                    subtitle: "Pending",
                    color: const Color(0xFFFF5252), // Soft Red
                  ),

                  DashboardCard(
                    icon: Icons.star_rounded,
                    title: "4.9",
                    subtitle: "Rating",
                    color: const Color(0xFFFFC107), // Gold
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}