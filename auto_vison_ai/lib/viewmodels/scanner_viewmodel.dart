import 'package:flutter/material.dart';

class ScannerViewModel extends ChangeNotifier {

  String selectedPart = "Engine";

  bool scanning = false;

  Future<void> scan(String part) async {

    selectedPart = part;

    scanning = true;

    notifyListeners();

    await Future.delayed(

      const Duration(seconds: 2),

    );

    scanning = false;

    notifyListeners();

  }

}