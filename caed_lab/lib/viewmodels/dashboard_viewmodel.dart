import 'package:flutter/material.dart';

class DashboardViewModel extends ChangeNotifier {
  int selectedCard = -1;

  void selectCard(int index) {
    selectedCard = index;
    notifyListeners();
  }

  void clearSelection() {
    selectedCard = -1;
    notifyListeners();
  }
}