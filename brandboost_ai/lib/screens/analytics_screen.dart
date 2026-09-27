
import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../widgets/app_background.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  String _period = '7D';
  String _selectedMetric = 'Reach';
  String _contentFilter = 'All';
  bool _showInsights = true;

  final List<String> _periods = ['7D', '30D', '90D'];
  final List<String> _contentFilters = ['All', 'Reels', 'Posts', 'Stories'];

  final Map<String, List<double>> _chartData = {
    'Reach': [0.72, 0.58, 0.66, 0.39, 0.49, 0.22, 0.12],
    'Engagement': [0.65, 0.73, 0.45, 0.54, 0.30, 0.40, 0.18],
    'Profile visits': [0.80, 0.61, 0.69, 0.48, 0.57, 0.31, 0.22],
    'Saves': [0.78, 0.64, 0.72, 0.53, 0.38, 0.29, 0.16],
  };

  final Map<String, Color> _metricColors = {
    'Reach': AppColors.cyan,
    'Engagement': AppColors.pink,
    'Profile visits': AppColors.purple,
    'Saves': AppColors.orange,
  };

  final Map<String, String> _metricValues = {
    'Reach': '12.8K',
    'Engagement': '8.6%',
    'Profile visits': '2,410',
    'Saves': '386',
  };

  final Map<String, String> _metricChanges = {
    'Reach': '+18.4%',
    'Engagement': '+2.1%',
    'Profile visits': '+12.0%',
    'Saves': '+9.7%',
  };

  final Map<String, String> _metricDescriptions = {
    'Reach': 'Unique accounts that saw your content.',
    'Engagement': 'Interactions relative to the selected reach.',
    'Profile visits': 'Visits to your profile from content.',
    'Saves': 'Times your content was saved.',
  };

  final List<_PostData> _posts = const [
    _PostData(
      title: 'New product launch',
      type: 'Reels',
      date: '2 days ago',
      views: '8.4K',
      likes: '642',
      comments: '84',
      saves: '126',
      icon: Icons.play_circle_outline_rounded,
      color: AppColors.pink,
    ),
    _PostData(
      title: 'Behind the scenes',
      type: 'Reels',
      date: '4 days ago',
      views: '6.2K',
      likes: '489',
      comments: '52',
      saves: '98',
      icon: Icons.movie_outlined,
      color: AppColors.purple,
    ),
    _PostData(
      title: 'Weekend special offer',
      type: 'Posts',
      date: '5 days ago',
      views: '4.1K',
      likes: '318',
      comments: '31',
      saves: '76',
      icon: Icons.image_outlined,
      color: AppColors.cyan,
    ),
    _PostData(
      title: 'Customer appreciation',
      type: 'Stories',
      date: '6 days ago',
      views: '2.8K',
      likes: '194',
      comments: '18',
      saves: '24',
      icon: Icons.auto_stories_outlined,
      color: AppColors.orange,
    ),
  ];

  List<double> get _currentChartData {
    final base = _chartData[_selectedMetric] ??
        _chartData['Reach']!;

    if (_period == '7D') {
      return base;
    }

    if (_period == '30D') {
      return List.generate(7, (i) {
        final previous = base[i];
        final next = base[(i + 1) % base.length];
        return ((previous + next) / 2).clamp(0.05, 0.95);
      });
    }

    return List.generate(7, (i) {
      return (base[(i + 2) % base.length] * 0.85 + 0.08)
          .clamp(0.05, 0.95);
    });
  }

  List<String> get _chartLabels {
    if (_period == '7D') {
      return ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    }

    if (_period == '30D') {
      return ['WEEK 1', 'WEEK 2', 'WEEK 3', 'WEEK 4', 'WEEK 5', 'WEEK 6', 'NOW'];
    }

    return ['W-6', 'W-5', 'W-4', 'W-3', 'W-2', 'W-1', 'NOW'];
  }

  List<_PostData> get _filteredPosts {
    if (_contentFilter == 'All') return _posts;

    return _posts
        .where((post) => post.type == _contentFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final metricColor = _metricColors[_selectedMetric] ??
        AppColors.cyan;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Analytics',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            tooltip: 'Reset dashboard',
            onPressed: _resetFilters,
            icon: const Icon(Icons.refresh_rounded),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: AppBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildPeriodSelector(),
              const SizedBox(height: 22),
              _buildOverviewCard(),
              const SizedBox(height: 22),
              _buildSectionHeader(
                'Performance overview',
                'Explore your key metrics',
              ),
              const SizedBox(height: 13),
              _buildMetricGrid(),
              const SizedBox(height: 22),
              _buildChartCard(metricColor),
              const SizedBox(height: 22),
              _buildSectionHeader(
                'Audience activity',
                'Illustrative activity by day and time',
              ),
              const SizedBox(height: 13),
              _buildAudienceActivity(),
              const SizedBox(height: 22),
              _buildInsightsSection(),
              const SizedBox(height: 22),
              _buildTopContentSection(),
              const SizedBox(height: 22),
              _buildCampaignBreakdown(),
              const SizedBox(height: 20),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: AppColors.purple.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.purple.withValues(alpha: 0.30),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.auto_awesome_rounded,
                color: AppColors.purple,
                size: 14,
              ),
              SizedBox(width: 6),
              Text(
                'BRAND PERFORMANCE CENTER',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 13),
        const Text(
          'Your growth, at a glance.',
          style: TextStyle(
            fontSize: 25,
            height: 1.15,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'Understand what works, discover trends, and plan your next move.',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 12,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodSelector() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Reporting period',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 12,
            ),
          ),
        ),
        ..._periods.map((period) {
          final selected = _period == period;

          return Padding(
            padding: const EdgeInsets.only(left: 7),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => setState(() => _period = period),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: selected
                      ? AppColors.purple
                      : AppColors.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selected
                        ? AppColors.purple
                        : AppColors.border,
                  ),
                ),
                child: Text(
                  period,
                  style: TextStyle(
                    color: selected ? Colors.white : AppColors.muted,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildOverviewCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF39285F),
            Color(0xFF252440),
            Color(0xFF17353E),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'TOTAL REACH',
                  style: TextStyle(
                    color: Color(0xFFD5D2EE),
                    fontSize: 10,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.green.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.trending_up_rounded,
                      size: 14,
                      color: AppColors.green,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '+18.4%',
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          const Text(
            '12,840',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Illustrative accounts reached in the last $_period',
            style: const TextStyle(
              color: Color(0xFFD0D5E7),
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 21),
          const Divider(color: Color(0x33FFFFFF)),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _overviewMetric(
                  'Interactions',
                  '1,104',
                  Icons.favorite_border_rounded,
                ),
              ),
              Expanded(
                child: _overviewMetric(
                  'New followers',
                  '+284',
                  Icons.person_add_alt_1_rounded,
                ),
              ),
              Expanded(
                child: _overviewMetric(
                  'Content pieces',
                  '18',
                  Icons.grid_view_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _overviewMetric(
      String label,
      String value,
      IconData icon,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 17, color: AppColors.cyan),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFD0D5E7),
            fontSize: 9,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 11,
      mainAxisSpacing: 11,
      childAspectRatio: 1.65,
      children: [
        _metricCard(
          'Reach',
          '12.8K',
          '+18.4%',
          Icons.visibility_outlined,
          AppColors.cyan,
        ),
        _metricCard(
          'Engagement',
          '8.6%',
          '+2.1%',
          Icons.favorite_border_rounded,
          AppColors.pink,
        ),
        _metricCard(
          'Profile visits',
          '2,410',
          '+12.0%',
          Icons.person_outline_rounded,
          AppColors.purple,
        ),
        _metricCard(
          'Saves',
          '386',
          '+9.7%',
          Icons.bookmark_border_rounded,
          AppColors.orange,
        ),
      ],
    );
  }

  Widget _metricCard(
      String label,
      String value,
      String change,
      IconData icon,
      Color color,
      ) {
    final selected = _selectedMetric == label;

    return InkWell(
      borderRadius: BorderRadius.circular(19),
      onTap: () {
        setState(() => _selectedMetric = label);
      },
      onLongPress: () => _showMetricDetails(label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(
            color: selected ? color : AppColors.border,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: color),
                const Spacer(),
                if (selected)
                  Icon(
                    Icons.check_circle_rounded,
                    size: 15,
                    color: color,
                  ),
              ],
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 10,
                    ),
                  ),
                ),
                Text(
                  change,
                  style: TextStyle(
                    color: color,
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartCard(Color metricColor) {
    final values = _currentChartData;

    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(23),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Performance trend',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '$_selectedMetric • $_period',
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: metricColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.insights_rounded,
                  color: metricColor,
                  size: 19,
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          SizedBox(
            height: 165,
            width: double.infinity,
            child: CustomPaint(
              painter: _ChartPainter(
                values: values,
                color: metricColor,
              ),
              child: const SizedBox.expand(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _chartLabels.map((label) {
              return Flexible(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 17),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.background2,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline_rounded,
                  color: metricColor,
                  size: 17,
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    'Tap another metric above to explore its trend.',
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 10,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAudienceActivity() {
    const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    const activity = [
      [0.25, 0.42, 0.67, 0.82, 0.51, 0.30],
      [0.18, 0.35, 0.60, 0.73, 0.48, 0.26],
      [0.30, 0.52, 0.78, 0.90, 0.64, 0.38],
      [0.20, 0.45, 0.65, 0.76, 0.52, 0.32],
      [0.35, 0.58, 0.84, 0.95, 0.71, 0.43],
      [0.40, 0.66, 0.90, 0.86, 0.76, 0.50],
      [0.28, 0.48, 0.72, 0.81, 0.60, 0.35],
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.schedule_rounded,
                color: AppColors.cyan,
                size: 19,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Activity heatmap',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          const Text(
            'Illustrative activity levels across the week.',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              const SizedBox(width: 34),
              ...['8 AM', '12 PM', '4 PM', '8 PM', '10 PM', '12 AM']
                  .map(
                    (label) => Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 7,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          ...List.generate(7, (dayIndex) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  SizedBox(
                    width: 34,
                    child: Text(
                      days[dayIndex],
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  ...activity[dayIndex].map((level) {
                    return Expanded(
                      child: Container(
                        height: 22,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: AppColors.cyan.withValues(
                            alpha: 0.10 + level * 0.85,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          }),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text(
                'Less active',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 9,
                ),
              ),
              const SizedBox(width: 8),
              ...List.generate(5, (index) {
                return Container(
                  width: 17,
                  height: 9,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: AppColors.cyan.withValues(
                      alpha: 0.15 + index * 0.19,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }),
              const SizedBox(width: 4),
              const Text(
                'More active',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInsightsSection() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: () => setState(
                  () => _showInsights = !_showInsights,
            ),
            child: Padding(
              padding: const EdgeInsets.all(17),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.purple.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Icon(
                      Icons.auto_awesome_rounded,
                      color: AppColors.purple,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 11),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Marketing insights',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Ideas to try based on sample metrics',
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    _showInsights
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: AppColors.muted,
                  ),
                ],
              ),
            ),
          ),
          if (_showInsights) ...[
            const Divider(height: 1, color: AppColors.border),
            _insightRow(
              Icons.play_circle_outline_rounded,
              AppColors.pink,
              'Explore short-form video',
              'Your sample Reels have the highest views. '
                  'Test another short video with a clear opening hook.',
              'CONTENT IDEA',
            ),
            _insightRow(
              Icons.bookmark_border_rounded,
              AppColors.cyan,
              'Create save-worthy posts',
              'Try practical tips, checklists, or product guides '
                  'that your audience can refer to later.',
              'ENGAGEMENT IDEA',
            ),
            _insightRow(
              Icons.schedule_rounded,
              AppColors.orange,
              'Test different posting times',
              'Compare results across posting times before '
                  'choosing a regular publishing schedule.',
              'EXPERIMENT',
            ),
          ],
        ],
      ),
    );
  }

  Widget _insightRow(
      IconData icon,
      Color color,
      String title,
      String description,
      String label,
      ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, color: color, size: 19),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontSize: 8,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 10.5,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopContentSection() {
    final posts = _filteredPosts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          'Top-performing content',
          'Explore your sample content performance',
        ),
        const SizedBox(height: 13),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _contentFilters.map((filter) {
              final selected = _contentFilter == filter;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(filter),
                  selected: selected,
                  showCheckmark: false,
                  onSelected: (_) {
                    setState(() => _contentFilter = filter);
                  },
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : AppColors.muted,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                  selectedColor: AppColors.purple,
                  backgroundColor: AppColors.surface,
                  side: BorderSide(
                    color: selected
                        ? AppColors.purple
                        : AppColors.border,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        if (posts.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
            ),
            child: const Text(
              'No sample content in this category.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 11,
              ),
            ),
          )
        else
          ...posts.asMap().entries.map((entry) {
            return _postCard(entry.key + 1, entry.value);
          }),
      ],
    );
  }

  Widget _postCard(int rank, _PostData post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 58,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      post.color.withValues(alpha: 0.24),
                      AppColors.background2,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  post.icon,
                  color: post.color,
                  size: 27,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#$rank  ${post.title}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${post.type}  •  ${post.date}',
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        Icon(
                          Icons.visibility_outlined,
                          size: 13,
                          color: post.color,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${post.views} views',
                          style: TextStyle(
                            color: post.color,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.muted,
              ),
            ],
          ),
          const SizedBox(height: 13),
          const Divider(height: 1, color: AppColors.border),
          const SizedBox(height: 12),
          Row(
            children: [
              _postStat(Icons.favorite_border_rounded, post.likes),
              const SizedBox(width: 18),
              _postStat(Icons.mode_comment_outlined, post.comments),
              const SizedBox(width: 18),
              _postStat(Icons.bookmark_border_rounded, post.saves),
              const Spacer(),
              Text(
                post.type.toUpperCase(),
                style: TextStyle(
                  color: post.color,
                  fontSize: 8,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _postStat(IconData icon, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: AppColors.muted),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildCampaignBreakdown() {
    const campaignData = [
      _CampaignData('Product launch', 0.86, '86%', AppColors.purple),
      _CampaignData('Weekend offer', 0.67, '67%', AppColors.cyan),
      _CampaignData('Community stories', 0.52, '52%', AppColors.pink),
      _CampaignData('Brand awareness', 0.39, '39%', AppColors.orange),
    ];

    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Campaign performance',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Illustrative relative performance scores',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 19),
          ...campaignData.map((campaign) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 17),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          campaign.name,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        campaign.percent,
                        style: TextStyle(
                          color: campaign.color,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: campaign.progress,
                      minHeight: 7,
                      backgroundColor: AppColors.background2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        campaign.color,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: AppColors.muted,
            size: 16,
          ),
          SizedBox(width: 9),
          Expanded(
            child: Text(
              'Demo analytics only. These figures, trends, ratings, '
                  'and audience activity levels are illustrative. '
                  'Instagram Insights and a live backend are not connected.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 10,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showMetricDetails(String metric) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(23),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  metric,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _metricDescriptions[metric] ?? '',
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 13,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Sample value: ${_metricValues[metric] ?? '-'}',
                  style: TextStyle(
                    color: _metricColors[metric] ?? AppColors.cyan,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Sample change: ${_metricChanges[metric] ?? '-'}',
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Got it'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _resetFilters() {
    setState(() {
      _period = '7D';
      _selectedMetric = 'Reach';
      _contentFilter = 'All';
      _showInsights = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Analytics filters reset'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class _PostData {
  final String title;
  final String type;
  final String date;
  final String views;
  final String likes;
  final String comments;
  final String saves;
  final IconData icon;
  final Color color;

  const _PostData({
    required this.title,
    required this.type,
    required this.date,
    required this.views,
    required this.likes,
    required this.comments,
    required this.saves,
    required this.icon,
    required this.color,
  });
}

class _CampaignData {
  final String name;
  final double progress;
  final String percent;
  final Color color;

  const _CampaignData(
      this.name,
      this.progress,
      this.percent,
      this.color,
      );
}

class _ChartPainter extends CustomPainter {
  final List<double> values;
  final Color color;

  const _ChartPainter({
    required this.values,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty || size.width <= 0 || size.height <= 0) {
      return;
    }

    const horizontalPadding = 5.0;
    const verticalPadding = 8.0;

    final chartWidth = size.width - horizontalPadding * 2;
    final chartHeight = size.height - verticalPadding * 2;

    final gridPaint = Paint()
      ..color = AppColors.border
      ..strokeWidth = 1;

    for (var i = 0; i < 4; i++) {
      final y = verticalPadding + chartHeight * i / 3;

      canvas.drawLine(
        Offset(horizontalPadding, y),
        Offset(size.width - horizontalPadding, y),
        gridPaint,
      );
    }

    final points = <Offset>[];

    for (var i = 0; i < values.length; i++) {
      final x = horizontalPadding +
          chartWidth * i / math.max(1, values.length - 1);

      final normalized = values[i].clamp(0.0, 1.0);
      final y = verticalPadding + chartHeight * normalized;

      points.add(Offset(x, y));
    }

    final linePath = Path()..moveTo(points.first.dx, points.first.dy);

    for (var i = 1; i < points.length; i++) {
      final previous = points[i - 1];
      final current = points[i];

      final controlX = (previous.dx + current.dx) / 2;

      linePath.cubicTo(
        controlX,
        previous.dy,
        controlX,
        current.dy,
        current.dx,
        current.dy,
      );
    }

    final fillPath = Path.from(linePath)
      ..lineTo(points.last.dx, size.height - verticalPadding)
      ..lineTo(points.first.dx, size.height - verticalPadding)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withValues(alpha: 0.25),
          color.withValues(alpha: 0.01),
        ],
      ).createShader(Offset.zero & size);

    canvas.drawPath(fillPath, fillPaint);

    final linePaint = Paint()
      ..color = color
      ..strokeWidth = 2.7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(linePath, linePaint);

    final dotPaint = Paint()..color = color;
    final dotBorderPaint = Paint()
      ..color = AppColors.surface
      ..style = PaintingStyle.fill;

    for (final point in points) {
      canvas.drawCircle(point, 4.2, dotBorderPaint);
      canvas.drawCircle(point, 3.1, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _ChartPainter oldDelegate) {
    return oldDelegate.values != values ||
        oldDelegate.color != color;
  }
}