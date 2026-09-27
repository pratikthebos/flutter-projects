
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/app_colors.dart';
import '../widgets/app_background.dart';
import '../widgets/primary_button.dart';

class BrandKitScreen extends StatefulWidget {
  const BrandKitScreen({super.key});

  @override
  State<BrandKitScreen> createState() => _BrandKitScreenState();
}

class _BrandKitScreenState extends State<BrandKitScreen> {
  final _name = TextEditingController(text: 'Your Brand');
  final _tagline =
  TextEditingController(text: 'Made for your everyday');
  final _instagram = TextEditingController(text: '@yourbrand');
  final _website = TextEditingController(text: 'yourbrand.com');
  final _industry = TextEditingController(text: 'Lifestyle');

  Color _color = AppColors.purple;
  IconData _logoIcon = Icons.bolt_rounded;
  String _fontStyle = 'Modern';
  String _brandVoice = 'Friendly';
  String _activeTab = 'Identity';

  bool _showTagline = true;
  bool _showWebsite = true;
  bool _showPostPreview = true;

  bool _hasSaved = false;

  final List<Color> _colors = const [
    AppColors.purple,
    AppColors.pink,
    AppColors.cyan,
    AppColors.orange,
    AppColors.green,
    Color(0xFFFFD166),
    Color(0xFFEF4444),
    Color(0xFF8B9A83),
    Color(0xFFB58AE8),
    Color(0xFF64748B),
    Color(0xFFEC4899),
    Color(0xFF14B8A6),
  ];

  final List<_LogoOption> _logoOptions = const [
    _LogoOption(Icons.bolt_rounded, 'Bolt'),
    _LogoOption(Icons.auto_awesome_rounded, 'Spark'),
    _LogoOption(Icons.eco_outlined, 'Nature'),
    _LogoOption(Icons.favorite_rounded, 'Heart'),
    _LogoOption(Icons.diamond_outlined, 'Luxury'),
    _LogoOption(Icons.local_fire_department_rounded, 'Fire'),
    _LogoOption(Icons.spa_outlined, 'Organic'),
    _LogoOption(Icons.stars_rounded, 'Stars'),
    _LogoOption(Icons.shopping_bag_outlined, 'Shop'),
    _LogoOption(Icons.camera_alt_outlined, 'Creative'),
    _LogoOption(Icons.pets_outlined, 'Pets'),
    _LogoOption(Icons.coffee_rounded, 'Cafe'),
  ];

  final List<String> _fontStyles = [
    'Modern',
    'Classic',
    'Elegant',
    'Bold',
  ];

  final List<String> _brandVoices = [
    'Friendly',
    'Professional',
    'Playful',
    'Luxury',
    'Minimal',
  ];

  String get _brandName {
    final value = _name.text.trim();
    return value.isEmpty ? 'Your Brand' : value;
  }

  String get _brandTagline {
    final value = _tagline.text.trim();
    return value.isEmpty ? 'Your brand story starts here.' : value;
  }

  @override
  void dispose() {
    _name.dispose();
    _tagline.dispose();
    _instagram.dispose();
    _website.dispose();
    _industry.dispose();
    super.dispose();
  }

