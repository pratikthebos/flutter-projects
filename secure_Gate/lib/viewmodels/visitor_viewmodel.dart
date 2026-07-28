import 'package:flutter/material.dart';

class VisitorViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController flatController = TextEditingController();
  final TextEditingController vehicleController = TextEditingController();

  String purpose = "Guest";

  final List<String> purposes = [
    "Guest",
    "Family",
    "Delivery",
    "Courier",
    "Maintenance",
    "Meeting",
  ];

  void changePurpose(String value) {
    purpose = value;
    notifyListeners();
  }

  void clear() {
    nameController.clear();
    mobileController.clear();
    flatController.clear();
    vehicleController.clear();
    purpose = "Guest";
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    flatController.dispose();
    vehicleController.dispose();
    super.dispose();
  }
}