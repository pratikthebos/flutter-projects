import 'package:abc_kids_learn/features/letter/viewmodel/%20letter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../alphabet/model/alphabet_model.dart';
import '../widgets/big_letter.dart';

class LetterScreen extends StatelessWidget {
  final AlphabetModel model;

  const LetterScreen({
    super.key,
    required this.model,
  });

  static const List<List<Color>> gradients = [
    [Color(0xFFFF5F6D), Color(0xFFFFC371)],
    [Color(0xFF36D1DC), Color(0xFF5B86E5)],
    [Color(0xFF56AB2F), Color(0xFFA8E063)],
    [Color(0xFFFF6FD8), Color(0xFF3813C2)],
    [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
    [Color(0xFFFF9966), Color(0xFFFF5E62)],
    [Color(0xFF00C9FF), Color(0xFF92FE9D)],
    [Color(0xFFF9D423), Color(0xFFFF4E50)],
    [Color(0xFF12C2E9), Color(0xFFC471ED)],
    [Color(0xFF11998E), Color(0xFF38EF7D)],
    [Color(0xFF396AFD), Color(0xFF2948FF)],
    [Color(0xFFFF9A9E), Color(0xFFFECFEF)],
    [Color(0xFFFC466B), Color(0xFF3F5EFB)],
    [Color(0xFF00B09B), Color(0xFF96C93D)],
    [Color(0xFF7F00FF), Color(0xFFE100FF)],
    [Color(0xFFFF512F), Color(0xFFF09819)],
    [Color(0xFF2193B0), Color(0xFF6DD5ED)],
    [Color(0xFFD4145A), Color(0xFFFBB03B)],
    [Color(0xFFDA22FF), Color(0xFF9733EE)],
    [Color(0xFF00C853), Color(0xFFB2FF59)],
    [Color(0xFFFFB75E), Color(0xFFED8F03)],
    [Color(0xFF7F7FD5), Color(0xFF86A8E7)],
    [Color(0xFFFF4E50), Color(0xFFF9D423)],
    [Color(0xFF00F260), Color(0xFF0575E6)],
    [Color(0xFFFC6076), Color(0xFFFF9A44)],
    [Color(0xFF654EA3), Color(0xFFEAAFc8)],
  ];

  @override
  Widget build(BuildContext context) {
    final index = model.letter.codeUnitAt(0) - 65;
    final gradient = gradients[index % gradients.length];

    return ChangeNotifierProvider(
      create: (_) => LetterViewModel(),
      child: Consumer<LetterViewModel>(
        builder: (_, vm, __) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            vm.speak(
              model.letter,
              model.word,
            );
          });

          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          vm.stop();
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: gradient[0],
                          size: 28,
                        ),
                      ),
                    ),

                    const Spacer(),

                    BigLetter(
                      letter: model.letter,
                      color1: gradient[0],
                      color2: gradient[1],
                    ),

                    const SizedBox(height: 35),

                    Text(
                      "${model.letter} for ${model.word}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: gradient[0],
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: .3),

                    const SizedBox(height: 50),

                    SizedBox(
                      width: 220,
                      height: 60,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          vm.speak(
                            model.letter,
                            model.word,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: gradient[0],
                          foregroundColor: Colors.white,
                          elevation: 10,
                          shadowColor: gradient[0].withOpacity(.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                        icon: const Icon(Icons.volume_up_rounded),
                        label: const Text(
                          "Play Again",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                        .animate()
                        .scale(duration: 500.ms)
                        .fadeIn(),

                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}