import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/routes.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

import '../../core/widgets/glowing_button.dart';
import '../../core/widgets/hud_background.dart';
import '../../core/widgets/particle_effect.dart';
import '../../core/widgets/rotating_ring.dart';
import '../../core/widgets/energy_ring.dart';

import '../../widgets/suit_health_card.dart';
import '../../widgets/suit_status_card.dart';
import '../../widgets/energy_card.dart';

import '../../viewmodels/garage_viewmodel.dart';

class GarageScreen extends StatefulWidget {
  const GarageScreen({super.key});

  @override
  State<GarageScreen> createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController suitController;

  @override
  void initState() {
    super.initState();

    suitController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {

    final vm = context.watch<GarageViewModel>();

    return Scaffold(

      backgroundColor: Colors.black,


      body: Stack(

        children: [



          SafeArea(

            child: ListView(

              padding: const EdgeInsets.all(20),

              children: [

                const SizedBox(height: 10),

                const Text(

                  "Suit Garage",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 32,

                    fontWeight: FontWeight.bold,

                  ),

                ),

                const SizedBox(height: 5),

                Text(

                  vm.suitName,

                  style: const TextStyle(

                    color: Colors.white70,

                    fontSize: 18,

                  ),

                ),

                const SizedBox(height: 30),

                //-------------------------------------------------
                // Iron Man Suit
                //-------------------------------------------------

                SizedBox(
                  height: 500,
                  child: AnimatedBuilder(
                    animation: suitController,
                    builder: (_, child) {
                      return Transform.translate(
                        offset: Offset(
                          0,
                          suitController.value * 10,
                        ),
                        child: child,
                      );
                    },
                    child: Hero(
                      tag: "ironman",
                      child: Image.asset(
                        AppAssets.ironman,
                        height: 430,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                //-------------------------------------------------
                // Suit Stats
                //-------------------------------------------------

                Row(

                  children: [

                    Expanded(

                      child: SuitHealthCard(

                        title: "Suit Health",

                        value: vm.health,

                      ),

                    ),

                    const SizedBox(width: 15),

                    Expanded(

                      child: EnergyCard(

                        title: "Power",

                        value: vm.power,

                      ),

                    ),

                  ],

                ),

                const SizedBox(height: 20),

                SuitStatusCard(

                  version: vm.version,

                  owner: vm.owner,

                  energy: vm.energy,

                  flight: vm.flight,

                ),

                const SizedBox(height: 35),

                //-------------------------------------------------
                // Launch Button
                //-------------------------------------------------

                GlowingButton(

                  text: AppStrings.launchScanner,

                  onPressed: () {

                    Navigator.pushNamed(

                      context,

                      Routes.scanner,

                    );

                  },

                ),

                const SizedBox(height: 25),

              ],

            ),

          ),

        ],

      ),

    );

  }

  @override
  void dispose() {

    suitController.dispose();

    super.dispose();

  }

}