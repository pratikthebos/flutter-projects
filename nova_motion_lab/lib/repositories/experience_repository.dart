import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/experience_model.dart';

class ExperienceRepository {
  static List<ExperienceModel> getExperiences() {
    return const [
      ExperienceModel(
        title: 'ANIMATION UI',
        subtitle: 'MOTION',
        description:
        'Morphing shapes and cinematic motion.',
        icon: Icons.animation_rounded,
        color: AppColors.purple,
        index: 0,
      ),

      ExperienceModel(
        title: 'NOVA COLOR',
        subtitle: 'COLOR LAB',
        description:
        'Interactive colors that respond to touch.',
        icon: Icons.palette_rounded,
        color: AppColors.pink,
        index: 1,
      ),

      ExperienceModel(
        title: 'FUTURE INTERACTION',
        subtitle: 'INTERACTION',
        description:
        'Magnetic controls and responsive interfaces.',
        icon: Icons.touch_app_rounded,
        color: AppColors.cyan,
        index: 2,
      ),

      ExperienceModel(
        title: 'NOVA SPACE',
        subtitle: 'EXPLORATION',
        description:
        'Explore a futuristic planetary interface.',
        icon: Icons.public_rounded,
        color: AppColors.blue,
        index: 3,
      ),

      ExperienceModel(
        title: 'NOVA WAVE',
        subtitle: 'AUDIO',
        description:
        'Dynamic waves inspired by sound.',
        icon: Icons.graphic_eq_rounded,
        color: AppColors.emerald,
        index: 4,
      ),

      ExperienceModel(
        title: 'ANIMATION SCROLL',
        subtitle: 'SCROLL',
        description:
        'Scroll-driven cinematic transitions.',
        icon: Icons.view_carousel_rounded,
        color: AppColors.amber,
        index: 5,
      ),
    ];
  }
}