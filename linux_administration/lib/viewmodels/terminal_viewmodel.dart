import 'dart:async';
import 'package:flutter/material.dart';

import '../models/module_model.dart';
import '../services/terminal_service.dart';

class TerminalViewModel extends ChangeNotifier {
  final TerminalService _service = TerminalService();

  String displayedText = "";

  bool loading = true;

  Future<void> run(ModuleModel module) async {
    displayedText = "";
    loading = true;
    notifyListeners();

    String output = await _service.execute(module);

    List<String> lines = output.split("\n");

    for (String line in lines) {
      await Future.delayed(const Duration(milliseconds: 180));

      displayedText += "$line\n";

      notifyListeners();
    }

    loading = false;

    notifyListeners();
  }
}