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
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "PE Test Report",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Daily Testing Report Generator",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Statistics Cards
            Row(
              children: [

                DashboardCard(
                  icon: Icons.description,
                  title: "Total Reports",
                  value: "24",
                  color: Colors.indigo,
                  onTap: () {},
                ),

                const SizedBox(width: 15),

                DashboardCard(
                  icon: Icons.today,
                  title: "Today's Reports",
                  value: "2",
                  color: Colors.green,
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 25),

            /// Progress Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Today's Progress",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 15),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const LinearProgressIndicator(
                      value: .80,
                      minHeight: 10,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "80% Completed",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// Create Report
            _menuCard(
              context,
              icon: Icons.add_circle_outline,
              title: "Create New Report",
              subtitle: "Start today's testing",
              color: Colors.blue,
              onTap: () {},
            ),

            const SizedBox(height: 15),

            /// History
            _menuCard(
              context,
              icon: Icons.history,
              title: "Report History",
              subtitle: "View previous reports",
              color: Colors.orange,
              onTap: () {},
            ),

            const SizedBox(height: 15),

            /// Settings
            _menuCard(
              context,
              icon: Icons.settings,
              title: "Settings",
              subtitle: "Application preferences",
              color: Colors.purple,
              onTap: () {},
            ),

            const SizedBox(height: 30),

            const Text(
              "Last Report",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.description),
                ),
                title: Text("17-Jul-2026"),
                subtitle: Text(
                  "Pratik • Android • Samsung S24\nVersion 2.6.1",
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required Color color,
        required VoidCallback onTap,
      }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}