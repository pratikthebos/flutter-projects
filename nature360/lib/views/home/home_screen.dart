import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/routes.dart';

import '../../core/constants/app_strings.dart';

import '../../core/widgets/animated_background.dart';

import '../../viewmodels/home_viewmodel.dart';
import '../../viewmodels/viewer_viewmodel.dart';

import '../../widgets/place_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeVM = context.watch<HomeViewModel>();
    final viewerVM = context.read<ViewerViewModel>();

    return Scaffold(
      body: Stack(
        children: [

          //------------------------------------
          // Animated Background
          //------------------------------------

          const AnimatedBackground(),

          SafeArea(

            child: Column(

              children: [

                const SizedBox(height: 20),

                //------------------------------------
                // Header
                //------------------------------------

                const Padding(

                  padding: EdgeInsets.symmetric(horizontal: 22),

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(

                        AppStrings.appName,

                        style: TextStyle(

                          fontSize: 34,

                          fontWeight: FontWeight.bold,

                          color: Color(0xff263238),

                        ),

                      ),

                      SizedBox(height: 8),

                      Text(

                        AppStrings.choosePlace,

                        style: TextStyle(

                          fontSize: 17,

                          color: Colors.black54,

                        ),

                      ),

                    ],

                  ),

                ),

                const SizedBox(height: 25),

                //------------------------------------
                // Places
                //------------------------------------

                Expanded(

                  child: ListView.builder(

                    physics:
                    const BouncingScrollPhysics(),

                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),

                    itemCount: homeVM.places.length,

                    itemBuilder: (_, index) {

                      final place =
                      homeVM.places[index];

                      return Padding(

                        padding:
                        const EdgeInsets.only(
                          bottom: 22,
                        ),

                        child: Hero(

                          tag: place.image,

                          child: PlaceCard(

                            place: place,

                            onTap: () {

                              viewerVM.selectPlace(
                                place,
                              );

                              Navigator.pushNamed(
                                context,
                                Routes.viewer,
                              );

                            },

                          ),

                        ),

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