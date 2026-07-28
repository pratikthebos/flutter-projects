import 'package:flutter/material.dart';

import '../models/dashboard_model.dart';
import '../models/visitor_model.dart';
import '../repositories/security_repository.dart';

class DashboardViewModel extends ChangeNotifier {

  final SecurityRepository repository = SecurityRepository();

  late List<DashboardModel> stats;

  late List<VisitorModel> visitors;

  DashboardViewModel() {
    loadData();
  }

  void loadData() {
    stats = repository.getDashboardStats();
    visitors = repository.getRecentVisitors();

    notifyListeners();
  }
}