  void _notify(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Brand Kit',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            tooltip: 'Reset brand kit',
            onPressed: _reset,
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
              _buildHeader(),
              const SizedBox(height: 20),
              _buildTabSelector(),
              const SizedBox(height: 18),
              _buildBrandPreview(),
              const SizedBox(height: 23),
              if (_activeTab == 'Identity') ...[
                _buildIdentitySection(),
                const SizedBox(height: 23),
                _buildLogoSection(),
                const SizedBox(height: 23),
                _buildColorSection(),
              ],
              if (_activeTab == 'Style') ...[
                _buildTypographySection(),
                const SizedBox(height: 23),
                _buildVoiceSection(),
                const SizedBox(height: 23),
                _buildVisibilitySection(),
              ],
              if (_activeTab == 'Social') ...[
                _buildSocialSection(),
                const SizedBox(height: 23),
                _buildSocialPostPreview(),
              ],
              const SizedBox(height: 24),
              _buildGuidelinesCard(),
              const SizedBox(height: 15),
              PrimaryButton(
                label: 'Save brand preview',
                icon: Icons.check_circle_outline_rounded,
                onPressed: _savePreview,
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: _copyGuidelines,
                icon: const Icon(Icons.copy_rounded),
                label: const Text('Copy brand guidelines'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.cyan,
                  side: const BorderSide(color: AppColors.border),
                  minimumSize: const Size.fromHeight(49),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Demo mode: your brand settings are held in this screen '
                    'session. Persistent saving and image export are not connected.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 10,
                  height: 1.5,
                ),
              ),
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
            color: _color.withValues(alpha: 0.13),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: _color.withValues(alpha: 0.30),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.auto_awesome_rounded,
                color: _color,
                size: 14,
              ),
              const SizedBox(width: 6),
              const Text(
                'BRAND IDENTITY STUDIO',
                style: TextStyle(
                  fontSize: 9,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 13),
        const Text(
          'Make your brand unforgettable.',
          style: TextStyle(
            fontSize: 25,
            height: 1.2,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'Build a consistent visual identity for every post, '
              'campaign and customer touchpoint.',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 12,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildTabSelector() {
    final tabs = ['Identity', 'Style', 'Social'];

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: tabs.map((tab) {
          final selected = _activeTab == tab;

          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _activeTab = tab),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(vertical: 11),
                decoration: BoxDecoration(
                  color: selected
                      ? _color.withValues(alpha: 0.20)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Text(
                  tab,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selected ? _color : AppColors.muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBrandPreview() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _color.withValues(alpha: 0.95),
            _color.withValues(alpha: 0.55),
            AppColors.surface,
          ],
        ),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.12),
        ),
        boxShadow: [
          BoxShadow(
            color: _color.withValues(alpha: 0.13),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 53,
                height: 53,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.17),
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.20),
                  ),
                ),
                child: Icon(
                  _logoIcon,
                  color: Colors.white,
                  size: 29,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.13),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified_rounded,
                      size: 13,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'BRAND PREVIEW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.7,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Text(
            _brandName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: _headingStyle(
              size: 29,
              color: Colors.white,
            ),
          ),
          if (_showTagline) ...[
            const SizedBox(height: 8),
            Text(
              _brandTagline,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.86),
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ],
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: Text(
                  _brandVoice.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                _fontStyle.toUpperCase(),
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.75),
                  fontSize: 8,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 4,
            width: 75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _headingStyle({
    required double size,
    required Color color,
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: _fontStyle == 'Classic' ||
          _fontStyle == 'Elegant'
          ? FontWeight.w700
          : FontWeight.w900,
      fontStyle: _fontStyle == 'Elegant'
          ? FontStyle.italic
          : FontStyle.normal,
      letterSpacing: _fontStyle == 'Classic' ? 0.3 : -0.5,
    );
  }

