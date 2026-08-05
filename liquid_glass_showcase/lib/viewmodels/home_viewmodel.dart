import 'package:flutter/material.dart';

import '../models/glass_card_model.dart';
import '../repositories/glass_repository.dart';

class HomeViewModel extends ChangeNotifier {

  List<GlassCardModel> get cards =>
      GlassRepository.cards;

  int selectedIndex = 0;

  void changeCard(int index) {

    selectedIndex = index;

    notifyListeners();

  }

}