import 'package:flutter/material.dart';

import '../models/glass_card_model.dart';

class GlassRepository {
  static List<GlassCardModel> cards = [

    const GlassCardModel(
      title: "Liquid Glass",
      subtitle: "Flutter Vision UI",
      icon: Icons.auto_awesome,
      gradient: [
        Color(0xff56CCF2),
        Color(0xff2F80ED),
      ],
    ),

    const GlassCardModel(
      title: "Crystal Blur",
      subtitle: "Dynamic Frost",
      icon: Icons.blur_on,
      gradient: [
        Color(0xffA18CD1),
        Color(0xffFBC2EB),
      ],
    ),

    const GlassCardModel(
      title: "Premium Scroll",
      subtitle: "Elastic Motion",
      icon: Icons.swipe,
      gradient: [
        Color(0xff43CEA2),
        Color(0xff185A9D),
      ],
    ),

    const GlassCardModel(
      title: "Glass Morph",
      subtitle: "Shape Animation",
      icon: Icons.animation,
      gradient: [
        Color(0xffFC5C7D),
        Color(0xff6A82FB),
      ],
    ),

    const GlassCardModel(
      title: "Reflection",
      subtitle: "Liquid Shine",
      icon: Icons.light_mode,
      gradient: [
        Color(0xff00DBDE),
        Color(0xffFC00FF),
      ],
    ),

  ];
}