import 'package:flutter/material.dart';

import '../models/seat_model.dart';

class BookingViewModel extends ChangeNotifier {

  List<SeatModel> seats = [];

  BookingViewModel() {
    generateSeats();
  }

  void generateSeats() {

    seats = List.generate(
      64,
          (index) => SeatModel(
        booked: index % 7 == 0,
      ),
    );
  }

  void selectSeat(int index) {

    if (seats[index].booked) return;

    seats[index].selected = !seats[index].selected;

    notifyListeners();
  }

  List<SeatModel> get selectedSeats =>
      seats.where((e) => e.selected).toList();

  int get totalPrice => selectedSeats.length * 350;
}