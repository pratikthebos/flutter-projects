import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/dummy_data.dart';
import '../../core/animations/fade_slide.dart';
import '../../core/widgets/animated_gradient.dart';
import '../../widgets/ai_card.dart';
import '../../widgets/section_header.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 12),
        ),

        // Header
        const SliverToBoxAdapter(
          child: SectionHeader(
            title: 'AI',
            subtitle: 'The future is intelligent.',
          ),
        ),

        // AI Hero
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FadeSlide(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: AnimatedGradient(
                  child: Container(
                    height: 160,
                    padding: const EdgeInsets.all(22),
                    child: Stack(
                      children: [
                        const Positioned(
                          right: -20,
                          top: -30,
                          child: Icon(
                            Icons.psychology,
                            size: 150,
                            color: Colors.white12,
                          ),
                        ),

                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'AI CORE ONLINE',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Intelligence,\nreimagined.',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w900,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: 24),
        ),

        // AI Cards
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return FadeSlide(
                  delay: Duration(
                    milliseconds: index * 100,
                  ),
                  child: AiCard(
                    item: DummyData.ai[index],
                  ),
                );
              },
              childCount: DummyData.ai.length,
            ),
          ),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: 30),
        ),
      ],
    );
  }
}