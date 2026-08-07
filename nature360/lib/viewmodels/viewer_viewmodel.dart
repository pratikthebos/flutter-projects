import 'package:flutter/material.dart';

import '../core/models/place_model.dart';

class ViewerViewModel extends ChangeNotifier {

  PlaceModel? selectedPlace;

  void selectPlace(PlaceModel place) {

    selectedPlace = place;

    notifyListeners();

  }

}