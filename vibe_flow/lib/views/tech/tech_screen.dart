import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/dummy_data.dart';
import '../../core/animations/fade_slide.dart';
import '../../widgets/tech_card.dart';
import '../../widgets/section_header.dart';

class TechScreen extends StatelessWidget {
  const TechScreen({super.key});

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
            title: 'Tech',
            subtitle: 'Technology without limits.',
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius:
                BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.cyan
                      .withOpacity(.18),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                      AppColors.cyan.withOpacity(.12),
                    ),
                    child: const Icon(
                      Icons.memory,
                      color: AppColors.cyan,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SYSTEM STATUS',
                          style: TextStyle(
                            color: AppColors.cyan,
                            fontSize: 9,
                            fontWeight:
                            FontWeight.w800,
                            letterSpacing: 1.4,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'All systems operational',
                          style: TextStyle(
                            fontWeight:
                            FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.green,
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
                return FadeSlide(
                  delay: Duration(
                    milliseconds: index * 100,
                  ),
                  child: TechCard(
                    item: DummyData.tech[index],
                  ),
                );
              },
              childCount: DummyData.tech.length,
            ),
          ),
        ),
      ],
    );
  }
}