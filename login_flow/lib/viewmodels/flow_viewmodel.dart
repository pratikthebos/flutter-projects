import 'package:flutter/material.dart';

import '../core/constants/api_steps.dart';

class FlowViewModel extends ChangeNotifier {

  int currentStep = 0;

  bool finished = false;

  Future<void> startFlow() async {

    currentStep = 0;
    finished = false;

    notifyListeners();

    for (int i = 0; i < ApiSteps.steps.length; i++) {

      currentStep = i + 1;

      notifyListeners();

      // Last step (Dashboard) - shorter delay
      if (i == ApiSteps.steps.length - 1) {

        await Future.delayed(
          const Duration(milliseconds: 800),
        );

      } else {

        // All other steps
        await Future.delayed(
          const Duration(seconds: 2),
        );

      }

    }

    finished = true;

    notifyListeners();

  }
}