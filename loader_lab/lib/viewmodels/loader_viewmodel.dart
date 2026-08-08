import 'package:flutter/material.dart';

import '../models/loader_model.dart';
import '../repositories/loader_repository.dart';

class LoaderViewModel extends ChangeNotifier {
  final List<LoaderModel> loaders =
  LoaderRepository.getLoaders();

  int selectedIndex = -1;

  void selectLoader(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}