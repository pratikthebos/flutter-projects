import 'package:flutter/material.dart';

import '../utils/app_data.dart';
import 'animated_card.dart';

class CardStack extends StatefulWidget {
  const CardStack({super.key});

  @override
  State<CardStack> createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> {
  int currentIndex = 0;

  void nextCard() {
    setState(() {
      currentIndex = (currentIndex + 1) % AppData.cards.length;
    });
  }

  void previousCard() {
    setState(() {
      currentIndex =
          (currentIndex - 1 + AppData.cards.length) %
              AppData.cards.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cards = List.generate(
      AppData.cards.length,
          (i) => AppData.cards[
      (currentIndex + i) % AppData.cards.length],
    );

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity == null) return;

        if (details.primaryVelocity! < 0) {
          nextCard();
        } else {
          previousCard();
        }
      },

      child: SizedBox(
        height: 420,
        child: Stack(
          alignment: Alignment.center,
          children: [

            AnimatedCard(
              card: cards[3],
              scale: 0.78,
              angle: -0.05,
              translateX: 60,
              translateY: 48,
              opacity: 0.25,
            ),

            AnimatedCard(
              card: cards[2],
              scale: 0.86,
              angle: -0.035,
              translateX: 40,
              translateY: 30,
              opacity: 0.45,
            ),

            AnimatedCard(
              card: cards[1],
              scale: 0.93,
              angle: -0.018,
              translateX: 20,
              translateY: 15,
              opacity: 0.75,
            ),

            AnimatedCard(
              card: cards[0],
              scale: 1,
              angle: 0,
              translateX: 0,
              translateY: 0,
              opacity: 1,
            ),
          ],
        ),
      ),
    );
  }
}