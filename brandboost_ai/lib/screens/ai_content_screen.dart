import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/app_colors.dart';
import '../widgets/app_background.dart';
import '../widgets/primary_button.dart';

class AiContentScreen extends StatefulWidget {
  const AiContentScreen({super.key});

  @override
  State<AiContentScreen> createState() => _AiContentScreenState();
}

class _AiContentScreenState extends State<AiContentScreen> {
  final _topicController = TextEditingController(text: 'New product launch');
  final _audienceController = TextEditingController(text: 'people who love discovering new products');
  final _keywordController = TextEditingController(text: 'quality, value, everyday use');

  String _platform = 'Instagram';
  String _contentType = 'Reel';
  String _tone = 'Friendly';
  String _language = 'English';
  String _length = 'Medium';
  String _goal = 'Engagement';
  String _activeOutput = 'Caption';
  bool _includeEmojis = true;
  bool _includeHashtags = true;
  bool _generated = false;

  late Map<String, String> _outputs = {};

  final List<String> _platforms = const [
    'Instagram',
    'YouTube Shorts',
    'Facebook',
    'LinkedIn',
  ];

  final List<String> _contentTypes = const [
    'Reel',
    'Feed post',
    'Story',
    'Carousel',
    'Bio',
  ];

  final List<String> _tones = const [
    'Friendly',
    'Professional',
    'Playful',
    'Luxury',
    'Bold',
    'Inspirational',
  ];

  final List<String> _languages = const [
    'English',
    'Hindi',
    'Marathi',
  ];

  @override
  void dispose() {
    _topicController.dispose();
    _audienceController.dispose();
    _keywordController.dispose();
    super.dispose();
  }

  String get _topic {
    final value = _topicController.text.trim();
    return value.isEmpty ? 'your next big idea' : value;
  }

  String get _audience {
    final value = _audienceController.text.trim();
    return value.isEmpty ? 'your audience' : value;
  }

  String get _keywords {
    final value = _keywordController.text.trim();
    return value.isEmpty ? 'quality, value, and great experiences' : value;
  }

  String get _emoji => _includeEmojis ? ' ✨' : '';
  String get _friendlyGreeting => _tone == 'Professional'
      ? 'Hello everyone'
      : _tone == 'Playful'
          ? 'Hey besties'
          : _tone == 'Luxury'
              ? 'Discover something exceptional'
              : _tone == 'Bold'
                  ? 'Ready for something new?'
                  : _tone == 'Inspirational'
                      ? 'Your next chapter starts here'
                      : 'Hey friends';

  String _translatedLabel(String english) {
    if (_language == 'Hindi') {
      switch (english) {
        case 'Discover':
          return 'जानिए';
        case 'Shop now':
          return 'अभी खरीदें';
        case 'Learn more':
          return 'और जानें';
        case 'Save this post':
          return 'इस पोस्ट को सेव करें';
        case 'Tell us below':
          return 'नीचे कमेंट करें';
        default:
          return english;
      }
    }
    if (_language == 'Marathi') {
      switch (english) {
        case 'Discover':
          return 'जाणून घ्या';
        case 'Shop now':
          return 'आत्ताच खरेदी करा';
        case 'Learn more':
          return 'अधिक जाणून घ्या';
        case 'Save this post':
          return 'ही पोस्ट सेव्ह करा';
        case 'Tell us below':
          return 'खाली कमेंट करा';
        default:
          return english;
      }
    }
    return english;
  }

