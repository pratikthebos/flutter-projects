import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/dummy_data.dart';
import '../../core/widgets/section_title.dart';
import '../../widgets/parallax_card.dart';

class ParallaxScreen extends StatelessWidget {
  const ParallaxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: _ParallaxHeader(),
            ),
            SliverPadding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (_, index) {
                    return ParallaxCard(
                      item: DummyData.parallax[index],
                      index: index,
                    );
                  },
                  childCount: DummyData.parallax.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ParallaxHeader extends StatelessWidget {
  const _ParallaxHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        const SectionTitle(
          title: 'Parallax',
          subtitle: 'Scroll through layers of depth.',
          accent: AppColors.blue,
        ),
      ],
    );
  }
}