
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/app_colors.dart';
import '../widgets/app_background.dart';
import '../widgets/section_title.dart';

class CampaignStudioScreen extends StatefulWidget {
  const CampaignStudioScreen({super.key});

  @override
  State<CampaignStudioScreen> createState() =>
      _CampaignStudioScreenState();
}

class _CampaignStudioScreenState extends State<CampaignStudioScreen> {
  final TextEditingController _campaignNameController =
  TextEditingController(text: 'New Product Launch');

  final TextEditingController _productController =
  TextEditingController(text: 'Your new product');

  final TextEditingController _audienceController =
  TextEditingController(text: 'Young professionals');

  final TextEditingController _offerController =
  TextEditingController(text: '10% launch discount');

  int _selectedTemplate = 0;
  int _selectedDuration = 5;
  double _budget = 5000;

  String _objective = 'Brand Awareness';
  String _selectedTone = 'Friendly';
  String _selectedOutput = 'Overview';

  final Set<String> _selectedPlatforms = {
    'Instagram',
    'Facebook',
  };

  bool _includeInfluencers = false;
  bool _includePaidAds = true;
  bool _includeEmail = false;
  bool _generated = false;

  final List<_CampaignTemplate> _templates = [
    _CampaignTemplate(
      title: 'Product Launch',
      subtitle: 'Build excitement for something new',
      description:
      'Introduce your product, communicate its value, and encourage people to explore it.',
      icon: Icons.rocket_launch_rounded,
      color: AppColors.purple,
      duration: 5,
      tag: 'POPULAR',
    ),
    _CampaignTemplate(
      title: 'Flash Sale',
      subtitle: 'Promote a limited-time offer',
      description:
      'Create a clear offer, highlight the benefits, and remind customers before it ends.',
      icon: Icons.local_fire_department_rounded,
      color: AppColors.orange,
      duration: 3,
      tag: 'SALES',
    ),
    _CampaignTemplate(
      title: 'Community Building',
      subtitle: 'Turn followers into a community',
      description:
      'Encourage conversations, user stories, customer feedback, and audience participation.',
      icon: Icons.favorite_rounded,
      color: AppColors.pink,
      duration: 7,
      tag: 'ENGAGEMENT',
    ),
    _CampaignTemplate(
      title: 'Brand Awareness',
      subtitle: 'Help more people discover your brand',
      description:
      'Share your brand story, values, product benefits, and memorable visual content.',
      icon: Icons.campaign_rounded,
      color: AppColors.cyan,
      duration: 7,
      tag: 'REACH',
    ),
    _CampaignTemplate(
      title: 'Lead Generation',
      subtitle: 'Collect enquiries from potential customers',
      description:
      'Share a useful offer, explain its value, and invite people to enquire or sign up.',
      icon: Icons.person_add_alt_1_rounded,
      color: AppColors.green,
      duration: 5,
      tag: 'LEADS',
    ),
    _CampaignTemplate(
      title: 'Festive Campaign',
      subtitle: 'Create seasonal promotional content',
      description:
      'Combine festive creatives, special offers, storytelling, and timely reminders.',
      icon: Icons.celebration_rounded,
      color: AppColors.orange,
      duration: 7,
      tag: 'SEASONAL',
    ),
  ];

  final List<String> _platforms = [
    'Instagram',
    'Facebook',
    'YouTube',
    'LinkedIn',
    'WhatsApp',
  ];

  final List<String> _objectives = [
    'Brand Awareness',
    'Engagement',
    'Website Traffic',
    'Sales',
    'Lead Generation',
  ];

  final List<String> _tones = [
    'Friendly',
    'Professional',
    'Playful',
    'Premium',
    'Urgent',
  ];

  @override
  void dispose() {
    _campaignNameController.dispose();
    _productController.dispose();
    _audienceController.dispose();
    _offerController.dispose();
    super.dispose();
  }

  _CampaignTemplate get _template => _templates[_selectedTemplate];

  int get _estimatedDailyBudget =>
      (_budget / _selectedDuration).round();

  String get _campaignName {
    final value = _campaignNameController.text.trim();
    return value.isEmpty ? _template.title : value;
  }

  String get _product {
    final value = _productController.text.trim();
    return value.isEmpty ? 'your product or service' : value;
  }

  String get _audience {
    final value = _audienceController.text.trim();
    return value.isEmpty ? 'your target audience' : value;
  }

