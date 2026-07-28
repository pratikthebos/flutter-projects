import 'package:flutter/material.dart';

import '../../core/widgets/animated_background.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/section_title.dart';
import '../../widgets/visitor_form.dart';

class VisitorScreen extends StatelessWidget {
  const VisitorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [

              const CustomAppBar(),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Visitor Check-In",
              ),

              const SizedBox(height: 24),

              const VisitorForm(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}