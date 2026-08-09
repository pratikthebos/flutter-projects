import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  bool loading = true;

  void complete() {
    loading = false;
    notifyListeners();
  }
}