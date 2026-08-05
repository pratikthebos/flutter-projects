import 'package:flutter/material.dart';
import 'package:liquid_glass_showcase/core/widgets/floating_bubbles.dart';
import 'package:liquid_glass_showcase/widgets/premium_carousel.dart';
import 'package:provider/provider.dart';

import '../../app/routes.dart';

import '../../viewmodels/home_viewmodel.dart';

import '../../core/widgets/glass_background.dart';
import '../../core/widgets/glass_button.dart';

import '../../widgets/liquid_carousel.dart';
import '../../widgets/floating_icon.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final vm = context.watch<HomeViewModel>();

    return Scaffold(

      body: Stack(

        children: [

          const GlassBackground(),

          const Positioned.fill(

            child: IgnorePointer(

              child: FloatingBubbles(),

            ),

          ),

          SafeArea(

            child: Column(

              children: [

                const SizedBox(height: 20),

                const FloatingIcon(

                  icon: Icons.auto_awesome,

                  size: 90,

                ),

                const SizedBox(height: 20),

                const Text(

                  "Liquid Glass",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 34,

                    fontWeight: FontWeight.bold,

                  ),

                ),

                const SizedBox(height: 10),

                const Text(

                  "Animation Vision Style",

                  style: TextStyle(

                    color: Colors.white60,

                  ),

                ),

                const SizedBox(height: 40),

                const PremiumCarousel(),

                const Spacer(),

                Padding(

                  padding: const EdgeInsets.all(20),

                  child: GlassButton(

                    text: "Explore Gallery",

                    onPressed: () {

                      Navigator.pushNamed(

                        context,

                        Routes.gallery,

                      );

                    },

                  ),

                ),

              ],

            ),

          ),

        ],

      ),

    );

  }

}