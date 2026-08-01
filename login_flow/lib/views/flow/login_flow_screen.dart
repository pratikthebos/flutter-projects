import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/api_steps.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/progress_header.dart';

import '../../viewmodels/flow_viewmodel.dart';

import '../../widgets/api_card.dart';
import '../../widgets/backend_card.dart';
import '../../widgets/database_card.dart';
import '../../widgets/json_card.dart';
import '../../widgets/jwt_card.dart';
import '../../widgets/request_card.dart';
import '../../widgets/response_card.dart';
import '../../widgets/timeline.dart';
import '../../widgets/token_card.dart';

import '../dashboard/dashboard_screen.dart';

class LoginFlowScreen extends StatefulWidget {
  const LoginFlowScreen({super.key});

  @override
  State<LoginFlowScreen> createState() => _LoginFlowScreenState();
}

class _LoginFlowScreenState extends State<LoginFlowScreen> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {

      final vm = context.read<FlowViewModel>();

      await vm.startFlow();

      // Show the last step briefly
      await Future.delayed(
        const Duration(milliseconds: 800),
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        ),
      );

    });
  }

  void scrollToBottom() {

    WidgetsBinding.instance.addPostFrameCallback((_) {

      if (!_scrollController.hasClients) return;

      _scrollController.animateTo(

        _scrollController.position.maxScrollExtent,

        duration: const Duration(milliseconds: 700),

        curve: Curves.easeInOut,

      );

    });

  }

  int lastStep = 0;

  @override
  Widget build(BuildContext context) {

    final vm = context.watch<FlowViewModel>();

    if (vm.currentStep != lastStep) {

      lastStep = vm.currentStep;

      scrollToBottom();

    }

    return Scaffold(

      backgroundColor: AppColors.background,

      body: SafeArea(

        child: Column(

          children: [

            const SizedBox(height: 15),

            const Padding(

              padding: EdgeInsets.symmetric(horizontal: 20),

              child: ProgressHeader(),

            ),

            const SizedBox(height: 15),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 10),

              child: Timeline(

                currentStep: vm.currentStep,

                total: ApiSteps.steps.length,

              ),

            ),

            const Divider(height: 1),

            Expanded(

              child: ListView(

                controller: _scrollController,

                padding: const EdgeInsets.all(20),

                children: [

                  if (vm.currentStep >= 1) const RequestCard(),

          if (vm.currentStep >= 2) const ApiCard(),

    if (vm.currentStep >= 3) const BackendCard(),

    if (vm.currentStep >= 4) const DatabaseCard(),

    if (vm.currentStep >= 5) const JwtCard(),

    if (vm.currentStep >= 6) const ResponseCard(),

    if (vm.currentStep >= 7) const JsonCard(),

    if (vm.currentStep >= 8) const TokenCard(),

                  const SizedBox(height:40),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

  @override
  void dispose() {

    _scrollController.dispose();

    super.dispose();

  }

}