import 'package:flutter/material.dart';

import '../models/glass_card_model.dart';
import '../repositories/glass_repository.dart';

class GalleryViewModel extends ChangeNotifier {

  List<GlassCardModel> get cards =>
      GlassRepository.cards;

  double scrollValue = 0;

  void updateScroll(double value) {

    scrollValue = value;

    notifyListeners();

  }

}