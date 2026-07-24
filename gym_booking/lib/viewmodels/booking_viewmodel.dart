import 'package:flutter/material.dart';

class BookingViewModel extends ChangeNotifier {
  String selectedDate = "Today";
  String selectedTime = "7:00 PM";
  String selectedTrainer = "John Carter";

  void selectTime(String time) {
    selectedTime = time;
    notifyListeners();
  }

  void selectTrainer(String trainer) {
    selectedTrainer = trainer;
    notifyListeners();
  }

  void confirmBooking() {
    notifyListeners();
  }
}