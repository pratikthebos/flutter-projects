import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/dummy_data.dart';
import '../../core/widgets/section_title.dart';
import '../../widgets/glass3d_card.dart';

class Glass3DScreen extends StatelessWidget {
  const Glass3DScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: _Header(
                title: '3D Glass',
                subtitle: 'Drag cards to explore depth.',
                color: AppColors.cyan,
              ),
            ),
            SliverPadding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (_, index) {
                    return Glass3DCard(
                      item: DummyData.glass3d[index],
                      index: index,
                    );
                  },
                  childCount: DummyData.glass3d.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const _Header({
    required this.title,
    required this.subtitle,
    required this.color,
  });

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
        SectionTitle(
          title: title,
          subtitle: subtitle,
          accent: color,
        ),
      ],
    );
  }
}