  String get _offer {
    final value = _offerController.text.trim();
    return value.isEmpty ? 'a special offer' : value;
  }

  void _selectTemplate(int index) {
    setState(() {
      _selectedTemplate = index;
      _selectedDuration = _templates[index].duration;
      _generated = false;
    });
  }

  void _generateCampaign() {
    if (_selectedPlatforms.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one platform.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() {
      _generated = true;
      _selectedOutput = 'Overview';
    });
  }

  List<_PlanItem> _buildPlan() {
    final product = _product;
    final offer = _offer;
    final audience = _audience;

    final List<_PlanItem> plan = [
      _PlanItem(
        day: 1,
        title: 'Introduce the campaign',
        format: 'Reel / Short video',
        objective: 'Create awareness',
        idea:
        'Introduce $product with a strong opening hook. '
            'Show the main benefit and explain who it is for.',
        cta: 'Discover more',
        color: AppColors.purple,
      ),
      _PlanItem(
        day: 2,
        title: 'Show the benefits',
        format: 'Carousel / Feed post',
        objective: 'Educate your audience',
        idea:
        'Create a visual post explaining three useful benefits of '
            '$product for $audience.',
        cta: 'Save this post',
        color: AppColors.cyan,
      ),
      _PlanItem(
        day: 3,
        title: 'Share a story',
        format: 'Stories / Behind the scenes',
        objective: 'Build trust',
        idea:
        'Show the people, process, or thinking behind $product. '
            'Use a question sticker or invite replies.',
        cta: 'Tell us what you think',
        color: AppColors.pink,
      ),
      _PlanItem(
        day: 4,
        title: 'Present the offer',
        format: 'Promotional post',
        objective: 'Encourage action',
        idea:
        'Highlight $offer. Explain the value clearly and show '
            'the next step customers should take.',
        cta: 'Explore the offer',
        color: AppColors.orange,
      ),
      _PlanItem(
        day: 5,
        title: 'Answer questions',
        format: 'FAQ Reel / Stories',
        objective: 'Remove doubts',
        idea:
        'Answer common questions about $product, including '
            'its features, pricing, availability, or usage.',
        cta: 'Ask us a question',
        color: AppColors.green,
      ),
      _PlanItem(
        day: 6,
        title: 'Share social proof',
        format: 'Testimonial / Story',
        objective: 'Build confidence',
        idea:
        'Share genuine customer feedback, a real use case, '
            'or a demonstration of $product.',
        cta: 'Learn more',
        color: AppColors.pink,
      ),
      _PlanItem(
        day: 7,
        title: 'Campaign recap',
        format: 'Reel + Stories',
        objective: 'Reinforce the message',
        idea:
        'Summarize the campaign, repeat the key benefit, '
            'and invite interested people to take the next step.',
        cta: 'Get started',
        color: AppColors.purple,
      ),
    ];

    if (_selectedDuration == 3) {
      return [
        plan[0],
        plan[3],
        plan[6],
      ];
    }

    if (_selectedDuration == 5) {
      return plan.take(5).toList();
    }

    return plan;
  }

  String _buildOverview() {
    return '''
CAMPAIGN OVERVIEW
━━━━━━━━━━━━━━━━━━━━

Campaign: $_campaignName
Template: ${_template.title}
Product / Service: $_product
Target Audience: $_audience
Objective: $_objective
Tone: $_selectedTone
Duration: $_selectedDuration days

PLATFORMS
${_selectedPlatforms.join(', ')}

OFFER
$_offer

BUDGET PLAN
Total planned budget: ${_formatCurrency(_budget)}
Estimated daily budget: ${_formatCurrency(_estimatedDailyBudget)}

PROMOTION OPTIONS
Paid Ads: ${_includePaidAds ? 'Included' : 'Not included'}
Influencer Marketing: ${_includeInfluencers ? 'Included' : 'Not included'}
Email Marketing: ${_includeEmail ? 'Included' : 'Not included'}

CAMPAIGN APPROACH
${_template.description}

NEXT STEP
Prepare the campaign creatives, schedule the content,
publish consistently, and review the results.
''';
  }

  String _buildCalendarText() {
    return _buildPlan().map((item) {
      return '''
DAY ${item.day}: ${item.title}
Format: ${item.format}
Objective: ${item.objective}

Content idea:
${item.idea}

CTA: ${item.cta}
''';
    }).join('\n────────────────────\n');
  }

