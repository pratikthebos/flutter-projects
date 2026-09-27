import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../widgets/app_background.dart';
import '../widgets/primary_button.dart';
import '../widgets/section_title.dart';

class ReelStudioScreen extends StatefulWidget {
  const ReelStudioScreen({super.key});

  @override
  State<ReelStudioScreen> createState() => _ReelStudioScreenState();
}

class _ReelStudioScreenState extends State<ReelStudioScreen> {
  final _productController = TextEditingController(text: 'Glow Serum');
  final _offerController = TextEditingController(text: '20% OFF');
  final _audienceController = TextEditingController(text: 'skincare lovers');
  String _goal = 'Sales';
  String _style = 'Luxury';
  String _duration = '15 sec';
  int _template = 0;
  bool _showScript = false;

  final _templates = const [
    _ReelTemplate('Luxury reveal', 'Premium product reveal', Icons.diamond_outlined, AppColors.purple),
    _ReelTemplate('Problem → solution', 'Show the pain point, then your product', Icons.lightbulb_outline, AppColors.cyan),
    _ReelTemplate('Offer drop', 'Fast-paced promotional Reel', Icons.local_offer_outlined, AppColors.pink),
    _ReelTemplate('Behind the scenes', 'Make your brand feel personal', Icons.videocam_outlined, AppColors.orange),
  ];

  @override
  void dispose() {
    _productController.dispose();
    _offerController.dispose();
    _audienceController.dispose();
    super.dispose();
  }

  String get _hook {
    final product = _productController.text.trim().isEmpty ? 'your product' : _productController.text.trim();
    switch (_template) {
      case 1: return 'Still struggling with your routine? Meet $product.';
      case 2: return 'Wait! Your next favourite deal is here 👀';
      case 3: return 'A little look behind the brand ✨';
      default: return 'Your new daily luxury starts with $product.';
    }
  }

