import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/animations/fade_slide.dart';
import '../../core/widgets/glass_container.dart';
import '../../widgets/section_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            title: 'Profile',
            subtitle: 'Your VibeFlow journey.',
          ),
        ),
        SliverToBoxAdapter(
          child: FadeSlide(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20),
              child: GlassContainer(
                padding: const EdgeInsets.all(20),
                borderRadius:
                BorderRadius.circular(30),
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.cyan
                              .withOpacity(.5),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.cyan
                                .withOpacity(.2),
                            blurRadius: 30,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.network(
                          AppAssets.profile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Creative Explorer',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Discover • Create • Inspire',
                      style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: const [
                        Expanded(
                          child: _Stat(
                            value: '128',
                            label: 'Saved',
                          ),
                        ),
                        Expanded(
                          child: _Stat(
                            value: '42',
                            label: 'Explored',
                          ),
                        ),
                        Expanded(
                          child: _Stat(
                            value: '18',
                            label: 'Created',
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
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Expanded(
                  child: _Achievement(
                    icon: Icons.auto_awesome,
                    title: 'Explorer',
                    subtitle: '100 discoveries',
                    color: AppColors.cyan,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _Achievement(
                    icon: Icons.bolt,
                    title: 'Creator',
                    subtitle: '10 creations',
                    color: AppColors.purple,
                  ),
                ),
              ],
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

class _Stat extends StatelessWidget {
  final String value;
  final String label;

  const _Stat({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class _Achievement extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _Achievement({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(22),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(.12),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}