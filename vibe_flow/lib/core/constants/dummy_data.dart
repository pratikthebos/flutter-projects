import 'package:flutter/material.dart';

import '../../models/content_card_model.dart';
import 'app_assets.dart';
import 'app_colors.dart';

class DummyData {
  static const discover = [
    ContentCardModel(
      title: 'Future Is Now',
      subtitle: 'A new generation of digital experiences is arriving.',
      image: AppAssets.future,
      category: 'FUTURE',
      icon: Icons.auto_awesome,
      accent: AppColors.cyan,
    ),
    ContentCardModel(
      title: 'Beyond Reality',
      subtitle: 'Where imagination meets immersive technology.',
      image: AppAssets.space,
      category: 'IMMERSIVE',
      icon: Icons.blur_on,
      accent: AppColors.purple,
    ),
    ContentCardModel(
      title: 'Digital Energy',
      subtitle: 'Experience technology from a completely new perspective.',
      image: AppAssets.futuristic,
      category: 'DIGITAL',
      icon: Icons.bolt,
      accent: AppColors.pink,
    ),
    ContentCardModel(
      title: 'Neon Cities',
      subtitle: 'A cinematic journey through tomorrow.',
      image: AppAssets.city,
      category: 'CITIES',
      icon: Icons.location_city,
      accent: AppColors.blue,
    ),
  ];

  static const explore = [
    ContentCardModel(
      title: 'Into The Unknown',
      subtitle: 'Explore places beyond ordinary imagination.',
      image: AppAssets.mountain,
      category: 'ADVENTURE',
      icon: Icons.explore,
      accent: AppColors.cyan,
    ),
    ContentCardModel(
      title: 'Infinite Space',
      subtitle: 'The universe is bigger than we can imagine.',
      image: AppAssets.space,
      category: 'SPACE',
      icon: Icons.public,
      accent: AppColors.purple,
    ),
    ContentCardModel(
      title: 'Modern Geometry',
      subtitle: 'Architecture designed for the next generation.',
      image: AppAssets.architecture,
      category: 'DESIGN',
      icon: Icons.architecture,
      accent: AppColors.pink,
    ),
  ];

  static const ai = [
    ContentCardModel(
      title: 'Artificial Mind',
      subtitle: 'Machines are learning to understand the world.',
      image: AppAssets.ai,
      category: 'AI',
      icon: Icons.psychology,
      accent: AppColors.cyan,
    ),
    ContentCardModel(
      title: 'Human + Machine',
      subtitle: 'The collaboration changing how we work.',
      image: AppAssets.robot,
      category: 'ROBOTICS',
      icon: Icons.smart_toy,
      accent: AppColors.purple,
    ),
    ContentCardModel(
      title: 'Intelligent Future',
      subtitle: 'AI is becoming part of everything around us.',
      image: AppAssets.futuristic,
      category: 'FUTURE AI',
      icon: Icons.memory,
      accent: AppColors.pink,
    ),
  ];

  static const tech = [
    ContentCardModel(
      title: 'Inside The Machine',
      subtitle: 'The hardware powering the digital world.',
      image: AppAssets.technology,
      category: 'HARDWARE',
      icon: Icons.memory,
      accent: AppColors.cyan,
    ),
    ContentCardModel(
      title: 'Work Anywhere',
      subtitle: 'Powerful technology designed around your workflow.',
      image: AppAssets.laptop,
      category: 'PRODUCTIVITY',
      icon: Icons.laptop_mac,
      accent: AppColors.blue,
    ),
    ContentCardModel(
      title: 'Next Interface',
      subtitle: 'Interfaces are becoming more immersive and natural.',
      image: AppAssets.futuristic,
      category: 'UX / UI',
      icon: Icons.touch_app,
      accent: AppColors.purple,
    ),
  ];

  static const lifestyle = [
    ContentCardModel(
      title: 'Slow Mornings',
      subtitle: 'Build a life that gives you room to breathe.',
      image: AppAssets.coffee,
      category: 'DAILY',
      icon: Icons.coffee,
      accent: AppColors.orange,
    ),
    ContentCardModel(
      title: 'Creative Space',
      subtitle: 'Your environment shapes your imagination.',
      image: AppAssets.workspace,
      category: 'SPACE',
      icon: Icons.design_services,
      accent: AppColors.cyan,
    ),
    ContentCardModel(
      title: 'Move Freely',
      subtitle: 'Style, travel and experiences that inspire.',
      image: AppAssets.travel,
      category: 'TRAVEL',
      icon: Icons.flight_takeoff,
      accent: AppColors.pink,
    ),
    ContentCardModel(
      title: 'Ocean State',
      subtitle: 'Disconnect from noise and reconnect with yourself.',
      image: AppAssets.ocean,
      category: 'ESCAPE',
      icon: Icons.waves,
      accent: AppColors.blue,
    ),
  ];
}