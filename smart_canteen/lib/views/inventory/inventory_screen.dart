import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_appbar.dart';
import '../../core/widgets/section_title.dart';
import '../../core/widgets/status_chip.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

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
                    title: "Inventory",
                  ),
                ),

              ],
            ),

            const SizedBox(height: 25),

            //-------------------------------------------------------
            /// SUMMARY
            //-------------------------------------------------------

            Container(
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                gradient: AppColors.blueGradient,
                borderRadius: BorderRadius.circular(24),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Inventory Status",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "96% Stock Available",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),

                  SizedBox(height: 15),

                  LinearProgressIndicator(
                    value: .96,
                    color: Colors.white,
                    backgroundColor: Colors.white24,
                  ),

                ],
              ),
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Food Inventory",
            ),

            const SizedBox(height: 15),

            _stock(
              "Rice",
              "240 Kg",
              .95,
              Colors.green,
            ),

            _stock(
              "Dal",
              "110 Kg",
              .80,
              Colors.orange,
            ),

            _stock(
              "Cooking Oil",
              "75 L",
              .72,
              Colors.orange,
            ),

            _stock(
              "Milk",
              "48 L",
              .55,
              Colors.red,
            ),

            _stock(
              "Vegetables",
              "125 Kg",
              .91,
              Colors.green,
            ),

            _stock(
              "Sugar",
              "65 Kg",
              .85,
              Colors.green,
            ),

            _stock(
              "Spices",
              "38 Kg",
              .64,
              Colors.orange,
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: "Low Stock Alerts",
            ),

            const SizedBox(height: 15),

            _alert(
              "Milk",
              "Only 48 L Remaining",
            ),

            _alert(
              "Cooking Oil",
              "75 L Remaining",
            ),

            _alert(
              "Spices",
              "Refill Required",
            ),

            const SizedBox(height: 35),

          ],
        ),
      ),
    );
  }

  static Widget _stock(
      String item,
      String qty,
      double progress,
      Color color,
      ) {

    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
            offset: Offset(0,5),
          )
        ],
      ),

      child: Column(
        children: [

          Row(
            children: [

              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),

              Text(
                qty,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),

          const SizedBox(height: 15),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              color: color,
              backgroundColor: Colors.grey.shade200,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [

              Text(
                "${(progress * 100).toInt()}%",
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              StatusChip(
                text: progress > .75
                    ? "Healthy"
                    : "Low Stock",
                color: progress > .75
                    ? Colors.green
                    : Colors.orange,
              ),

            ],
          ),

        ],
      ),
    );
  }

  static Widget _alert(
      String item,
      String message,
      ) {

    return Container(
      margin: const EdgeInsets.only(bottom: 15),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: Colors.orange,
        ),
      ),

      child: Row(
        children: [

          const Icon(
            Icons.warning_amber_rounded,
            color: Colors.orange,
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  item,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(message),

              ],
            ),
          ),

        ],
      ),
    );
  }
}