  String _buildBudgetText() {
    final paidBudget = _includePaidAds ? _budget * 0.70 : 0.0;
    final creativeBudget = _budget * 0.20;
    final reserveBudget = _budget - paidBudget - creativeBudget;

    return '''
BUDGET PLANNER
━━━━━━━━━━━━━━━━━━━━

Total planned budget: ${_formatCurrency(_budget)}
Campaign duration: $_selectedDuration days
Estimated daily budget: ${_formatCurrency(_estimatedDailyBudget)}

Suggested allocation
${_includePaidAds ? 'Paid promotion (70%): ${_formatCurrency(paidBudget)}' : 'Paid promotion: Disabled'}
Creative production (20%): ${_formatCurrency(creativeBudget)}
Testing / reserve: ${_formatCurrency(reserveBudget)}

IMPORTANT
This is an illustrative budget split, not a guaranteed
spending recommendation. Adjust it to your goals, actual
costs, and campaign results.
''';
  }

  String _buildCopyText() {
    switch (_selectedOutput) {
      case 'Calendar':
        return _buildCalendarText();
      case 'Budget':
        return _buildBudgetText();
      case 'Checklist':
        return _buildChecklistText();
      default:
        return _buildOverview();
    }
  }

  String _buildChecklistText() {
    return '''
CAMPAIGN LAUNCH CHECKLIST
━━━━━━━━━━━━━━━━━━━━

BEFORE LAUNCH
☐ Confirm campaign objective
☐ Finalize offer and campaign dates
☐ Prepare visual identity and creatives
☐ Check links, contact details, and landing page
☐ Review captions and spelling
☐ Confirm selected social platforms

DURING CAMPAIGN
☐ Publish scheduled content
☐ Reply to comments and messages
☐ Monitor reach and engagement
☐ Check paid promotion spend, if enabled
☐ Record customer questions and feedback

AFTER CAMPAIGN
☐ Review results against your objective
☐ Identify the best-performing content
☐ Record leads, enquiries, or sales
☐ Document learnings for the next campaign

Campaign: $_campaignName
''';
  }

  String _formatCurrency(num amount) {
    return '₹${amount.round()}';
  }

