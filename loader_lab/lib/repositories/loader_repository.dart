import 'package:flutter/material.dart';

import '../models/loader_model.dart';

class LoaderRepository {
  static List<LoaderModel> getLoaders() {
    return const [
      //====================================================
      // 1. GRADIENT SPINNER
      //====================================================

      LoaderModel(
        title: "Gradient Spinner",
        description:
        "A colorful gradient spinner for visually rich loading experiences.",
        category: "Premium",
        icon: Icons.color_lens,
        index: 0,
      ),

      //====================================================
      // 2. DUAL RING
      //====================================================

      LoaderModel(
        title: "Dual Ring Loader",
        description:
        "Two rotating rings create a layered premium loading animation.",
        category: "Premium",
        icon: Icons.all_inclusive,
        index: 1,
      ),

      //====================================================
      // 3. ORBIT
      //====================================================

      LoaderModel(
        title: "Orbit Loader",
        description:
        "Particles orbit around a center point for an advanced animation.",
        category: "Advanced",
        icon: Icons.public,
        index: 2,
      ),

      //====================================================
      // 4. NEON SCANNER
      //====================================================

      LoaderModel(
        title: "Neon Scanner",
        description:
        "A futuristic glowing scanning line creates a modern loading experience.",
        category: "Futuristic",
        icon: Icons.document_scanner,
        index: 3,
      ),

      //====================================================
      // 5. HEARTBEAT
      //====================================================

      LoaderModel(
        title: "Heartbeat Loader",
        description:
        "A rhythmic pulse animation inspired by a heartbeat monitor.",
        category: "Pulse",
        icon: Icons.favorite,
        index: 4,
      ),

      //====================================================
      // 6. PULSE
      //====================================================

      LoaderModel(
        title: "Pulse Loader",
        description:
        "A smooth expanding and fading pulse animation for modern interfaces.",
        category: "Animated",
        icon: Icons.radio_button_checked,
        index: 5,
      ),

      //====================================================
      // 7. CIRCULAR DOTS
      //====================================================

      LoaderModel(
        title: "Circular Dots",
        description:
        "Animated dots rotate around a circular path with changing opacity.",
        category: "Circular",
        icon: Icons.blur_circular,
        index: 6,
      ),

      //====================================================
      // 8. WAVE
      //====================================================

      LoaderModel(
        title: "Wave Loader",
        description:
        "Animated vertical bars create a smooth dynamic wave effect.",
        category: "Creative",
        icon: Icons.graphic_eq,
        index: 7,
      ),

      //====================================================
      // 9. ROTATING SQUARES
      //====================================================

      LoaderModel(
        title: "Rotating Squares",
        description:
        "Four colorful squares rotate together to create a geometric loading effect.",
        category: "Geometric",
        icon: Icons.grid_4x4_rounded,
        index: 8,
      ),

      //====================================================
      // 10. BOUNCING BALL
      //====================================================

      LoaderModel(
        title: "Bouncing Ball",
        description:
        "A smooth bouncing ball animation for playful loading experiences.",
        category: "Physics",
        icon: Icons.sports_basketball,
        index: 9,
      ),

      //====================================================
      // 11. ROTATING RING
      //====================================================

      LoaderModel(
        title: "Rotating Ring",
        description:
        "A smooth rotating ring for clean and modern loading states.",
        category: "Modern",
        icon: Icons.sync,
        index: 10,
      ),

      //====================================================
      // 12. SHIMMER
      //====================================================

      LoaderModel(
        title: "Shimmer Loader",
        description:
        "A skeleton shimmer effect commonly used while content is loading.",
        category: "Skeleton",
        icon: Icons.auto_awesome,
        index: 11,
      ),

      //====================================================
      // 13. THREE DOT
      //====================================================

      LoaderModel(
        title: "Three Dot Loader",
        description:
        "Minimal bouncing dots for simple and lightweight loading feedback.",
        category: "Minimal",
        icon: Icons.more_horiz,
        index: 12,
      ),

      //====================================================
      // 14. LINEAR
      //====================================================

      LoaderModel(
        title: "Linear Loader",
        description:
        "A horizontal progress animation for page and content loading.",
        category: "Progress",
        icon: Icons.linear_scale,
        index: 13,
      ),

      //====================================================
      // 15. CIRCULAR
      //====================================================

      LoaderModel(
        title: "Circular Loader",
        description:
        "The classic circular progress indicator for general loading states.",
        category: "Basic",
        icon: Icons.refresh,
        index: 14,
      ),
    ];
  }
}