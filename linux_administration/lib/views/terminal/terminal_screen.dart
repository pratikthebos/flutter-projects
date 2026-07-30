import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/terminal_widget.dart';
import '../../core/widgets/typing_terminal.dart';

import '../../models/module_model.dart';

import '../../viewmodels/terminal_viewmodel.dart';

import '../result/result_screen.dart';

class TerminalScreen extends StatefulWidget {
  final ModuleModel module;

  const TerminalScreen({
    super.key,
    required this.module,
  });

  @override
  State<TerminalScreen> createState() => _TerminalScreenState();
}

class _TerminalScreenState extends State<TerminalScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final vm = context.read<TerminalViewModel>();

      await vm.run(widget.module);

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ResultScreen(
              module: widget.module,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TerminalViewModel>();

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: Text(widget.module.title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TerminalWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$ ${widget.module.command}",
                style: const TextStyle(
                  color: AppColors.terminalOrange,
                  fontFamily: "monospace",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TypingTerminal(
                text: vm.displayedText,
              ),

              if (vm.loading) ...[
                const SizedBox(height: 20),

                const Row(
                  children: [
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.success,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "Executing command...",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}