  String get _script {
    final product = _productController.text.trim().isEmpty ? 'your product' : _productController.text.trim();
    final offer = _offerController.text.trim().isEmpty ? 'a special offer' : _offerController.text.trim();
    return '0–3s  •  HOOK\n$_hook\n\n'
        '3–7s  •  SHOW THE PRODUCT\nUse a close-up, natural light and a slow camera movement to reveal $product.\n\n'
        '7–11s  •  VALUE / OFFER\nHighlight the key benefit, then show $offer on screen.\n\n'
        '11–${_duration == '15 sec' ? '15' : _duration == '30 sec' ? '30' : '60'}s  •  CTA\nInvite viewers to tap the link, save this Reel, or send you a DM.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
                sliver: SliverList(delegate: SliverChildListDelegate([
                  Row(children: [
                    IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_rounded)),
                    const SizedBox(width: 4),
                    const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Reels Studio', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900)),
                      Text('SHORT-FORM VIDEO PLAYBOOK', style: TextStyle(color: AppColors.muted, fontSize: 9, letterSpacing: 1.6, fontWeight: FontWeight.w700)),
                    ])),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(color: AppColors.pink.withValues(alpha: .13), borderRadius: BorderRadius.circular(30)),
                      child: const Row(children: [Icon(Icons.auto_awesome, size: 13, color: AppColors.pink), SizedBox(width: 5), Text('PRO', style: TextStyle(color: AppColors.pink, fontWeight: FontWeight.w900, fontSize: 10))])),
                  ]),
                  const SizedBox(height: 22),
                  const SectionTitle(title: 'Your Reel concept', subtitle: 'Build a creative brief and preview the story'),
                  const SizedBox(height: 15),
                  _ReelPreview(
                    template: _templates[_template],
                    product: _productController.text,
                    offer: _offerController.text,
                    hook: _hook,
                    duration: _duration,
                  ),
                  const SizedBox(height: 24),
                  const SectionTitle(title: 'Choose a creative direction', subtitle: 'Start with a proven short-video structure'),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 124,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _templates.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final item = _templates[index];
                        final selected = _template == index;
                        return GestureDetector(
                          onTap: () => setState(() { _template = index; _showScript = false; }),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            width: 145,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: selected ? item.color.withValues(alpha: .14) : AppColors.surface,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: selected ? item.color : AppColors.border, width: selected ? 1.5 : 1),
                            ),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Icon(item.icon, color: item.color, size: 24),
                              const Spacer(),
                              Text(item.name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12)),
                              const SizedBox(height: 4),
                              Text(item.subtitle, maxLines: 2, overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: AppColors.muted, fontSize: 9.5, height: 1.25)),
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  const SectionTitle(title: 'Reel details', subtitle: 'Personalise the idea for your business'),
                  const SizedBox(height: 13),
                  _FieldLabel(label: 'Product or service'),
                  TextField(controller: _productController, onChanged: (_) => setState(() {}),
                    decoration: const InputDecoration(hintText: 'e.g. Glow Serum', prefixIcon: Icon(Icons.shopping_bag_outlined))),
                  const SizedBox(height: 13),
                  _FieldLabel(label: 'Offer / key message'),
                  TextField(controller: _offerController, onChanged: (_) => setState(() {}),
                    decoration: const InputDecoration(hintText: 'e.g. 20% OFF', prefixIcon: Icon(Icons.local_offer_outlined))),
                  const SizedBox(height: 13),
                  _FieldLabel(label: 'Target audience'),
                  TextField(controller: _audienceController,
                    decoration: const InputDecoration(hintText: 'Who is this Reel for?', prefixIcon: Icon(Icons.people_outline))),
                  const SizedBox(height: 17),
                  _FieldLabel(label: 'Campaign goal'),
                  Wrap(spacing: 8, runSpacing: 8, children: ['Sales', 'Reach', 'Engagement', 'Followers'].map((item) =>
                    _ChoiceChip(label: item, selected: _goal == item, onTap: () => setState(() => _goal = item))).toList()),
                  const SizedBox(height: 17),
                  _FieldLabel(label: 'Visual style'),
                  Wrap(spacing: 8, runSpacing: 8, children: ['Luxury', 'Minimal', 'Bold', 'Playful'].map((item) =>
                    _ChoiceChip(label: item, selected: _style == item, onTap: () => setState(() => _style = item))).toList()),
                  const SizedBox(height: 17),
                  _FieldLabel(label: 'Video duration'),
                  Wrap(spacing: 8, children: ['15 sec', '30 sec', '60 sec'].map((item) =>
                    _ChoiceChip(label: item, selected: _duration == item, onTap: () => setState(() => _duration = item))).toList()),
                  const SizedBox(height: 22),
                  PrimaryButton(label: _showScript ? 'Refresh Reel script' : 'Generate Reel script', icon: Icons.auto_awesome,
                    onPressed: () => setState(() => _showScript = true)),
                  if (_showScript) ...[
                    const SizedBox(height: 18),
                    _ScriptCard(script: _script, audience: _audienceController.text, goal: _goal, style: _style, product: _productController.text),
                  ],
                  const SizedBox(height: 16),
                  const Text('This is a local demo generator. It creates a planning script and preview; it does not render or publish a video.',
                    textAlign: TextAlign.center, style: TextStyle(color: AppColors.muted, fontSize: 10.5, height: 1.4)),
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReelTemplate {
  final String name, subtitle;
  final IconData icon;
  final Color color;
  const _ReelTemplate(this.name, this.subtitle, this.icon, this.color);
}

