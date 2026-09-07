import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/dummy_data.dart';
import '../../core/widgets/section_title.dart';
import '../../widgets/depth4d_card.dart';

class Depth4DScreen extends StatelessWidget {
  const Depth4DScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () =>
                          Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                      ),
                    ),
                  ),
                  const SectionTitle(
                    title: 'Depth 4D',
                    subtitle:
                    'Perspective, rotation and layered motion.',
                    accent: AppColors.pink,
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (_, index) => Depth4DCard(
                    item: DummyData.depth4d[index],
                  ),
                  childCount: DummyData.depth4d.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}