  void _generateContent() {
    final topic = _topic;
    final audience = _audience;
    final keywords = _keywords;
    final greeting = _friendlyGreeting;
    final emoji = _emoji;
    final cta = _goal == 'Sales'
        ? _translatedLabel('Shop now')
        : _goal == 'Awareness'
            ? _translatedLabel('Learn more')
            : _goal == 'Traffic'
                ? 'Visit our profile'
                : _translatedLabel('Tell us below');

    final caption = _buildCaption(
      topic: topic,
      audience: audience,
      keywords: keywords,
      greeting: greeting,
      emoji: emoji,
      cta: cta,
    );

    final hooks = [
      'Stop scrolling — this one is for you$emoji',
      'Here is something every $audience should know.',
      'What if ${topic.toLowerCase()} could make your day easier?',
      '3 things to know before you try ${topic.toLowerCase()}.',
      'We think you are going to love this$emoji',
      'The detail that makes all the difference? Keep watching.',
      'POV: You finally discover $topic.',
      'Save this idea before you forget it.',
    ];

    final hashtags = _buildHashtags(topic, keywords);

    final reelIdeas = [
      'Problem → solution: show a common challenge for $audience, then introduce $topic.',
      '3 reasons to try it: present three quick benefits using text overlays.',
      'Behind the scenes: show how you prepare, select, make, or deliver $topic.',
      'Expectation vs reality: use a relatable opening and finish with your product or service.',
      'Quick demo: show the most useful feature in under 20 seconds.',
      'Frequently asked question: answer one question your customers often ask.',
    ];

    final carouselIdeas = [
      'Slide 1: A strong hook about $topic.',
      'Slide 2: Explain the problem your audience faces.',
      'Slide 3: Introduce the solution.',
      'Slide 4: Share three benefits related to $keywords.',
      'Slide 5: Add a practical tip or example.',
      'Slide 6: Answer a common question.',
      'Slide 7: Finish with “${_translatedLabel('Save this post')}” and a clear CTA.',
    ];

    final ctas = [
      _translatedLabel('Tell us below') + ' — what do you think?',
      _translatedLabel('Save this post') + ' so you can revisit it later.',
      'Send this to someone who needs it.',
      'DM us “INFO” to get the details.',
      _translatedLabel('Learn more') + ' through our profile.',
      if (_goal == 'Sales') _translatedLabel('Shop now') + ' and explore the collection.',
    ];

    final bio = [
      '✨ ${topic.toUpperCase()}',
      'Helping $audience discover more.',
      'Focused on $keywords.',
      '👇 ${_goal == 'Sales' ? 'Explore our collection' : 'Get to know us'}',
    ].join('\n');

    setState(() {
      _outputs = {
        'Caption': caption,
        'Hooks': hooks.asMap().entries.map((e) => '${e.key + 1}. ${e.value}').join('\n\n'),
        'Hashtags': hashtags,
        'Reel ideas': reelIdeas.asMap().entries.map((e) => '${e.key + 1}. ${e.value}').join('\n\n'),
        'Carousel': carouselIdeas.join('\n'),
        'CTA ideas': ctas.asMap().entries.map((e) => '${e.key + 1}. ${e.value}').join('\n\n'),
        'Bio': bio,
      };
      _generated = true;
      _activeOutput = _contentType == 'Bio'
          ? 'Bio'
          : _contentType == 'Carousel'
              ? 'Carousel'
              : 'Caption';
    });
  }

  String _buildCaption({
    required String topic,
    required String audience,
    required String keywords,
    required String greeting,
    required String emoji,
    required String cta,
  }) {
    String body;

    if (_tone == 'Professional') {
      body = '$topic is designed with $audience in mind. '
          'Our focus is on $keywords. Explore the details and discover how it may fit your needs.';
    } else if (_tone == 'Luxury') {
      body = 'A more considered way to experience $topic. '
          'Thoughtfully focused on $keywords, created for those who appreciate the details.';
    } else if (_tone == 'Bold') {
      body = 'Meet $topic. No unnecessary fuss — just a focus on $keywords. '
          'If you are looking for something made with $audience in mind, take a closer look.';
    } else if (_tone == 'Inspirational') {
      body = 'Small discoveries can lead to great things. Let $topic be part of your journey, '
          'with a focus on $keywords and the people who matter most.';
    } else if (_tone == 'Playful') {
      body = 'Okay, but have you seen $topic yet? 👀 '
          'Made for $audience, with plenty to love about $keywords. Go on, take a peek!';
    } else {
      body = 'We have something to share with you: $topic. '
          'Created with $audience in mind, with a focus on $keywords. '
          'Take a look and tell us what you think.';
    }

    if (_length == 'Short') {
      body = '$topic — made with $audience in mind. $cta.';
    } else if (_length == 'Long') {
      body = '$body\n\nWhy it matters: the little details can make the experience more useful, '
          'enjoyable, and suited to your everyday routine.\n\n'
          'Whether you are discovering us for the first time or have been here for a while, '
          'we would love to hear what matters most to you.';
    }

    final hashtagLine = _includeHashtags ? '\n\n${_buildHashtags(topic, _keywords)}' : '';
    final greetingLine = _tone == 'Professional' ? '' : '$greeting$emoji\n\n';
    final languageNote = _language == 'English'
        ? ''
        : '\n\nNote: This draft includes selected ${_language == 'Hindi' ? 'Hindi' : 'Marathi'} CTA phrases; review the full caption for your preferred language before publishing.';

    return '$greetingLine$body\n\n$cta$emoji$hashtagLine$languageNote';
  }

