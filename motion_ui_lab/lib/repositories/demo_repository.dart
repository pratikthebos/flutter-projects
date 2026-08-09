import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/demo_model.dart';

class DemoRepository {
  static List<DemoModel> getDemos() {
    return const [
      DemoModel(
        title: 'Liquid Glass',
        subtitle: 'Frosted glass interface',
        category: 'Glassmorphism',
        icon: Icons.blur_on_rounded,
        index: 0,
        color: AppColors.purple,
      ),

      DemoModel(
        title: 'Fluid Cards',
        subtitle: 'Interactive floating cards',
        category: 'Motion',
        icon: Icons.style_rounded,
        index: 1,
        color: AppColors.cyan,
      ),

      DemoModel(
        title: '3D Credit Card',
        subtitle: 'Tilt and rotate interaction',
        category: '3D UI',
        icon: Icons.credit_card_rounded,
        index: 2,
        color: AppColors.blue,
      ),

      DemoModel(
        title: 'Parallax Profile',
        subtitle: 'Depth-based profile UI',
        category: 'Parallax',
        icon: Icons.person_rounded,
        index: 3,
        color: AppColors.pink,
      ),

      DemoModel(
        title: 'Music Player',
        subtitle: 'Animated music interface',
        category: 'Media',
        icon: Icons.music_note_rounded,
        index: 4,
        color: AppColors.orange,
      ),

      DemoModel(
        title: 'Analytics',
        subtitle: 'Animated data visualization',
        category: 'Dashboard',
        icon: Icons.bar_chart_rounded,
        index: 5,
        color: AppColors.green,
      ),

      DemoModel(
        title: 'Security Scanner',
        subtitle: 'Futuristic scanning interface',
        category: 'Security',
        icon: Icons.radar_rounded,
        index: 6,
        color: AppColors.blue,
      ),

      DemoModel(
        title: 'Neon Controls',
        subtitle: 'Futuristic interactive controls',
        category: 'Neon UI',
        icon: Icons.tune_rounded,
        index: 7,
        color: AppColors.purple,
      ),
    ];
  }
}