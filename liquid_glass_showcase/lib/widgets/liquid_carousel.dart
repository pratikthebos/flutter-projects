import 'package:flutter/material.dart';

import 'liquid_card.dart';

class LiquidCarousel extends StatelessWidget {
  const LiquidCarousel({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: 240,

      child: PageView.builder(

        controller: PageController(
          viewportFraction: .82,
        ),

        itemCount: 5,

        itemBuilder: (_, index) {

          return Padding(

            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),

            child: LiquidCard(

              title: "Glass Card ${index + 1}",

              icon: Icons.auto_awesome,

            ),

          );

        },

      ),

    );

  }

}