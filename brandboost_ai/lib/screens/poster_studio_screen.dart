import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../widgets/app_background.dart';
import '../widgets/primary_button.dart';

class PosterStudioScreen extends StatefulWidget {
  const PosterStudioScreen({super.key});
  @override
  State<PosterStudioScreen> createState() => _PosterStudioScreenState();
}

class _PosterStudioScreenState extends State<PosterStudioScreen> {
  final _title = TextEditingController(text: 'A little glow goes a long way');
  final _offer = TextEditingController(text: '20% OFF');
  Color _accent = AppColors.purple;

  @override
  void dispose() { _title.dispose(); _offer.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Poster Studio', style: TextStyle(fontWeight: FontWeight.w900))),
    body: AppBackground(child: SafeArea(child: ListView(padding: const EdgeInsets.all(20), children: [
      const Text('Create a clean promotional concept for your next feed post.', style: TextStyle(color: AppColors.muted)),
      const SizedBox(height: 18),
      Container(height: 290, padding: const EdgeInsets.all(22), decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [_accent, const Color(0xFF151629), const Color(0xFF080A12)]),
        border: Border.all(color: Colors.white.withValues(alpha: .12)),
      ), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('YOUR BRAND  /  NEW DROP', style: TextStyle(fontSize: 9, letterSpacing: 2, fontWeight: FontWeight.w900)),
        const Spacer(),
        const Icon(Icons.spa_outlined, size: 55),
        const SizedBox(height: 18),
        Text(_title.text, style: const TextStyle(fontSize: 25, height: 1.08, fontWeight: FontWeight.w900), maxLines: 3, overflow: TextOverflow.ellipsis),
        const SizedBox(height: 12),
        Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Text(_offer.text.toUpperCase(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900))),
        const Spacer(),
        const Text('SHOP THE COLLECTION  ↗', style: TextStyle(fontSize: 9, letterSpacing: 1.3, fontWeight: FontWeight.w900)),
      ])),
      const SizedBox(height: 20),
      TextField(controller: _title, onChanged: (_) => setState(() {}), decoration: const InputDecoration(labelText: 'Poster headline')),
      const SizedBox(height: 12),
      TextField(controller: _offer, onChanged: (_) => setState(() {}), decoration: const InputDecoration(labelText: 'Offer text')),
      const SizedBox(height: 16),
      const Text('Accent colour', style: TextStyle(fontWeight: FontWeight.w800)),
      const SizedBox(height: 10),
      Wrap(spacing: 12, children: [AppColors.purple, AppColors.pink, AppColors.cyan, AppColors.orange, AppColors.green].map((c) =>
        GestureDetector(onTap: () => setState(() => _accent = c), child: Container(width: 34, height: 34,
          decoration: BoxDecoration(color: c, shape: BoxShape.circle, border: Border.all(color: _accent == c ? Colors.white : Colors.transparent, width: 3))))).toList()),
      const SizedBox(height: 18),
      PrimaryButton(label: 'Preview updated design', icon: Icons.refresh_rounded, onPressed: () => setState(() {})),
      const SizedBox(height: 10),
      const Text('Preview only. Image export is not connected in this demo.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.muted, fontSize: 11)),
    ]))),
  );
}