class _ReelPreview extends StatelessWidget {
  final _ReelTemplate template;
  final String product, offer, hook, duration;
  const _ReelPreview({required this.template, required this.product, required this.offer, required this.hook, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 238,
        height: 405,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF090B13),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.white.withValues(alpha: .17), width: 1.4),
          boxShadow: [BoxShadow(color: template.color.withValues(alpha: .16), blurRadius: 35, spreadRadius: 2)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
                colors: [template.color.withValues(alpha: .85), const Color(0xFF19172B), const Color(0xFF090B13)]),
            ),
            child: Stack(children: [
              Positioned(top: 17, left: 14, right: 14, child: Row(children: [
                Container(width: 28, height: 28, decoration: BoxDecoration(color: Colors.white.withValues(alpha: .18), shape: BoxShape.circle),
                  child: const Icon(Icons.bolt, size: 17)),
                const SizedBox(width: 7),
                const Expanded(child: Text('yourbrand.co', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 10))),
                const Icon(Icons.more_vert, size: 18),
              ])),
              Positioned(top: 78, left: 14, right: 14, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(template.name.toUpperCase(), style: const TextStyle(fontSize: 8, letterSpacing: 2, fontWeight: FontWeight.w900, color: Colors.white70)),
                const SizedBox(height: 10),
                Text(product.isEmpty ? 'Your product' : product, maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 26, height: 1.03, fontWeight: FontWeight.w900, letterSpacing: -.8)),
                const SizedBox(height: 9),
                Text(hook, maxLines: 3, overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10, height: 1.35, color: Colors.white.withValues(alpha: .86))),
              ])),
              Positioned(top: 202, left: 0, right: 0, child: Center(
                child: Container(
                  width: 128, height: 128,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [Colors.white.withValues(alpha: .25), template.color.withValues(alpha: .12), Colors.transparent]),
                    border: Border.all(color: Colors.white.withValues(alpha: .25)),
                  ),
                  child: Icon(Icons.spa_outlined, size: 58, color: Colors.white.withValues(alpha: .92)),
                ),
              )),
              Positioned(left: 14, right: 14, bottom: 43, child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Row(children: [
                  Expanded(child: Text(offer.isEmpty ? 'SPECIAL OFFER' : offer.toUpperCase(),
                    maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Color(0xFF151525), fontSize: 11, fontWeight: FontWeight.w900))),
                  const Icon(Icons.arrow_outward_rounded, size: 15, color: Color(0xFF151525)),
                ]),
              )),
              Positioned(bottom: 12, left: 14, right: 14, child: Row(children: [
                const Icon(Icons.favorite_border, size: 14), const SizedBox(width: 4),
                const Icon(Icons.chat_bubble_outline, size: 14), const SizedBox(width: 4),
                const Icon(Icons.send_outlined, size: 14), const Spacer(),
                Text(duration, style: const TextStyle(fontSize: 9, color: Colors.white70)),
              ])),
            ]),
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String label;
  const _FieldLabel({required this.label});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.text)),
  );
}

class _ChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _ChoiceChip({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) => ChoiceChip(
    label: Text(label),
    selected: selected,
    onSelected: (_) => onTap(),
    labelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: selected ? Colors.white : AppColors.muted),
    selectedColor: AppColors.purple.withValues(alpha: .35),
    backgroundColor: AppColors.surface,
    side: BorderSide(color: selected ? AppColors.purple : AppColors.border),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}

class _ScriptCard extends StatelessWidget {
  final String script, audience, goal, style, product;
  const _ScriptCard({required this.script, required this.audience, required this.goal, required this.style, required this.product});

  @override
  Widget build(BuildContext context) {
    final hashtags = '#${product.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '')} #Reels #SmallBusiness #BrandStory #${goal}';
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(22), border: Border.all(color: AppColors.border)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Expanded(child: Text('YOUR REEL PLAYBOOK', style: TextStyle(fontSize: 10, letterSpacing: 1.3, color: AppColors.cyan, fontWeight: FontWeight.w900))),
          IconButton(tooltip: 'Copy script', onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Copy action can be connected to Clipboard in your next iteration.')));
          }, icon: const Icon(Icons.copy_rounded, size: 17)),
        ]),
        const SizedBox(height: 6),
        Text(script, style: const TextStyle(fontSize: 12.5, height: 1.55, color: Color(0xFFE4E7F2))),
        const Divider(height: 26, color: AppColors.border),
        _MiniInfo(label: 'Audience', value: audience.isEmpty ? 'Your target audience' : audience),
        _MiniInfo(label: 'Style', value: style),
        _MiniInfo(label: 'Goal', value: goal),
        const SizedBox(height: 10),
        const Text('CAPTION STARTER', style: TextStyle(fontSize: 10, color: AppColors.pink, fontWeight: FontWeight.w900, letterSpacing: 1)),
        const SizedBox(height: 6),
        Text('Meet ${product.isEmpty ? 'your new favourite' : product} ✨ Save this for later and DM us “INFO” to learn more.',
          style: const TextStyle(fontSize: 12.5, height: 1.45)),
        const SizedBox(height: 12),
        const Text('HASHTAG IDEAS', style: TextStyle(fontSize: 10, color: AppColors.pink, fontWeight: FontWeight.w900, letterSpacing: 1)),
        const SizedBox(height: 6),
        SelectableText(hashtags, style: const TextStyle(fontSize: 12, color: AppColors.cyan, height: 1.4)),
      ]),
    );
  }
}

class _MiniInfo extends StatelessWidget {
  final String label, value;
  const _MiniInfo({required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 7),
    child: Row(children: [
      SizedBox(width: 72, child: Text(label, style: const TextStyle(color: AppColors.muted, fontSize: 11))),
      Expanded(child: Text(value, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700))),
    ]),
  );
}
