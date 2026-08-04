import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {

  bool initialized = false;

  Future<void> initialize() async {

    await Future.delayed(
      const Duration(seconds: 4),
    );

    initialized = true;

    notifyListeners();
  }
}