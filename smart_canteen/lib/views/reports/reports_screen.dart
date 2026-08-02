import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_appbar.dart';
import '../../core/widgets/section_title.dart';
import '../../core/widgets/chart_card.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),

          children: [

            Row(
              children: [

                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),

                const Expanded(
                  child: CustomAppBar(
                    title: "Reports & Analytics",
                  ),
                ),

              ],
            ),

            const SizedBox(height: 25),

            //--------------------------------------------------
            // KPI SUMMARY
            //--------------------------------------------------

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: AppColors.purpleGradient,
                borderRadius: BorderRadius.circular(24),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Today's Performance",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    "Overall Score : 94%",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),

                  SizedBox(height: 15),

                  LinearProgressIndicator(
                    value: .94,
                    color: Colors.white,
                    backgroundColor: Colors.white24,
                  ),

                ],
              ),
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Key Performance Indicators",
            ),

            const SizedBox(height: 18),

            Row(
              children: [

                Expanded(
                  child: _kpiCard(
                    Icons.restaurant,
                    "Meals",
                    "425",
                    Colors.orange,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: _kpiCard(
                    Icons.people,
                    "Staff",
                    "18",
                    Colors.green,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [

                Expanded(
                  child: _kpiCard(
                    Icons.cleaning_services,
                    "Cleaning",
                    "85%",
                    Colors.blue,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: _kpiCard(
                    Icons.inventory,
                    "Stock",
                    "96%",
                    Colors.purple,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 30),

            ChartCard(
              title: "Meals Served Today",

              child: Column(
                children: [

                  _bar("Breakfast",120,150,Colors.orange),

                  _bar("Lunch",150,150,Colors.green),

                  _bar("Snacks",60,150,Colors.blue),

                  _bar("Dinner",95,150,Colors.purple),

                ],
              ),
            ),

            const SizedBox(height:25),

            ChartCard(
              title: "Daily Expenses",

              child: Column(
                children: const [

                  ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text("Groceries"),
                    trailing: Text("₹15,000"),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(Icons.local_shipping),
                    title: Text("Transport"),
                    trailing: Text("₹2,500"),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(Icons.groups),
                    title: Text("Staff Salary"),
                    trailing: Text("₹12,000"),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(Icons.receipt_long),
                    title: Text("Total"),
                    trailing: Text(
                      "₹29,500",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height:25),

            ChartCard(
              title: "System Summary",

              child: Column(
                children: const [

                  ListTile(
                    title: Text("Breakfast Served"),
                    trailing: Text("120"),
                  ),

                  Divider(),

                  ListTile(
                    title: Text("Lunch Served"),
                    trailing: Text("150"),
                  ),

                  Divider(),

                  ListTile(
                    title: Text("Dinner Served"),
                    trailing: Text("95"),
                  ),

                  Divider(),

                  ListTile(
                    title: Text("Attendance"),
                    trailing: Text("18/21"),
                  ),

                  Divider(),

                  ListTile(
                    title: Text("Housekeeping"),
                    trailing: Text("85%"),
                  ),

                  Divider(),

                  ListTile(
                    title: Text("Inventory Health"),
                    trailing: Text("96%"),
                  ),

                ],
              ),
            ),

            const SizedBox(height:30),

            ElevatedButton.icon(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity,60),
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),

              icon: const Icon(Icons.download),

              label: const Text(
                "Download Report (Demo)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height:40),

          ],
        ),
      ),
    );
  }

  static Widget _kpiCard(
      IconData icon,
      String title,
      String value,
      Color color,
      ) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
            offset: Offset(0,5),
          ),
        ],
      ),

      child: Column(
        children: [

          CircleAvatar(
            radius: 28,
            backgroundColor: color.withOpacity(.15),
            child: Icon(icon,color: color),
          ),

          const SizedBox(height:15),

          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(title),

        ],
      ),
    );
  }

  static Widget _bar(
      String title,
      double value,
      double max,
      Color color,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom:18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Expanded(child: Text(title)),

              Text(value.toInt().toString()),

            ],
          ),

          const SizedBox(height:8),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: value/max,
              minHeight: 10,
              color: color,
              backgroundColor: Colors.grey.shade200,
            ),
          ),

        ],
      ),
    );
  }
}