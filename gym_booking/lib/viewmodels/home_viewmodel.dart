import 'package:flutter/material.dart';

import '../models/booking_model.dart';
import '../models/trainer_model.dart';
import '../models/user_model.dart';
import '../models/workout_model.dart';
import '../repositories/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _repository = HomeRepository();

  late UserModel user;
  late TrainerModel trainer;
  late BookingModel booking;

  List<WorkoutModel> workouts = [];

  HomeViewModel() {
    loadData();
  }

  void loadData() {
    user = _repository.getUser();
    trainer = _repository.getTrainer();
    booking = _repository.getBooking();
    workouts = _repository.getWorkoutPlan();

    notifyListeners();
  }
}