  Widget _buildSectionTitle(
      String title,
      String subtitle,
      IconData icon,
      ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: _color.withValues(alpha: 0.13),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: _color, size: 19),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.muted,
                  fontSize: 11,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIdentitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          'Brand information',
          'Tell your audience who you are.',
          Icons.edit_note_rounded,
        ),
        const SizedBox(height: 17),
        _textField(
          controller: _name,
          label: 'Brand name',
          hint: 'Enter your brand name',
          icon: Icons.storefront_outlined,
          maxLength: 40,
        ),
        const SizedBox(height: 13),
        _textField(
          controller: _tagline,
          label: 'Brand tagline',
          hint: 'Your brand promise in a few words',
          icon: Icons.short_text_rounded,
          maxLength: 70,
        ),
        const SizedBox(height: 13),
        _textField(
          controller: _industry,
          label: 'Industry / niche',
          hint: 'Fashion, skincare, technology...',
          icon: Icons.category_outlined,
          maxLength: 40,
        ),
      ],
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLength = 100,
  }) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      onChanged: (_) {
        setState(() => _hasSaved = false);
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        counterText: '',
        prefixIcon: Icon(icon),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          'Logo symbol',
          'Choose a symbol for your brand preview.',
          Icons.interests_outlined,
        ),
        const SizedBox(height: 15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _logoOptions.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.94,
          ),
          itemBuilder: (context, index) {
            final option = _logoOptions[index];
            final selected = _logoIcon == option.icon;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _logoIcon = option.icon;
                  _hasSaved = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: selected
                      ? _color.withValues(alpha: 0.15)
                      : AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: selected ? _color : AppColors.border,
                    width: selected ? 1.5 : 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      option.icon,
                      color: selected ? _color : AppColors.muted,
                      size: 24,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      option.label,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: selected ? _color : AppColors.muted,
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildColorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          'Brand colors',
          'Select your primary accent color.',
          Icons.palette_outlined,
        ),
        const SizedBox(height: 17),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: _color,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Primary accent',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _hexColor(_color),
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.check_circle_rounded,
                    color: _color,
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: _colors.map((color) {
                  final selected = _color == color;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _color = color;
                        _hasSaved = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selected
                              ? Colors.white
                              : Colors.transparent,
                          width: 3,
                        ),
                        boxShadow: selected
                            ? [
                          BoxShadow(
                            color: color.withValues(alpha: 0.4),
                            blurRadius: 10,
                          ),
                        ]
                            : [],
                      ),
                      child: selected
                          ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 18,
                      )
                          : null,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTypographySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          'Typography personality',
          'Choose how your brand communicates visually.',
          Icons.text_fields_rounded,
        ),
        const SizedBox(height: 16),
        ..._fontStyles.map((style) {
          final selected = _fontStyle == style;

          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _fontStyle = style;
                  _hasSaved = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(
                    color: selected ? _color : AppColors.border,
                    width: selected ? 1.5 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 47,
                      height: 47,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Text(
                        'Aa',
                        style: _headingStyle(
                          size: 20,
                          color: _color,
                        ),
                      ),
                    ),
                    const SizedBox(width: 13),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            style,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              fontStyle: style == 'Elegant'
                                  ? FontStyle.italic
                                  : FontStyle.normal,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _fontDescription(style),
                            style: const TextStyle(
                              color: AppColors.muted,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      selected
                          ? Icons.radio_button_checked_rounded
                          : Icons.radio_button_off_rounded,
                      color: selected ? _color : AppColors.muted,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        const SizedBox(height: 10),
        const Text(
          'Demo note: these options change the preview styling. '
              'They do not load or embed external font files.',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 10,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  String _fontDescription(String style) {
    switch (style) {
      case 'Classic':
        return 'Timeless, balanced and trustworthy';
      case 'Elegant':
        return 'Refined, expressive and premium';
      case 'Bold':
        return 'Confident, strong and memorable';
      default:
        return 'Clean, fresh and contemporary';
    }
  }

  Widget _buildVoiceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          'Brand voice',
          'Set the tone for captions and campaigns.',
          Icons.record_voice_over_outlined,
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _brandVoices.map((voice) {
            final selected = _brandVoice == voice;

            return ChoiceChip(
              label: Text(voice),
              selected: selected,
              showCheckmark: false,
              onSelected: (_) {
                setState(() {
                  _brandVoice = voice;
                  _hasSaved = false;
                });
              },
              selectedColor: _color.withValues(alpha: 0.20),
              backgroundColor: AppColors.surface,
              side: BorderSide(
                color: selected ? _color : AppColors.border,
              ),
              labelStyle: TextStyle(
                color: selected ? _color : AppColors.muted,
                fontWeight: FontWeight.w800,
                fontSize: 11,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: _color.withValues(alpha: 0.09),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _color.withValues(alpha: 0.20),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.lightbulb_outline_rounded,
                color: _color,
                size: 19,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  _voiceDescription(_brandVoice),
                  style: const TextStyle(
                    fontSize: 11,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _voiceDescription(String voice) {
    switch (voice) {
      case 'Professional':
        return 'Use clear, confident language. Focus on expertise, '
            'reliability and measurable value.';
      case 'Playful':
        return 'Use energetic wording, light humor and a conversational '
            'style that feels fun and approachable.';
      case 'Luxury':
        return 'Use refined, concise language. Emphasize craftsmanship, '
            'exclusivity and thoughtful details.';
      case 'Minimal':
        return 'Keep messages short, direct and uncluttered. '
            'Let the product and visuals speak for themselves.';
      default:
        return 'Use warm, helpful language. Speak naturally, '
            'make people feel welcome and build connection.';
    }
  }

  Widget _buildVisibilitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          'Preview settings',
          'Choose what appears in your brand card.',
          Icons.tune_rounded,
        ),
        const SizedBox(height: 10),
        _switchTile(
          'Show tagline',
          'Display your brand promise.',
          _showTagline,
              (value) => setState(() => _showTagline = value),
        ),
        _switchTile(
          'Show website',
          'Display your website in the post preview.',
          _showWebsite,
              (value) => setState(() => _showWebsite = value),
        ),
        _switchTile(
          'Show Instagram post',
          'Display the social media mockup.',
          _showPostPreview,
              (value) => setState(() => _showPostPreview = value),
        ),
      ],
    );
  }

  Widget _switchTile(
      String title,
      String subtitle,
      bool value,
      ValueChanged<bool> onChanged,
      ) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        value: value,
        activeThumbColor: _color,
        onChanged: onChanged,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          'Social identity',
          'Add your public-facing brand details.',
          Icons.alternate_email_rounded,
        ),
        const SizedBox(height: 17),
        _textField(
          controller: _instagram,
          label: 'Instagram handle',
          hint: '@yourbrand',
          icon: Icons.camera_alt_outlined,
          maxLength: 35,
        ),
        const SizedBox(height: 13),
        _textField(
          controller: _website,
          label: 'Website',
          hint: 'yourbrand.com',
          icon: Icons.language_rounded,
          maxLength: 100,
        ),
        const SizedBox(height: 18),
        _buildSocialPostPreview(),
      ],
    );
  }

  Widget _buildSocialPostPreview() {
    if (!_showPostPreview) {
      return const SizedBox.shrink();
    }

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
          const Text(
            'INSTAGRAM-STYLE PREVIEW',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 9,
              letterSpacing: 1,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                width: 39,
                height: 39,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      _color,
                      _color.withValues(alpha: 0.45),
                    ],
                  ),
                ),
                child: Icon(
                  _logoIcon,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _instagram.text.trim().isEmpty
                          ? '@yourbrand'
                          : _instagram.text.trim(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      _industry.text.trim().isEmpty
                          ? 'Lifestyle'
                          : _industry.text.trim(),
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.more_horiz_rounded,
                color: AppColors.muted,
              ),
            ],
          ),
          const SizedBox(height: 14),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _color,
                    _color.withValues(alpha: 0.60),
                    AppColors.surface,
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -25,
                    top: -25,
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.06),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _logoIcon,
                          color: Colors.white,
                          size: 32,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _brandName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: _headingStyle(
                            size: 26,
                            color: Colors.white,
                          ),
                        ),
                        if (_showTagline) ...[
                          const SizedBox(height: 7),
                          Text(
                            _brandTagline,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              height: 1.5,
                            ),
                          ),
                        ],
                        const Spacer(),
                        if (_showWebsite &&
                            _website.text.trim().isNotEmpty)
                          Text(
                            _website.text.trim(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 13),
          const Row(
            children: [
              Icon(Icons.favorite_border_rounded, size: 20),
              SizedBox(width: 13),
              Icon(Icons.mode_comment_outlined, size: 20),
              SizedBox(width: 13),
              Icon(Icons.send_outlined, size: 20),
              Spacer(),
              Icon(Icons.bookmark_border_rounded, size: 20),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _brandName,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Discover the ${_brandVoice.toLowerCase()} side of '
                '${_brandName.toLowerCase()}. ✨',
            style: const TextStyle(
              fontSize: 11,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuidelinesCard() {
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _color.withValues(alpha: 0.13),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.menu_book_rounded,
                  color: _color,
                ),
              ),
              const SizedBox(width: 11),
              const Expanded(
                child: Text(
                  'Brand guidelines',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const Icon(
                Icons.auto_awesome_rounded,
                color: AppColors.muted,
              ),
            ],
          ),
          const SizedBox(height: 18),
          _guidelineRow('Brand name', _brandName),
          _guidelineRow('Tagline', _brandTagline),
          _guidelineRow(
            'Industry',
            _industry.text.trim().isEmpty
                ? 'Not specified'
                : _industry.text.trim(),
          ),
          _guidelineRow('Primary color', _hexColor(_color)),
          _guidelineRow('Typography', _fontStyle),
          _guidelineRow('Brand voice', _brandVoice),
          _guidelineRow('Logo symbol', _logoLabel),
        ],
      ),
    );
  }

  String get _logoLabel {
    for (final option in _logoOptions) {
      if (option.icon == _logoIcon) return option.label;
    }
    return 'Custom';
  }

  Widget _guidelineRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 11,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _hexColor(Color color) {
    return '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
  }

  void _savePreview() {
    if (_name.text.trim().isEmpty) {
      _notify('Please enter a brand name.');
      return;
    }

    setState(() => _hasSaved = true);

    _notify('Brand preview updated for this session.');
  }

  Future<void> _copyGuidelines() async {
    final guidelines = '''
${_brandName.toUpperCase()} — BRAND GUIDELINES

Brand name: $_brandName
Tagline: $_brandTagline
Industry: ${_industry.text.trim().isEmpty ? 'Not specified' : _industry.text.trim()}
Primary color: ${_hexColor(_color)}
Logo symbol: $_logoLabel
Typography style: $_fontStyle
Brand voice: $_brandVoice
Instagram: ${_instagram.text.trim().isEmpty ? 'Not specified' : _instagram.text.trim()}
Website: ${_website.text.trim().isEmpty ? 'Not specified' : _website.text.trim()}

Brand voice guidance:
${_voiceDescription(_brandVoice)}

Use the selected primary color, logo symbol, typography style,
and brand voice consistently across marketing materials.
''';

    await Clipboard.setData(ClipboardData(text: guidelines));

    if (!mounted) return;

    _notify('Brand guidelines copied to clipboard.');
  }

  void _reset() {
    setState(() {
      _name.text = 'Your Brand';
      _tagline.text = 'Made for your everyday';
      _instagram.text = '@yourbrand';
      _website.text = 'yourbrand.com';
      _industry.text = 'Lifestyle';

      _color = AppColors.purple;
      _logoIcon = Icons.bolt_rounded;
      _fontStyle = 'Modern';
      _brandVoice = 'Friendly';
      _activeTab = 'Identity';

      _showTagline = true;
      _showWebsite = true;
      _showPostPreview = true;
      _hasSaved = false;
    });

    _notify('Brand kit reset.');
  }
}

class _LogoOption {
  final IconData icon;
  final String label;

  const _LogoOption(this.icon, this.label);
}