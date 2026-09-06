import 'package:flutter/material.dart';

import '../../core/constants/dummy_data.dart';
import '../../core/animations/fade_slide.dart';
import '../../widgets/premium_card.dart';
import '../../widgets/category_card.dart';
import '../../widgets/section_header.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 12),
        ),
        const SliverToBoxAdapter(
          child: SectionHeader(
            title: 'Explore',
            subtitle: 'Explore the unexpected.',
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 110,
            child: ListView(
              padding:
              const EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryCard(
                  title: 'Adventure',
                  icon: Icons.explore,
                  color: Color(0xFF22D3EE),
                ),
                CategoryCard(
                  title: 'Space',
                  icon: Icons.public,
                  color: Color(0xFF8B5CF6),
                ),
                CategoryCard(
                  title: 'Design',
                  icon: Icons.architecture,
                  color: Color(0xFFEC4899),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 24),
        ),
        SliverPadding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, index) {
                return FadeSlide(
                  delay: Duration(
                    milliseconds: index * 100,
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.only(bottom: 18),
                    child: PremiumCard(
                      item: DummyData.explore[index],
                    ),
                  ),
                );
              },
              childCount: DummyData.explore.length,
            ),
          ),
        ),
      ],
    );
  }
}