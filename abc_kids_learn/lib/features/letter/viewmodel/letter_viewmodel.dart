import 'package:flutter/material.dart';

import '../../../services/tts_service.dart';

class LetterViewModel extends ChangeNotifier {
  final TtsService _tts = TtsService();

  Future<void> speak(
      String letter,
      String word,
      ) async {
    await _tts.speak("$letter for $word");
  }

  Future<void> stop() async {
    await _tts.stop();
  }
}