import 'package:flutter/material.dart';

import '../models/history_model.dart';
import '../repositories/security_repository.dart';

class HistoryViewModel extends ChangeNotifier {
  final SecurityRepository repository = SecurityRepository();

  late List<HistoryModel> history;

  String selectedFilter = "All";

  final List<String> filters = [
    "All",
    "Visitor",
    "Staff",
    "Cab",
    "Delivery",
  ];

  HistoryViewModel() {
    loadHistory();
  }

  void loadHistory() {
    history = repository.getHistory();
    notifyListeners();
  }

  void changeFilter(String value) {
    selectedFilter = value;
    notifyListeners();
  }
}