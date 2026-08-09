import 'package:flutter/material.dart';

class DemoViewModel extends ChangeNotifier {
  double rotationX = 0;
  double rotationY = 0;

  bool active = false;

  void setRotation(
      double x,
      double y,
      ) {
    rotationX = x;
    rotationY = y;

    notifyListeners();
  }

  void toggle() {
    active = !active;
    notifyListeners();
  }

  void reset() {
    rotationX = 0;
    rotationY = 0;

    notifyListeners();
  }
}