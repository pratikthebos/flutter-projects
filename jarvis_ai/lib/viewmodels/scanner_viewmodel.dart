import 'package:flutter/material.dart';

class ScannerViewModel extends ChangeNotifier {
  bool scanning = false;

  String selectedModule = "Arc Reactor";

  double progress = 0;

  String aiStatus = "JARVIS ONLINE";

  Future<void> selectModule(String module) async {
    // Ignore taps while a scan is already running
    if (scanning) return;

    selectedModule = module;

    notifyListeners();

    await startScan();
  }

  Future<void> startScan() async {
    scanning = true;
    progress = 0;
    aiStatus = "Scanning $selectedModule...";

    notifyListeners();

    for (int i = 0; i <= 100; i++) {
      await Future.delayed(
        const Duration(milliseconds: 20),
      );

      progress = i / 100;

      notifyListeners();
    }

    scanning = false;
    aiStatus = "$selectedModule Ready";

    notifyListeners();
  }
}