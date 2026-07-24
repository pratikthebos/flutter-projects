import '../models/booking_model.dart';
import '../models/trainer_model.dart';
import '../models/user_model.dart';
import '../models/workout_model.dart';
import '../services/dummy_data_service.dart';

class HomeRepository {
  final DummyDataService _service = DummyDataService();

  UserModel getUser() {
    return _service.getUser();
  }

  TrainerModel getTrainer() {
    return _service.getTrainer();
  }

  BookingModel getBooking() {
    return _service.getBooking();
  }

  List<WorkoutModel> getWorkoutPlan() {
    return _service.getWorkoutPlan();
  }
}