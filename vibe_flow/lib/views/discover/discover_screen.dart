import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/dummy_data.dart';
import '../../core/animations/fade_slide.dart';
import '../../widgets/animated_card.dart';
import '../../widgets/section_header.dart';
import '../../widgets/trending_card.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() =>
      _DiscoverScreenState();
}

class _DiscoverScreenState
    extends State<DiscoverScreen> {
  final ScrollController controller =
  ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 12),
        ),
        const SliverToBoxAdapter(
          child: SectionHeader(
            title: 'Discover',
            subtitle: 'Ideas that move you.',
          ),
        ),
        SliverToBoxAdapter(
          child: FadeSlide(
            child: SizedBox(
              height: 130,
              child: ListView(
                padding:
                const EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: const [
                  TrendingCard(
                    title: 'People exploring AI',
                    number: '92%',
                    color: AppColors.cyan,
                  ),
                  TrendingCard(
                    title: 'Future concepts',
                    number: '48K',
                    color: AppColors.purple,
                  ),
                  TrendingCard(
                    title: 'New ideas today',
                    number: '2.4K',
                    color: AppColors.pink,
                  ),
                ],
              ),
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
                return AnimatedCard(
                  item: DummyData.discover[index],
                  index: index,
                );
              },
              childCount: DummyData.discover.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}