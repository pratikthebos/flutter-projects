import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/alphabet_viewmodel.dart';
import '../widgets/alphabet_card.dart';
import '../../letter/view/letter_screen.dart';

class AlphabetScreen extends StatelessWidget {
  const AlphabetScreen({super.key});

  static const List<List<Color>> colors = [
    // Candy Red
    [Color(0xFFFF5F6D), Color(0xFFFFC371)],

    // Sky Blue
    [Color(0xFF36D1DC), Color(0xFF5B86E5)],

    // Lime Green
    [Color(0xFF56AB2F), Color(0xFFA8E063)],

    // Pink
    [Color(0xFFFF6FD8), Color(0xFF3813C2)],

    // Purple
    [Color(0xFF8E2DE2), Color(0xFF4A00E0)],

    // Orange
    [Color(0xFFFF9966), Color(0xFFFF5E62)],

    // Aqua
    [Color(0xFF00C9FF), Color(0xFF92FE9D)],

    // Yellow
    [Color(0xFFF9D423), Color(0xFFFF4E50)],

    // Cyan
    [Color(0xFF12C2E9), Color(0xFFC471ED)],

    // Mint
    [Color(0xFF11998E), Color(0xFF38EF7D)],

    // Blue
    [Color(0xFF396AFD), Color(0xFF2948FF)],

    // Peach
    [Color(0xFFFF9A9E), Color(0xFFFECFEF)],

    // Rainbow
    [Color(0xFFFC466B), Color(0xFF3F5EFB)],

    // Emerald
    [Color(0xFF00B09B), Color(0xFF96C93D)],

    // Violet
    [Color(0xFF7F00FF), Color(0xFFE100FF)],

    // Sunset
    [Color(0xFFFF512F), Color(0xFFF09819)],

    // Ocean
    [Color(0xFF2193B0), Color(0xFF6DD5ED)],

    // Berry
    [Color(0xFFD4145A), Color(0xFFFBB03B)],

    // Lavender
    [Color(0xFFDA22FF), Color(0xFF9733EE)],

    // Green Apple
    [Color(0xFF00C853), Color(0xFFB2FF59)],
  ];

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AlphabetViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("ABC Kids Learn"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: vm.alphabets.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
          childAspectRatio: .95,
        ),
        itemBuilder: (_, index) {
          final item = vm.alphabets[index];
          final gradient = colors[index % colors.length];

          return AlphabetCard(
            letter: item.letter,
            color1: gradient[0],
            color2: gradient[1],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LetterScreen(
                    model: item,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}