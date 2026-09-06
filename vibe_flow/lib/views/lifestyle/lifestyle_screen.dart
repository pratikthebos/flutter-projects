import 'package:flutter/material.dart';

import '../../core/constants/dummy_data.dart';
import '../../core/animations/fade_slide.dart';
import '../../widgets/lifestyle_card.dart';
import '../../widgets/section_header.dart';

class LifestyleScreen extends StatelessWidget {
  const LifestyleScreen({super.key});

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
            title: 'Lifestyle',
            subtitle: 'Design your everyday.',
          ),
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
                  child: LifestyleCard(
                    item: DummyData.lifestyle[index],
                  ),
                );
              },
              childCount: DummyData.lifestyle.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
      ],
    );
  }
}