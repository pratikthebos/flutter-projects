import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'feature_model.dart';

class DemoData {
  DemoData._();

  static const List<FeatureModel> features = [

    FeatureModel(
      title: "AI Assistant",
      subtitle: "Smart Automation",
      value: "99%",
      icon: Icons.auto_awesome,
      gradient: AppColors.aurora,
    ),

    FeatureModel(
      title: "Galaxy",
      subtitle: "Space Explorer",
      value: "128",
      icon: Icons.public,
      gradient: AppColors.ocean,
    ),

    FeatureModel(
      title: "Cyber Security",
      subtitle: "Protected",
      value: "100%",
      icon: Icons.security,
      gradient: AppColors.forest,
    ),

    FeatureModel(
      title: "Robotics",
      subtitle: "AI Robots",
      value: "54",
      icon: Icons.smart_toy,
      gradient: AppColors.candy,
    ),

    FeatureModel(
      title: "Quantum",
      subtitle: "Computing",
      value: "8 Qbits",
      icon: Icons.memory,
      gradient: AppColors.royal,
    ),

    FeatureModel(
      title: "Cloud AI",
      subtitle: "Neural Network",
      value: "256 TB",
      icon: Icons.cloud,
      gradient: AppColors.sunset,
    ),
    FeatureModel(
      title: "Space Mission",
      subtitle: "Active Missions",
      value: "12",
      icon: Icons.rocket_launch,
      gradient: AppColors.aurora,
    ),

    FeatureModel(
      title: "Drone Control",
      subtitle: "Connected Drones",
      value: "24",
      icon: Icons.flight,
      gradient: AppColors.ocean,
    ),

    FeatureModel(
      title: "Blockchain",
      subtitle: "Secure Network",
      value: "1.2M",
      icon: Icons.currency_bitcoin,
      gradient: AppColors.forest,
    ),

    FeatureModel(
      title: "Hologram",
      subtitle: "3D Projection",
      value: "Ready",
      icon: Icons.view_in_ar,
      gradient: AppColors.candy,
    ),

    FeatureModel(
      title: "Neural Network",
      subtitle: "Processing",
      value: "96%",
      icon: Icons.hub,
      gradient: AppColors.royal,
    ),

    FeatureModel(
      title: "Satellite",
      subtitle: "Signal Strength",
      value: "99%",
      icon: Icons.satellite_alt,
      gradient: AppColors.sunset,
    ),
  ];
}