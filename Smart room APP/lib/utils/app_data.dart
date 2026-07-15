import 'package:flutter/material.dart';

import '../models/card_model.dart';
import 'app_colors.dart';

class AppData {
  static final List<SmartCardModel> cards = [

    SmartCardModel(
      title: "Electricity",
      value: "2.8",
      unit: "kWh",
      subtitle: "Today's electricity usage",
      icon: Icons.bolt_rounded,
      gradient: AppColors.purpleGradient,
      glowColor: AppColors.purpleGlow,
      iconColor: AppColors.purpleIcon,
      progress: .82,
    ),

    SmartCardModel(
      title: "Temperature",
      value: "24",
      unit: "°C",
      subtitle: "Living Room",
      icon: Icons.thermostat_rounded,
      gradient: AppColors.blueGradient,
      glowColor: AppColors.blueGlow,
      iconColor: AppColors.blueIcon,
      progress: .68,
    ),

    SmartCardModel(
      title: "Humidity",
      value: "68",
      unit: "%",
      subtitle: "Indoor Humidity",
      icon: Icons.water_drop_rounded,
      gradient: AppColors.cyanGradient,
      glowColor: AppColors.cyanGlow,
      iconColor: AppColors.cyanIcon,
      progress: .74,
    ),

    SmartCardModel(
      title: "Air Quality",
      value: "96",
      unit: "%",
      subtitle: "Excellent",
      icon: Icons.air_rounded,
      gradient: AppColors.greenGradient,
      glowColor: AppColors.greenGlow,
      iconColor: AppColors.greenIcon,
      progress: .94,
    ),

    SmartCardModel(
      title: "Lighting",
      value: "12",
      unit: "ON",
      subtitle: "Smart Lights",
      icon: Icons.lightbulb_rounded,
      gradient: AppColors.orangeGradient,
      glowColor: AppColors.orangeGlow,
      iconColor: AppColors.orangeIcon,
      progress: .58,
    ),

    SmartCardModel(
      title: "Security",
      value: "100",
      unit: "%",
      subtitle: "Home Protected",
      icon: Icons.security_rounded,
      gradient: AppColors.pinkGradient,
      glowColor: AppColors.pinkGlow,
      iconColor: AppColors.pinkIcon,
      progress: 1.0,
    ),

  ];
}