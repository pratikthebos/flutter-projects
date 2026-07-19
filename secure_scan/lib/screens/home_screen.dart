import 'package:flutter/material.dart';

import '../models/security_report.dart';
import '../services/fake_data.dart';
import '../widgets/animated_background.dart';
import '../widgets/glass_button.dart';
import '../widgets/glass_card.dart';
import '../widgets/glass_textfield.dart';
import 'report_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _urlController = TextEditingController();

  bool _loading = false;

  Future<void> scanWebsite() async {
    if (_urlController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a website URL"),
        ),
      );
      return;
    }

    setState(() {
      _loading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    final SecurityReport report =
    FakeData.generateReport(_urlController.text.trim());

    if (!mounted) return;

    setState(() {
      _loading = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ReportScreen(report: report),
      ),
    );
  }

  Widget recentCard(String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GlassCard(
        onTap: () {
          _urlController.text = url;
          setState(() {});
        },
        child: Row(
          children: [
            const CircleAvatar(
              radius: 22,
              child: Icon(Icons.language),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    url,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    "Tap to scan",
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white54,
              size: 18,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Hero(
                  tag: "shield",
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff00E5FF),
                          Color(0xff2979FF),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.security,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Website Security Scanner",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Paste your website URL and generate a beautiful VAPT report.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 35),

                GlassTextField(
                  controller: _urlController,
                ),

                const SizedBox(height: 25),

                GlassButton(
                  text: "Scan Website",
                  icon: Icons.security,
                  loading: _loading,
                  onPressed: scanWebsite,
                ),

                const SizedBox(height: 40),

                const Text(
                  "Recent Scans",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                ...FakeData.recentScans
                    .map((e) => recentCard(e))
                    .toList(),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}