  String _buildHashtags(String topic, String keywords) {
    final topicTag = topic.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
    final keywordTags = keywords
        .split(RegExp(r'[, ]+'))
        .map((word) => word.replaceAll(RegExp(r'[^a-zA-Z0-9]'), ''))
        .where((word) => word.length > 2)
        .take(3)
        .map((word) => '#${word.toLowerCase()}')
        .join(' ');

    final platformTags = _platform == 'YouTube Shorts'
        ? '#YouTubeShorts #Shorts'
        : _platform == 'LinkedIn'
            ? '#ProfessionalGrowth #Business'
            : _platform == 'Facebook'
                ? '#FacebookCommunity #SmallBusiness'
                : '#InstagramReels #InstaDaily';

    return [
      if (topicTag.isNotEmpty) '#$topicTag',
      platformTags,
      keywordTags,
      '#BrandStory #ContentIdeas',
    ].join(' ');
  }

  Future<void> _copyOutput() async {
    final text = _outputs[_activeOutput];
    if (text == null || text.isEmpty) return;

    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$_activeOutput copied to clipboard'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _resetForm() {
    setState(() {
      _topicController.text = '';
      _audienceController.text = '';
      _keywordController.text = '';
      _platform = 'Instagram';
      _contentType = 'Reel';
      _tone = 'Friendly';
      _language = 'English';
      _length = 'Medium';
      _goal = 'Engagement';
      _includeEmojis = true;
      _includeHashtags = true;
      _generated = false;
      _outputs = {};
      _activeOutput = 'Caption';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Content Studio',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            tooltip: 'Reset options',
            onPressed: _resetForm,
            icon: const Icon(Icons.restart_alt_rounded),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: AppBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
            children: [
              _buildHero(),
              const SizedBox(height: 22),
              _sectionHeading('Create your content', 'Tell us what you want to post'),
              const SizedBox(height: 14),
              _label('Topic, product, or campaign'),
              TextField(
                controller: _topicController,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  hintText: 'e.g. New product launch',
                  prefixIcon: Icon(Icons.edit_note_rounded),
                ),
              ),
              const SizedBox(height: 14),
              _label('Target audience'),
              TextField(
                controller: _audienceController,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  hintText: 'e.g. College students, skincare lovers',
                  prefixIcon: Icon(Icons.people_outline_rounded),
                ),
              ),
              const SizedBox(height: 14),
              _label('Keywords or key benefits'),
              TextField(
                controller: _keywordController,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  hintText: 'e.g. quality, affordable, easy to use',
                  prefixIcon: Icon(Icons.key_rounded),
                ),
              ),
              const SizedBox(height: 20),
              _label('Platform'),
              _choiceWrap(
                options: _platforms,
                selected: _platform,
                onSelected: (value) => setState(() => _platform = value),
              ),
              const SizedBox(height: 18),
              _label('Content format'),
              _choiceWrap(
                options: _contentTypes,
                selected: _contentType,
                onSelected: (value) => setState(() => _contentType = value),
              ),
              const SizedBox(height: 18),
              _label('Tone of voice'),
              _choiceWrap(
                options: _tones,
                selected: _tone,
                onSelected: (value) => setState(() => _tone = value),
              ),
              const SizedBox(height: 18),
              _label('Content language'),
              _choiceWrap(
                options: _languages,
                selected: _language,
                onSelected: (value) => setState(() => _language = value),
              ),
              const SizedBox(height: 18),
              _label('Caption length'),
              _choiceWrap(
                options: const ['Short', 'Medium', 'Long'],
                selected: _length,
                onSelected: (value) => setState(() => _length = value),
              ),
              const SizedBox(height: 18),
              _label('Main goal'),
              _choiceWrap(
                options: const ['Engagement', 'Sales', 'Awareness', 'Traffic'],
                selected: _goal,
                onSelected: (value) => setState(() => _goal = value),
              ),
              const SizedBox(height: 10),
              _optionTile(
                icon: Icons.emoji_emotions_outlined,
                title: 'Include emojis',
                subtitle: 'Add a little personality to the copy',
                value: _includeEmojis,
                onChanged: (value) => setState(() => _includeEmojis = value),
              ),
              _optionTile(
                icon: Icons.tag_rounded,
                title: 'Include hashtags',
                subtitle: 'Add topic and platform hashtag ideas',
                value: _includeHashtags,
                onChanged: (value) => setState(() => _includeHashtags = value),
              ),
              const SizedBox(height: 18),
              PrimaryButton(
                label: 'Generate content ideas',
                icon: Icons.auto_awesome_rounded,
                onPressed: _generateContent,
              ),
              if (_generated) ...[
                const SizedBox(height: 26),
                _sectionHeading('Your content toolkit', 'Select an output to view and copy'),
                const SizedBox(height: 13),
                _buildOutputTabs(),
                const SizedBox(height: 12),
                _buildOutputCard(),
              ],
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: AppColors.surface.withValues(alpha: .75),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline_rounded, color: AppColors.muted, size: 17),
                    SizedBox(width: 9),
                    Expanded(
                      child: Text(
                        'Demo mode: content is assembled from local templates, not generated by a live AI model. Review all copy and hashtags before publishing.',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 11,
                          height: 1.45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3B2868), Color(0xFF20233D), Color(0xFF142E38)],
        ),
        border: Border.all(color: Colors.white.withValues(alpha: .10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .10),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.auto_awesome_rounded, color: AppColors.cyan, size: 14),
                SizedBox(width: 6),
                Text(
                  'CONTENT CREATION SUITE',
                  style: TextStyle(
                    fontSize: 9,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Your next big idea,\nready for the feed.',
            style: TextStyle(
              fontSize: 26,
              height: 1.12,
              fontWeight: FontWeight.w900,
              letterSpacing: -.5,
            ),
          ),
          const SizedBox(height: 9),
          const Text(
            'Create captions, hooks, hashtags, Reel concepts and more from one workspace.',
            style: TextStyle(color: Color(0xFFD2D7E8), fontSize: 12.5, height: 1.45),
          ),
          const SizedBox(height: 16),
          const Wrap(
            spacing: 7,
            runSpacing: 7,
            children: [
              _HeroTag(icon: Icons.short_text_rounded, label: 'Captions'),
              _HeroTag(icon: Icons.play_circle_outline, label: 'Reel hooks'),
              _HeroTag(icon: Icons.tag_rounded, label: 'Hashtags'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionHeading(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(color: AppColors.muted, fontSize: 12),
        ),
      ],
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.text,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _choiceWrap({
    required List<String> options,
    required String selected,
    required ValueChanged<String> onSelected,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((option) {
        final isSelected = option == selected;
        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (_) => onSelected(option),
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : AppColors.muted,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
          selectedColor: AppColors.purple.withValues(alpha: .35),
          backgroundColor: AppColors.surface,
          side: BorderSide(
            color: isSelected ? AppColors.purple : AppColors.border,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          showCheckmark: false,
        );
      }).toList(),
    );
  }

  Widget _optionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.cyan, size: 20),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800)),
                const SizedBox(height: 3),
                Text(subtitle, style: const TextStyle(color: AppColors.muted, fontSize: 10.5)),
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppColors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildOutputTabs() {
    final tabs = ['Caption', 'Hooks', 'Hashtags', 'Reel ideas', 'Carousel', 'CTA ideas', 'Bio'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs.map((tab) {
          final selected = _activeOutput == tab;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(tab),
              selected: selected,
              onSelected: (_) => setState(() => _activeOutput = tab),
              labelStyle: TextStyle(
                color: selected ? Colors.white : AppColors.muted,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
              selectedColor: AppColors.purple.withValues(alpha: .38),
              backgroundColor: AppColors.surface,
              side: BorderSide(color: selected ? AppColors.purple : AppColors.border),
              showCheckmark: false,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildOutputCard() {
    final output = _outputs[_activeOutput] ?? '';
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.purple.withValues(alpha: .06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  _activeOutput.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.cyan,
                    fontSize: 10,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              IconButton(
                tooltip: 'Copy output',
                onPressed: _copyOutput,
                icon: const Icon(Icons.copy_rounded, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 6),
          SelectableText(
            output,
            style: const TextStyle(
              color: Color(0xFFE8EAF4),
              fontSize: 13,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _copyOutput,
                  icon: const Icon(Icons.content_copy_rounded, size: 16),
                  label: const Text('Copy'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.text,
                    side: const BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _generateContent,
                  icon: const Icon(Icons.refresh_rounded, size: 16),
                  label: const Text('Regenerate'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroTag extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HeroTag({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .09),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withValues(alpha: .08)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: AppColors.cyan),
          const SizedBox(width: 5),
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
