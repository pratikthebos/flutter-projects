import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int selectedIndex = 0;

  bool showSearch = false;

  final List<String> tabNames = const [
    'Discover',
    'Explore',
    'AI',
    'Tech',
    'Lifestyle',
    'Profile',
  ];

  void changeTab(int index) {
    if (selectedIndex == index) return;

    selectedIndex = index;
    notifyListeners();
  }

  void toggleSearch() {
    showSearch = !showSearch;
    notifyListeners();
  }
}