import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/routes.dart';
import '../../core/constants/app_colors.dart';
import '../../viewmodels/garage_viewmodel.dart';

import '../../widgets/vehicle_info_card.dart';
import '../../widgets/health_card.dart';

import '../../core/widgets/glowing_button.dart';

class GarageScreen extends StatelessWidget {
  const GarageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<GarageViewModel>();

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(22),
          children: [

            const SizedBox(height: 20),

            const Text(
              "My Vehicle",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              vm.vehicleName,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 35),

            //----------------------------------------------------------
            // Vehicle Image Card
            //----------------------------------------------------------

            Container(
              height: 240,
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.cyanAccent.withOpacity(.25),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(.08),
                    blurRadius: 25,
                    spreadRadius: 1,
                  ),
                ],
              ),

              child: Stack(
                alignment: Alignment.center,
                children: [

                  //--------------------------------------------
                  // Blue Glow
                  //--------------------------------------------

                  Container(
                    width: 230,
                    height: 230,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.cyanAccent.withOpacity(.08),
                    ),
                  ),

                  //--------------------------------------------
                  // Hero Car Image
                  //--------------------------------------------

                  Hero(
                    tag: "car",
                    child: Image.asset(
                      "assets/images/car_side.png",
                      height: 180,
                      fit: BoxFit.contain,
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 30),

            //----------------------------------------------------------
            // Vehicle Information
            //----------------------------------------------------------

            Row(
              children: [

                VehicleInfoCard(
                  title: "Battery",
                  value: "${vm.battery}%",
                  icon: Icons.battery_charging_full,
                ),

                const SizedBox(width: 15),

                VehicleInfoCard(
                  title: "Mileage",
                  value: "${vm.mileage}",
                  icon: Icons.speed,
                ),

              ],
            ),

            const SizedBox(height: 25),

            //----------------------------------------------------------
            // Health
            //----------------------------------------------------------

            HealthCard(
              title: "Vehicle Health",
              value: vm.health,
            ),

            const SizedBox(height: 35),

            //----------------------------------------------------------
            // Launch Scanner
            //----------------------------------------------------------

            GlowingButton(
              text: "Launch AI Scanner",
              onPressed: () {

                Navigator.pushNamed(
                  context,
                  Routes.scanner,
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