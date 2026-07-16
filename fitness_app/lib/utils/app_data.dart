import 'package:flutter/material.dart';

import '../models/activity_model.dart';
import 'app_colors.dart';

class AppData {
  static const List<ActivityModel> todayActivities = [

    ActivityModel(
      title: "Running",
      subtitle: "Morning Running",
      value: "2500",
      unit: "Steps",
      time: "08:00 AM",
      icon: Icons.directions_run_rounded,
      gradient: AppColors.runningGradient,
      iconBackground: Color(0xFFFFD86B),
      progress: .70,
    ),

    ActivityModel(
      title: "Cycling",
      subtitle: "15 km Ride",
      value: "15",
      unit: "KM",
      time: "10:00 AM",
      icon: Icons.pedal_bike_rounded,
      gradient: AppColors.cyclingGradient,
      iconBackground: Color(0xFF6EE7F2),
      progress: .55,
    ),

    ActivityModel(
      title: "Breakfast",
      subtitle: "Eggs, Milk & Fruits",
      value: "450",
      unit: "Kcal",
      time: "08:30 AM",
      icon: Icons.free_breakfast_rounded,
      gradient: const [
        Color(0xFFFFA726),
        Color(0xFFFFCC80),
      ],

      iconBackground: const Color(0xFFFFE0B2),
      progress: .45,
    ),

    ActivityModel(
      title: "Lunch",
      subtitle: "Rice, Dal & Salad",
      value: "620",
      unit: "Kcal",
      time: "01:00 PM",
      icon: Icons.lunch_dining_rounded,
      gradient: AppColors.mealGradient,
      iconBackground: Color(0xFFFFC8DF),
      progress: .72,
    ),

    ActivityModel(
      title: "Dinner",
      subtitle: "Soup & Chicken",
      value: "520",
      unit: "Kcal",
      time: "08:00 PM",
      icon: Icons.restaurant_rounded,
      gradient: AppColors.dinnerGradient,
      iconBackground: Color(0xFFB7F5D1),
      progress: .60,
    ),
  ];

  // Dashboard Statistics

  static const int totalSteps = 8560;

  static const int calories = 1840;

  static const int water = 2200;

  static const int activeMinutes = 98;

  // Weekly Chart

  static const List<double> weeklyProgress = [
    3,
    6,
    4,
    8,
    7,
    5,
    9,
  ];

  // Circular Chart

  static const double running = .42;

  static const double cycling = .33;

  static const double swimming = .25;
}