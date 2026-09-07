import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/dummy_data.dart';
import '../../core/widgets/section_title.dart';
import '../../widgets/neon_card.dart';

class NeonScreen extends StatelessWidget {
  const NeonScreen({super.key});

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
                    title: 'Neon',
                    subtitle:
                    'Electric energy in every interaction.',
                    accent: AppColors.cyan,
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (_, index) => NeonCard(
                    item: DummyData.neon[index],
                  ),
                  childCount: DummyData.neon.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}