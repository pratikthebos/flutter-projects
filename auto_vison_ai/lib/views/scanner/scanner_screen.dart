import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';

import '../../viewmodels/scanner_viewmodel.dart';

import '../../widgets/car_view.dart';
import '../../widgets/radar_animation.dart';
import '../../widgets/scan_line.dart';
import '../../widgets/scan_result_card.dart';
import '../../widgets/diagnostics_card.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ScannerViewModel>();

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 20),
          children: [

            //--------------------------------------------
            // App Bar
            //--------------------------------------------

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Row(
                children: [

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Expanded(
                    child: Text(
                      "AI Vehicle Scanner",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(.15),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      children: [

                        Icon(
                          Icons.circle,
                          color: Colors.greenAccent,
                          size: 12,
                        ),

                        SizedBox(width: 8),

                        Text(
                          "ONLINE",
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 10),

            //--------------------------------------------
            // Radar
            //--------------------------------------------

            const RadarAnimation(),

            const SizedBox(height: 20),

            //--------------------------------------------
            // Car + Scan Line
            //--------------------------------------------

            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [

                  CarView(
                    selectedPart: vm.selectedPart,
                    onPartSelected: (part) {
                      vm.scan(part);
                    },
                  ),

                  ScanLine(
                    scanning: vm.scanning,
                  ),

                ],
              ),
            ),

            //--------------------------------------------------
// Selected Part
//--------------------------------------------------

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Container(

                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(

                  color: AppColors.card,

                  borderRadius: BorderRadius.circular(22),

                  border: Border.all(
                    color: Colors.cyanAccent.withOpacity(.25),
                  ),

                ),

                child: Row(

                  children: [

                    const Icon(

                      Icons.ads_click,

                      color: Colors.cyanAccent,

                    ),

                    const SizedBox(width: 12),

                    const Text(

                      "Selected Part",

                      style: TextStyle(

                        color: Colors.white70,

                        fontSize: 16,

                      ),

                    ),

                    const Spacer(),

                    Text(

                      vm.selectedPart,

                      style: const TextStyle(

                        color: Colors.cyanAccent,

                        fontSize: 18,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ],

                ),

              ),

            ),

            const SizedBox(height: 18),

//--------------------------------------------------
// Scan Result
//--------------------------------------------------

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: ScanResultCard(

                part: vm.selectedPart,

                scanning: vm.scanning,

              ),

            ),

            const SizedBox(height: 18),

//--------------------------------------------------
// AI Diagnostics
//--------------------------------------------------

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: DiagnosticsCard(

                scanning: vm.scanning,

                selectedPart: vm.selectedPart,

              ),

            ),

            const SizedBox(height: 22),

//--------------------------------------------------
// Bottom Button
//--------------------------------------------------

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: SizedBox(

                width: double.infinity,

                height: 58,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.cyanAccent,

                    foregroundColor: Colors.black,

                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(30),

                    ),

                  ),

                  onPressed: () {

                    vm.scan(vm.selectedPart);

                  },

                  child: Text(

                    vm.scanning

                        ? "SCANNING..."

                        : "SCAN ${vm.selectedPart.toUpperCase()}",

                    style: const TextStyle(

                      fontWeight: FontWeight.bold,

                      letterSpacing: 1.2,

                      fontSize: 16,

                    ),

                  ),

                ),

              ),

            ),

            const SizedBox(height: 25),

          ],
        ),
      ),
    );
  }
}