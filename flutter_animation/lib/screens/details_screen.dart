import 'dart:math';

import 'package:flutter/material.dart';

import '../models/feature_model.dart';
import '../widgets/animated_background.dart';
import '../widgets/animated_button.dart';
import '../widgets/glass_card.dart';

class DetailsScreen extends StatefulWidget {
  final FeatureModel feature;

  const DetailsScreen({
    super.key,
    required this.feature,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget statCard(String title, String value) {
    return Expanded(
      child: GlassCard(
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [

                Row(
                  children: [

                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),

                    const Spacer(),

                    const Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),
                  ],
                ),

                const SizedBox(height: 30),

                Hero(
                  tag: widget.feature.title,
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: widget.feature.gradient,
                      ),
                    ),
                    child: Icon(
                      widget.feature.icon,
                      size: 65,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Text(
                  widget.feature.title,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 40),

                AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) {
                    return SizedBox(
                      width: 210,
                      height: 210,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [

                          SizedBox(
                            width: 210,
                            height: 210,
                            child: CircularProgressIndicator(
                              value: .92 * _controller.value,
                              strokeWidth: 12,
                              backgroundColor: Colors.white12,
                              valueColor:
                              AlwaysStoppedAnimation(
                                widget.feature.gradient.first,
                              ),
                            ),
                          ),

                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [

                              Text(
                                "${(_controller.value * 92).toInt()}%",
                                style: const TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 8),

                              const Text(
                                "Performance",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 35),

                GlassCard(
                  child: Column(
                    children: [

                      Row(
                        children: [

                          const Icon(
                            Icons.auto_graph,
                            color: Colors.white,
                          ),

                          const SizedBox(width: 10),

                          const Text(
                            "Overview",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        "This premium Flutter animation screen demonstrates Hero animations, animated progress indicators, reusable glass components, and smooth transitions while maintaining excellent performance.",
                        style: TextStyle(
                          height: 1.6,
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  children: [

                    statCard(
                      "Downloads",
                      "12K",
                    ),

                    const SizedBox(width: 16),

                    statCard(
                      "Rating",
                      "4.9",
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Row(
                  children: [

                    statCard(
                      "Reviews",
                      "8.6K",
                    ),

                    const SizedBox(width: 16),

                    statCard(
                      "Active",
                      "99%",
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                AnimatedButton(
                  text: "Get Started",
                  icon: Icons.arrow_forward,
                  onPressed: () {},
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}