import 'package:flutter/material.dart';

import '../core/models/place_model.dart';
import '../repositories/place_repository.dart';

class HomeViewModel extends ChangeNotifier {

  final List<PlaceModel> places =
  PlaceRepository.getPlaces();

}