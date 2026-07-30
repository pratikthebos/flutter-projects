import 'package:flutter/material.dart';

import '../models/module_model.dart';
import '../repositories/linux_repository.dart';

class DashboardViewModel extends ChangeNotifier {
  final LinuxRepository _repository = LinuxRepository();

  List<ModuleModel> modules = [];

  DashboardViewModel() {
    loadModules();
  }

  void loadModules() {
    modules = _repository.getModules();
    notifyListeners();
  }
}