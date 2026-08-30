import 'dart:async';

import 'package:flutter/foundation.dart';

class SplashViewModel extends ChangeNotifier {
  bool finished = false;

  void start() {
    Timer(
      const Duration(seconds: 3),
          () {
        finished = true;
        notifyListeners();
      },
    );
  }
}