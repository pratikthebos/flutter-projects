import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/dummy_data.dart';
import '../../core/widgets/section_title.dart';
import '../../models/demo_card_model.dart';
import '../../widgets/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const cards = [
    _DashboardItem(
      title: '3D Glass',
      subtitle: 'Premium glass and depth',
      route: AppRoutes.glass3d,
    ),
    _DashboardItem(
      title: 'Parallax',
      subtitle: 'Scroll depth effects',
      route: AppRoutes.parallax,
    ),
    _DashboardItem(
      title: 'Liquid',
      subtitle: 'Flowing gradient motion',
      route: AppRoutes.liquid,
    ),
    _DashboardItem(
      title: 'Neon',
      subtitle: 'Electric glowing UI',
      route: AppRoutes.neon,
    ),
    _DashboardItem(
      title: 'Holographic',
      subtitle: 'Future interface effects',
      route: AppRoutes.holographic,
    ),
    _DashboardItem(
      title: 'Depth 4D',
      subtitle: 'Perspective motion',
      route: AppRoutes.depth4d,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final data = [
      DummyData.glass3d.first,
      DummyData.parallax.first,
      DummyData.liquid.first,
      DummyData.neon.first,
      DummyData.holographic.first,
      DummyData.depth4d.first,
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 15),
            ),

            // --------------------------------------------------
            // HEADER
            // --------------------------------------------------

            const SliverToBoxAdapter(
              child: SectionTitle(
                title: 'CardVerse',
                subtitle: 'Six worlds. Infinite motion.',
                accent: AppColors.cyan,
              ),
            ),

            // --------------------------------------------------
            // SIX DEMO CARDS
            // --------------------------------------------------

            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final item = data[index];
                    final dashboard = cards[index];

                    final card = item.copyWith(
                      title: dashboard.title,
                      subtitle: dashboard.subtitle,
                    );

                    return TweenAnimationBuilder<double>(
                      duration: Duration(
                        milliseconds: 500 + (index * 100),
                      ),
                      tween: Tween<double>(
                        begin: 0.88,
                        end: 1.0,
                      ),
                      curve: Curves.easeOutBack,
                      builder: (
                          context,
                          scale,
                          child,
                          ) {
                        return Transform.scale(
                          scale: scale,
                          child: child,
                        );
                      },
                      child: DashboardCard(
                        item: card,
                        index: index,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            dashboard.route,
                          );
                        },
                      ),
                    );
                  },
                  childCount: cards.length,
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 25),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// DASHBOARD ITEM
// ------------------------------------------------------------

class _DashboardItem {
  final String title;
  final String subtitle;
  final String route;

  const _DashboardItem({
    required this.title,
    required this.subtitle,
    required this.route,
  });
}