import 'package:flutter/material.dart';
import 'package:liquid_glass_showcase/widgets/glass_morph_demo.dart';
import 'package:provider/provider.dart';
import '../../widgets/liquid_glass_demo.dart';
import '../../widgets/crystal_blur_demo.dart';
import '../../widgets/premium_scroll_demo.dart';

import '../../viewmodels/gallery_viewmodel.dart';

import '../../core/widgets/glass_background.dart';
import '../../core/widgets/floating_bubbles.dart';
import '../../core/widgets/glass_appbar.dart';

import '../../widgets/glass_card.dart';
import '../../widgets/glass_chip.dart';
import '../../widgets/liquid_loader.dart';
import '../../widgets/animated_reflection.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {

final PageController controller =
PageController(viewportFraction: 0.72);

double page = 0;

@override
void initState() {
super.initState();

controller.addListener(() {
setState(() {
page = controller.page ?? 0;
});
});
}

@override
Widget build(BuildContext context) {

final vm = context.watch<GalleryViewModel>();

return Scaffold(

body: Stack(

children: [

const GlassBackground(),

const FloatingBubbles(),

  SafeArea(
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [

const GlassAppBar(
title: "Liquid Gallery",
),

const SizedBox(height: 20),

//----------------------------------
// Horizontal Liquid Carousel
//----------------------------------

SizedBox(

height: 250,

child: PageView.builder(

controller: controller,

itemCount: vm.cards.length,

itemBuilder: (context, index) {

final double scale =
((1 - (page - index).abs() * 0.25)
.clamp(0.75, 1.0))
.toDouble();

return TweenAnimationBuilder<double>(

duration:
const Duration(milliseconds: 250),

tween: Tween<double>(
begin: scale,
end: scale,
),

builder: (context, value, child) {

return Transform.scale(

scale: value,

child: Padding(

padding:
const EdgeInsets.all(14),

child: AnimatedReflection(

child: GlassCard(

child: Column(

mainAxisAlignment:
MainAxisAlignment.center,

children: [

Icon(
vm.cards[index].icon,
size: 56,
color: Colors.white,
),

const SizedBox(height: 12),

Text(
vm.cards[index].title,
style: const TextStyle(
color: Colors.white,
fontSize: 26,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 8),

Text(
vm.cards[index].subtitle,
style: const TextStyle(
color: Colors.white70,
),
),

],

),

),

),

),

);

},

);

},

),

),

const SizedBox(height: 30),

//----------------------------------
// Glass Chips
//----------------------------------

const Wrap(

spacing: 12,

runSpacing: 12,

children: [

GlassChip(text: "Glass"),

GlassChip(text: "Liquid"),

GlassChip(text: "Apple"),

GlassChip(text: "Vision"),

GlassChip(text: "Flutter"),

GlassChip(text: "Premium"),

],

),

const SizedBox(height: 30),

  //----------------------------------------
  // Vertical Glass Cards
  //----------------------------------------

          //----------------------------------------
// Liquid Glass Demo
//----------------------------------------

          const LiquidGlassDemo(),

          const SizedBox(height: 40),

//----------------------------------------
// Crystal Blur Demo
//----------------------------------------

          const CrystalBlurDemo(),

          const SizedBox(height: 40),

//----------------------------------------
// Premium Scroll Demo
//----------------------------------------

          const PremiumScrollDemo(),

          const SizedBox(height: 40),

//----------------------------------------
// Glass Morph Demo
//----------------------------------------

          const GlassMorphDemo(),

          const SizedBox(height: 60),


        ],
      ),
    ),
  ),

],

),

  //----------------------------------------
  // Floating Loader
  //----------------------------------------

  // floatingActionButton: const LiquidLoader(),

);

}

@override
void dispose() {

  controller.dispose();

  super.dispose();

}

}