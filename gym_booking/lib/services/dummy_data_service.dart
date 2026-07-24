import '../models/booking_model.dart';
import '../models/trainer_model.dart';
import '../models/user_model.dart';
import '../models/workout_model.dart';

class DummyDataService {
  UserModel getUser() {
    return const UserModel(
      name: "Tarkesh Gurav",
      membership: "Premium Gold",
      calories: 925,
      workoutMinutes: 74,
      bmi: 22.4,
      avatar: "",
    );
  }

  TrainerModel getTrainer() {
    return const TrainerModel(
      name: "John Carter",
      speciality: "Strength Coach",
      rating: 4.9,
      available: true,
      image: "",
    );
  }

  BookingModel getBooking() {
    return const BookingModel(
      date: "Today",
      time: "7:00 PM",
      gymArea: "Strength Zone",
      trainer: "John Carter",
      booked: true,
    );
  }

  List<WorkoutModel> getWorkoutPlan() {
    return const [

      WorkoutModel(
        exercise: "Bench Press",
        sets: 4,
        reps: 12,
        completed: true,
      ),

      WorkoutModel(
        exercise: "Incline Dumbbell Press",
        sets: 4,
        reps: 10,
        completed: true,
      ),

      WorkoutModel(
        exercise: "Cable Fly",
        sets: 3,
        reps: 15,
        completed: false,
      ),

      WorkoutModel(
        exercise: "Push Ups",
        sets: 3,
        reps: 20,
        completed: false,
      ),
    ];
  }
}