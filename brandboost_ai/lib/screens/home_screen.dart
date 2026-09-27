import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../widgets/app_background.dart';
import '../widgets/feature_card.dart';
import '../widgets/section_title.dart';
import 'reel_studio_screen.dart';
import 'ai_content_screen.dart';
import 'campaign_studio_screen.dart';
import 'poster_studio_screen.dart';
import 'product_catalog_screen.dart';
import 'analytics_screen.dart';
import 'brand_kit_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _open(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final features = <_FeatureData>[
      _FeatureData('Reels Studio', 'Create scroll-stopping short videos', Icons.movie_creation_outlined, AppColors.pink,
          () => _open(context, const ReelStudioScreen())),
      _FeatureData('AI Content', 'Hooks, captions & hashtags', Icons.auto_awesome, AppColors.cyan,
          () => _open(context, const AiContentScreen())),
      _FeatureData('Campaign Studio', 'Plan your next promotion', Icons.campaign_outlined, AppColors.orange,
          () => _open(context, const CampaignStudioScreen())),
      _FeatureData('Poster Studio', 'Design offers and product posts', Icons.dashboard_customize_outlined, AppColors.purple,
          () => _open(context, const PosterStudioScreen())),
      _FeatureData('Product Catalog', 'Keep products campaign-ready', Icons.inventory_2_outlined, AppColors.green,
          () => _open(context, const ProductCatalogScreen())),
      _FeatureData('Analytics', 'Track your demo performance', Icons.insights_outlined, AppColors.cyan,
          () => _open(context, const AnalyticsScreen())),
      _FeatureData('Brand Kit', 'Your colors, name and voice', Icons.palette_outlined, AppColors.pink,
          () => _open(context, const BrandKitScreen())),
    ];

    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Row(
                      children: [
                        Container(
                          width: 44, height: 44,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [AppColors.purple, AppColors.pink]),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(Icons.bolt_rounded, color: Colors.white, size: 27),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('BrandBoost AI', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                            Text('MARKETING STUDIO', style: TextStyle(color: AppColors.muted, fontSize: 9, letterSpacing: 2.1, fontWeight: FontWeight.w700)),
                          ],
                        )),
                        Container(
                          padding: const EdgeInsets.all(11),
                          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.border)),
                          child: const Icon(Icons.notifications_none_rounded, size: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
                          colors: [Color(0xFF33265E), Color(0xFF1C2540), Color(0xFF172E39)]),
                        border: Border.all(color: Colors.white.withValues(alpha: .10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(color: Colors.white.withValues(alpha: .10), borderRadius: BorderRadius.circular(30)),
                            child: const Row(mainAxisSize: MainAxisSize.min, children: [
                              Icon(Icons.auto_awesome, size: 13, color: AppColors.cyan),
                              SizedBox(width: 6),
                              Text('YOUR CREATIVE WORKSPACE', style: TextStyle(fontSize: 9, letterSpacing: 1.1, fontWeight: FontWeight.w800)),
                            ]),
                          ),
                          const SizedBox(height: 17),
                          const Text('Make your next\npost impossible to skip.', style: TextStyle(fontSize: 28, height: 1.12, fontWeight: FontWeight.w900, letterSpacing: -.8)),
                          const SizedBox(height: 10),
                          const Text('Create Reels concepts, captions and campaigns in one premium workspace.',
                              style: TextStyle(color: Color(0xFFD0D5E6), height: 1.45, fontSize: 13)),
                          const SizedBox(height: 20),
                          FilledButton.icon(
                            onPressed: () => _open(context, const ReelStudioScreen()),
                            icon: const Icon(Icons.play_circle_outline_rounded),
                            label: const Text('Open Reels Studio'),
                            style: FilledButton.styleFrom(backgroundColor: AppColors.pink, foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    const SectionTitle(title: 'Creative workspace', subtitle: 'Everything you need to grow your brand'),
                    const SizedBox(height: 15),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: features.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, mainAxisExtent: 155,
                      ),
                      itemBuilder: (context, index) {
                        final f = features[index];
                        return FeatureCard(title: f.title, subtitle: f.subtitle, icon: f.icon, color: f.color, onTap: f.onTap);
                      },
                    ),
                    const SizedBox(height: 24),
                    const SectionTitle(title: 'Quick insight', subtitle: 'Sample workspace metrics'),
                    const SizedBox(height: 13),
                    const Row(children: [
                      Expanded(child: _MetricCard(label: 'Reach', value: '12.8K', change: '+18.4%', icon: Icons.visibility_outlined, color: AppColors.cyan)),
                      SizedBox(width: 10),
                      Expanded(child: _MetricCard(label: 'Engagement', value: '8.6%', change: '+2.1%', icon: Icons.favorite_border, color: AppColors.pink)),
                    ]),
                    const SizedBox(height: 10),
                    const Text('Demo figures only • connect your social accounts for real analytics.', style: TextStyle(color: AppColors.muted, fontSize: 10.5)),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureData {
  final String title, subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const _FeatureData(this.title, this.subtitle, this.icon, this.color, this.onTap);
}

class _MetricCard extends StatelessWidget {
  final String label, value, change;
  final IconData icon;
  final Color color;
  const _MetricCard({required this.label, required this.value, required this.change, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.border)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [Icon(icon, size: 17, color: color), const SizedBox(width: 7), Text(label, style: const TextStyle(color: AppColors.muted, fontSize: 12))]),
      const SizedBox(height: 10),
      Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
      const SizedBox(height: 5),
      Text(change, style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 11)),
    ]),
  );
}
