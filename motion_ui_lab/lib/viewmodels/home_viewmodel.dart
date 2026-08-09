import 'package:flutter/material.dart';

import '../models/demo_model.dart';
import '../repositories/demo_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final List<DemoModel> demos =
  DemoRepository.getDemos();

  DemoModel? selectedDemo;

  void selectDemo(DemoModel demo) {
    selectedDemo = demo;
    notifyListeners();
  }
}