  Future<void> _copyCampaign() async {
    await Clipboard.setData(
      ClipboardData(text: _buildCopyText()),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$_selectedOutput copied to clipboard'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Campaign Studio',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            tooltip: 'Reset campaign',
            onPressed: () {
              setState(() {
                _selectedTemplate = 0;
                _selectedDuration = 5;
                _budget = 5000;
                _objective = 'Brand Awareness';
                _selectedTone = 'Friendly';
                _selectedPlatforms
                  ..clear()
                  ..addAll(['Instagram', 'Facebook']);
                _includeInfluencers = false;
                _includePaidAds = true;
                _includeEmail = false;
                _generated = false;
                _selectedOutput = 'Overview';
                _campaignNameController.text = 'New Product Launch';
                _productController.text = 'Your new product';
                _audienceController.text = 'Young professionals';
                _offerController.text = '10% launch discount';
              });
            },
            icon: const Icon(Icons.restart_alt_rounded),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: AppBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            children: [
              _buildHero(),
              const SizedBox(height: 24),

              const SectionTitle(
                title: 'Campaign templates',
                subtitle: 'Start with a proven content structure',
              ),
              const SizedBox(height: 14),
              _buildTemplateGrid(),

              const SizedBox(height: 26),
              const SectionTitle(
                title: 'Campaign details',
                subtitle: 'Customize the plan for your business',
              ),
              const SizedBox(height: 15),

              _buildTextField(
                label: 'Campaign name',
                controller: _campaignNameController,
                hint: 'e.g. Summer launch',
                icon: Icons.edit_note_rounded,
              ),
              _buildTextField(
                label: 'Product or service',
                controller: _productController,
                hint: 'What are you promoting?',
                icon: Icons.inventory_2_outlined,
              ),
              _buildTextField(
                label: 'Target audience',
                controller: _audienceController,
                hint: 'Who do you want to reach?',
                icon: Icons.people_outline_rounded,
              ),
              _buildTextField(
                label: 'Offer or key message',
                controller: _offerController,
                hint: 'e.g. Free delivery this weekend',
                icon: Icons.local_offer_outlined,
              ),

              const SizedBox(height: 8),
              _buildLabel('Campaign objective'),
              _buildChoiceChips(
                options: _objectives,
                selected: _objective,
                onSelected: (value) {
                  setState(() {
                    _objective = value;
                  });
                },
              ),

              const SizedBox(height: 20),
              _buildLabel('Brand voice'),
              _buildChoiceChips(
                options: _tones,
                selected: _selectedTone,
                onSelected: (value) {
                  setState(() {
                    _selectedTone = value;
                  });
                },
              ),

              const SizedBox(height: 22),
              _buildPlatformSelector(),

              const SizedBox(height: 22),
              _buildDurationSelector(),

              const SizedBox(height: 22),
              _buildBudgetPlanner(),

              const SizedBox(height: 20),
              const SectionTitle(
                title: 'Marketing channels',
                subtitle: 'Choose additional campaign activities',
              ),
              const SizedBox(height: 10),

              _buildSwitchTile(
                icon: Icons.ads_click_rounded,
                title: 'Paid advertising',
                subtitle: 'Promote content to reach more people',
                value: _includePaidAds,
                color: AppColors.purple,
                onChanged: (value) {
                  setState(() => _includePaidAds = value);
                },
              ),
              _buildSwitchTile(
                icon: Icons.people_alt_outlined,
                title: 'Influencer collaboration',
                subtitle: 'Work with relevant creators',
                value: _includeInfluencers,
                color: AppColors.pink,
                onChanged: (value) {
                  setState(() => _includeInfluencers = value);
                },
              ),
              _buildSwitchTile(
                icon: Icons.mark_email_read_outlined,
                title: 'Email marketing',
                subtitle: 'Send updates to your subscriber list',
                value: _includeEmail,
                color: AppColors.cyan,
                onChanged: (value) {
                  setState(() => _includeEmail = value);
                },
              ),

              const SizedBox(height: 22),
              _buildGenerateButton(),

              if (_generated) ...[
                const SizedBox(height: 28),
                const SectionTitle(
                  title: 'Your campaign workspace',
                  subtitle: 'Your editable campaign plan is ready',
                ),
                const SizedBox(height: 14),
                _buildSummaryCards(),
                const SizedBox(height: 18),
                _buildOutputSelector(),
                const SizedBox(height: 12),
                _buildOutputPanel(),
              ],

              const SizedBox(height: 20),
              _buildFooterNote(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      padding: const EdgeInsets.all(21),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF3A2868),
            Color(0xFF242440),
            Color(0xFF123641),
          ],
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.auto_awesome_rounded,
                  color: AppColors.cyan,
                  size: 14,
                ),
                SizedBox(width: 6),
                Text(
                  'MARKETING COMMAND CENTER',
                  style: TextStyle(
                    fontSize: 9,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 17),
          const Text(
            'Plan campaigns.\nGrow your brand.',
            style: TextStyle(
              fontSize: 29,
              height: 1.12,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.6,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Build a content calendar, organize your budget, '
                'and turn your next promotion into an actionable plan.',
            style: TextStyle(
              color: Color(0xFFD2D7E8),
              fontSize: 12,
              height: 1.55,
            ),
          ),
          const SizedBox(height: 19),
          Row(
            children: [
              _heroMetric(
                Icons.calendar_month_rounded,
                'Content plan',
              ),
              const SizedBox(width: 8),
              _heroMetric(
                Icons.account_balance_wallet_outlined,
                'Budget planner',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heroMetric(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 11,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.cyan, size: 17),
            const SizedBox(width: 7),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplateGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _templates.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 11,
        mainAxisSpacing: 11,
        childAspectRatio: 0.94,
      ),
      itemBuilder: (context, index) {
        final item = _templates[index];
        final selected = index == _selectedTemplate;

        return InkWell(
          borderRadius: BorderRadius.circular(21),
          onTap: () => _selectTemplate(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: selected
                  ? item.color.withValues(alpha: 0.12)
                  : AppColors.surface,
              borderRadius: BorderRadius.circular(21),
              border: Border.all(
                color: selected ? item.color : AppColors.border,
                width: selected ? 1.5 : 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 39,
                      height: 39,
                      decoration: BoxDecoration(
                        color: item.color.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Icon(
                        item.icon,
                        color: item.color,
                        size: 21,
                      ),
                    ),
                    const Spacer(),
                    if (selected)
                      Icon(
                        Icons.check_circle_rounded,
                        color: item.color,
                        size: 19,
                      ),
                  ],
                ),
                const SizedBox(height: 13),
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: Text(
                    item.subtitle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 10.5,
                      height: 1.35,
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Icon(
                      Icons.schedule_rounded,
                      color: item.color,
                      size: 13,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${item.duration}-day plan',
                      style: TextStyle(
                        color: item.color,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel(label),
          TextField(
            controller: controller,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: hint,
              prefixIcon: Icon(icon, size: 20),
              filled: true,
              fillColor: AppColors.surface,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.border,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.border,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.purple,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.text,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _buildChoiceChips({
    required List<String> options,
    required String selected,
    required ValueChanged<String> onSelected,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((option) {
        final isSelected = selected == option;

        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (_) => onSelected(option),
          showCheckmark: false,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : AppColors.muted,
            fontSize: 10.5,
            fontWeight: FontWeight.w700,
          ),
          selectedColor: AppColors.purple.withValues(alpha: 0.35),
          backgroundColor: AppColors.surface,
          side: BorderSide(
            color: isSelected
                ? AppColors.purple
                : AppColors.border,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPlatformSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: 'Publishing platforms',
          subtitle: 'Choose where to share your campaign',
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _platforms.map((platform) {
            final selected = _selectedPlatforms.contains(platform);

            return FilterChip(
              avatar: Icon(
                _platformIcon(platform),
                size: 16,
                color: selected ? AppColors.cyan : AppColors.muted,
              ),
              label: Text(platform),
              selected: selected,
              showCheckmark: false,
              onSelected: (value) {
                setState(() {
                  if (value) {
                    _selectedPlatforms.add(platform);
                  } else {
                    _selectedPlatforms.remove(platform);
                  }
                });
              },
              labelStyle: TextStyle(
                color: selected ? AppColors.text : AppColors.muted,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
              backgroundColor: AppColors.surface,
              selectedColor: AppColors.cyan.withValues(alpha: 0.12),
              side: BorderSide(
                color: selected ? AppColors.cyan : AppColors.border,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  IconData _platformIcon(String platform) {
    switch (platform) {
      case 'Instagram':
        return Icons.camera_alt_outlined;
      case 'Facebook':
        return Icons.facebook_rounded;
      case 'YouTube':
        return Icons.play_circle_outline_rounded;
      case 'LinkedIn':
        return Icons.work_outline_rounded;
      default:
        return Icons.chat_bubble_outline_rounded;
    }
  }

  Widget _buildDurationSelector() {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Campaign duration',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                '$_selectedDuration days',
                style: const TextStyle(
                  color: AppColors.cyan,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'Choose how long the campaign will run.',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 12),
          Slider(
            value: _selectedDuration.toDouble(),
            min: 3,
            max: 7,
            divisions: 4,
            activeColor: AppColors.purple,
            inactiveColor: AppColors.border,
            label: '$_selectedDuration days',
            onChanged: (value) {
              setState(() {
                _selectedDuration = value.round();
                _generated = false;
              });
            },
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('3 days', style: TextStyle(color: AppColors.muted, fontSize: 10)),
              Text('7 days', style: TextStyle(color: AppColors.muted, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetPlanner() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.green.withValues(alpha: 0.13),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.account_balance_wallet_outlined,
                  color: AppColors.green,
                ),
              ),
              const SizedBox(width: 11),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Campaign budget',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Set your planned spending limit',
                      style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 10.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            _formatCurrency(_budget),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            'Approximately ${_formatCurrency(_estimatedDailyBudget)} per day',
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 11,
            ),
          ),
          Slider(
            value: _budget,
            min: 1000,
            max: 50000,
            divisions: 49,
            activeColor: AppColors.green,
            inactiveColor: AppColors.border,
            label: _formatCurrency(_budget),
            onChanged: (value) {
              setState(() {
                _budget = value.roundToDouble();
                _generated = false;
              });
            },
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('₹1,000', style: TextStyle(color: AppColors.muted, fontSize: 10)),
              Text('₹50,000', style: TextStyle(color: AppColors.muted, fontSize: 10)),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.background2,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  size: 16,
                  color: AppColors.muted,
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Budget values are planning estimates, not platform charges or guaranteed results.',
                    style: TextStyle(
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

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required Color color,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 19),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11.5,
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
          ),
          Switch.adaptive(
            value: value,
            activeTrackColor: AppColors.purple,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildGenerateButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF8055F7),
            Color(0xFF5D49C9),
          ],
        ),
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: AppColors.purple.withValues(alpha: 0.22),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(17),
          onTap: _generateCampaign,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.auto_awesome_rounded, color: Colors.white),
                SizedBox(width: 9),
                Text(
                  'Build my campaign plan',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 17,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCards() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.75,
      children: [
        _summaryCard(
          icon: Icons.calendar_month_rounded,
          title: 'Duration',
          value: '$_selectedDuration days',
          color: AppColors.purple,
        ),
        _summaryCard(
          icon: Icons.account_balance_wallet_outlined,
          title: 'Planned budget',
          value: _formatCurrency(_budget),
          color: AppColors.green,
        ),
        _summaryCard(
          icon: Icons.share_outlined,
          title: 'Platforms',
          value: '${_selectedPlatforms.length} selected',
          color: AppColors.cyan,
        ),
        _summaryCard(
          icon: Icons.checklist_rounded,
          title: 'Content plan',
          value: '${_buildPlan().length} activities',
          color: AppColors.orange,
        ),
      ],
    );
  }

  Widget _summaryCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 17),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOutputSelector() {
    const options = [
      'Overview',
      'Calendar',
      'Budget',
      'Checklist',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: options.map((option) {
          final selected = _selectedOutput == option;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(option),
              selected: selected,
              showCheckmark: false,
              onSelected: (_) {
                setState(() => _selectedOutput = option);
              },
              labelStyle: TextStyle(
                color: selected ? Colors.white : AppColors.muted,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
              selectedColor: AppColors.purple.withValues(alpha: 0.38),
              backgroundColor: AppColors.surface,
              side: BorderSide(
                color: selected
                    ? AppColors.purple
                    : AppColors.border,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildOutputPanel() {
    if (_selectedOutput == 'Calendar') {
      return _buildCalendarPanel();
    }

    final String content = _buildCopyText();

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
          Row(
            children: [
              const Expanded(
                child: Text(
                  'CAMPAIGN DOCUMENT',
                  style: TextStyle(
                    color: AppColors.cyan,
                    letterSpacing: 1.2,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              IconButton(
                onPressed: _copyCampaign,
                tooltip: 'Copy campaign',
                icon: const Icon(Icons.copy_rounded, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 7),
          SelectableText(
            content,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 12,
              height: 1.65,
            ),
          ),
          const SizedBox(height: 13),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _copyCampaign,
              icon: const Icon(Icons.content_copy_rounded, size: 16),
              label: const Text('Copy to clipboard'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.text,
                side: const BorderSide(color: AppColors.border),
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarPanel() {
    final plan = _buildPlan();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'CONTENT CALENDAR',
                  style: TextStyle(
                    color: AppColors.cyan,
                    fontSize: 10,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              IconButton(
                tooltip: 'Copy calendar',
                onPressed: _copyCampaign,
                icon: const Icon(Icons.copy_rounded, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...plan.map((item) => _buildPlanItem(item)),
          const SizedBox(height: 10),
          const Text(
            'Suggested content schedule. Adjust publishing times to your audience and results.',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 10,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanItem(_PlanItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 45,
            child: Column(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: item.color.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'D${item.day}',
                    style: TextStyle(
                      color: item.color,
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 80,
                  color: AppColors.border,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: AppColors.background2,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.format,
                    style: TextStyle(
                      color: item.color,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.idea,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 11,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'CTA: ${item.cta}',
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterNote() {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: AppColors.muted,
            size: 17,
          ),
          SizedBox(width: 9),
          Expanded(
            child: Text(
              'Demo mode: this screen creates a campaign plan from local templates. '
                  'It does not publish posts, launch advertisements, or connect to live analytics. '
                  'Review the plan and verify all details before launching.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 10.5,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CampaignTemplate {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;
  final int duration;
  final String tag;

  const _CampaignTemplate({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
    required this.duration,
    required this.tag,
  });
}

class _PlanItem {
  final int day;
  final String title;
  final String format;
  final String objective;
  final String idea;
  final String cta;
  final Color color;

  const _PlanItem({
    required this.day,
    required this.title,
    required this.format,
    required this.objective,
    required this.idea,
    required this.cta,
    required this.color,
  });
}